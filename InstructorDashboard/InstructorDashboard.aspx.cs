using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMU_Campus
{
    public partial class InstructorDashboard : System.Web.UI.Page
    {
        // Questions for per-question averages
        string[] questions = new string[]
        {
            "Course objectives were clear",
            "Instructor was committed",
            "Course was well organized",
            "Instructor communicated clearly",
            "Feedback was helpful",
            "Grading was fair",
            "Course materials were useful",
            "Overall satisfaction"
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userEmail = Session["UserEmail"]?.ToString();
                if (string.IsNullOrEmpty(userEmail))
                {
                    Ratings.Text = "<span style='color:red;'>User session expired or email not provided.</span>";
                    return;
                }

                int instructorId = GetInstructorID(userEmail);
                if (instructorId < 1)
                {
                    Ratings.Text = "<span style='color:red;'>Instructor not found.</span>";
                    return;
                }

                ViewState["InstructorID"] = instructorId;

                LoadCourses(instructorId);

                // ✅ Skip loading ratings if course not selected yet
                if (!string.IsNullOrWhiteSpace(DropDownListCourses.SelectedValue))
                {
                    LoadRatings(instructorId, DropDownListCourses.SelectedValue);
                }
                else
                {
                    Ratings.Text = ""; // Clear on first load
                }
            }
        }


        // Retrieves Instructor_ID by email.
        private int GetInstructorID(string userEmail)
        {
            int instructorId = -1;
            string connStr = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string getInstructorQuery = "SELECT Instructor_ID FROM Instructor WHERE Email = @UserEmail";
                using (SqlCommand cmd = new SqlCommand(getInstructorQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@UserEmail", userEmail);
                    try
                    {
                        conn.Open();
                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            instructorId = Convert.ToInt32(result);
                        }
                    }
                    catch (Exception ex)
                    {
                        Ratings.Text = $"<span style='color:red;'>Error retrieving instructor ID: {ex.Message}</span>";
                    }
                }
            }
            return instructorId;
        }

        // Loads courses that the instructor teaches into the DropDownList.
        private void LoadCourses(int instructorId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // This query joins the courses and teaches table to get courses taught by the instructor.
                string query = @"
                    SELECT DISTINCT c.course_name 
                    FROM courses c
                    INNER JOIN teaches s ON c.Course_IDs = s.Course_ID
                    WHERE s.Instructor_ID = @InstructorID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@InstructorID", instructorId);
                    try
                    {
                        conn.Open();
                        DropDownListCourses.DataSource = cmd.ExecuteReader();
                        DropDownListCourses.DataTextField = "course_name";
                        DropDownListCourses.DataValueField = "course_name";
                        DropDownListCourses.DataBind();
                    }
                    catch (Exception ex)
                    {
                        SelectCourse.Text = "Error loading courses.";
                        System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                    }
                }
            }
            // Insert an "All Courses" option as the first item.Select a Course:
            DropDownListCourses.Items.Insert(0, new ListItem("Select a Course", " "));
            DropDownListCourses.Items.Insert(1, new ListItem("All Courses", "1"));
        }

        // Event handler for when a course is selected in the DropDownList.
        protected void DropDownListCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ViewState["InstructorID"] != null)
            {
                string selectedCourse = DropDownListCourses.SelectedValue;

                if (string.IsNullOrWhiteSpace(selectedCourse))
                {
                    
                    Ratings.Text = "";
                    return;
                }

                int instructorId = Convert.ToInt32(ViewState["InstructorID"]);
                LoadRatings(instructorId, selectedCourse);
            }
        }


        // Loads ratings based on the instructorId and the selected course.
        private void LoadRatings(int instructorId, string selectedCourse)
        {
            StringBuilder allRatings = new StringBuilder();
            string connStr = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;

            if (selectedCourse == "1" || string.IsNullOrEmpty(selectedCourse))
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string courseQuery = "SELECT DISTINCT Course FROM Ratings WHERE Instructor = @InstructorID";
                    using (SqlCommand courseCmd = new SqlCommand(courseQuery, conn))
                    {
                        courseCmd.Parameters.AddWithValue("@InstructorID", instructorId);
                        try
                        {
                            conn.Open();
                            SqlDataReader courseReader = courseCmd.ExecuteReader();
                            List<string> courses = new List<string>();
                            while (courseReader.Read())
                            {
                                courses.Add(courseReader["Course"].ToString());
                            }
                            courseReader.Close();

                            foreach (string course in courses)
                            {
                                allRatings.Append(GetRatingsData(course, instructorId)); // ⬅️ Only call GetRatingsData, no <div> here
                            }
                        }
                        catch (Exception ex)
                        {
                            allRatings.Append($"<div class='average-rating-container'><span style='color:red;'>Error: {ex.Message}</span></div>");
                        }
                    }
                }
            }
            else
            {
                allRatings.Append(GetRatingsData(selectedCourse, instructorId)); // ⬅️ Only call GetRatingsData
            }
            Ratings.Text = allRatings.ToString();
        }



        // Retrieves ratings details for a given course and instructor.
        private string GetRatingsData(string course, int instructorId)
        {
            StringBuilder sb = new StringBuilder();
            string connStr = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
            SELECT TotalScore, Percentage, StarRating, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8 
            FROM Ratings 
            WHERE Course = @Course AND Instructor = @InstructorID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Course", course);
                    cmd.Parameters.AddWithValue("@InstructorID", instructorId);
                    try
                    {
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            double sumScore = 0, sumPercentage = 0, sumStars = 0;
                            int count = 0;
                            double[] perQuestionSums = new double[questions.Length];
                            int[] perQuestionCounts = new int[questions.Length];

                            while (reader.Read())
                            {
                                if (reader["TotalScore"] == DBNull.Value)
                                    continue;

                                sumScore += Convert.ToDouble(reader["TotalScore"]);
                                sumPercentage += Convert.ToDouble(reader["Percentage"]);
                                sumStars += Convert.ToDouble(reader["StarRating"]);
                                count++;

                                for (int i = 0; i < questions.Length; i++)
                                {
                                    if (reader[$"Q{i + 1}"] != DBNull.Value)
                                    {
                                        perQuestionSums[i] += Convert.ToDouble(reader[$"Q{i + 1}"]);
                                        perQuestionCounts[i]++;
                                    }
                                }
                            }

                            if (count > 0)
                            {
                                double avgScore = sumScore / count;
                                double avgPercent = sumPercentage / count;
                                double avgStars = sumStars / count;
                                int starDisplay = (int)Math.Round(avgStars);

                                
                                sb.Append("<div class='average-rating-container'>");
                                sb.Append($"<h3 class='course-title'>{course}</h3>");
                                // ⭐ Star Display
                                sb.Append("<div class='rating-stars'>");
                                for (int i = 1; i <= 5; i++)
                                {
                                    if (i <= starDisplay)
                                        sb.Append("<span class='star'>&#9733;</span>"); // filled star
                                    else
                                        sb.Append("<span class='star' style='color:lightgray;'>&#9733;</span>"); // empty star
                                }
                                sb.Append("</div>");

                                // 📊 Score Info
                                sb.Append($"<p class='feedback-details'><strong>Total Students Rated:</strong> {count}</p>");
                                sb.Append($"<p class='feedback-details'><strong>Average Feedback Score:</strong> {avgScore:F2} / {questions.Length * 5}</p>");
                                sb.Append($"<p class='feedback-details'><strong>Overall Satisfaction:</strong> {avgPercent:F2}%</p>");
                                sb.Append($"<p class='feedback-details'><strong>Overall Rating:</strong> {avgStars:F1} out of 5 stars</p>");

                                // 🧠 Per-Question Averages
                                sb.Append("<h4 style='margin-top:20px;'>Per-Question Averages:</h4>");
                                sb.Append("<ul class='feedback-list'>");

                                for (int i = 0; i < questions.Length; i++)
                                {
                                    double avgQ = perQuestionCounts[i] > 0 ? perQuestionSums[i] / perQuestionCounts[i] : 0;
                                    string cssClass = avgQ < 3.5 ? "low-score" : "";
                                    sb.Append($"<li class='{cssClass}'>{i + 1}. {questions[i]}: <strong>{avgQ:F2}</strong></li>");
                                }
                                sb.Append("</ul>");

                                sb.Append("</div>");
                            }
                            else
                            {
                                sb.Append("<span style='color:gray;'>No feedback submitted yet.</span>");
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        sb.Append($"<span style='color:red;'>Error retrieving ratings: {ex.Message}</span>");
                    }
                }
            }
            return sb.ToString();
        }

    }
}
