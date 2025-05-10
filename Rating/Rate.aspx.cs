using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.WebControls;

namespace PMU_Campus.Rating
{


    public partial class Rate : System.Web.UI.Page
    {
        private readonly string[] questions = new string[]
        {
        "Course objectives clear",
        "Instructor was prepared and on time",
        "Instructor knowledge",
        "Instructor was helpful and cared about progress",
        "Course materials were useful and updated",
        "Encouragement to ask questions",
        "Fair grading",
        "Overall course quality"
        };


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Role"] == null || Session["Role"].ToString().ToLower() != "student")
                {
                    Response.Redirect("~/HomePAGE/NotAuthorized.aspx");
                    return;
                }

                LoadCourses();
                questionsContainerLiteral.Text = GenerateQuestionsHtml();
                RatingFormPanel.Visible = false;
                RatingsListPanel.Visible = false;
            }
        }


        private void LoadCourses()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT course_name FROM courses";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    try
                    {
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            DropDownListCourses.DataSource = reader;
                            DropDownListCourses.DataTextField = "course_name";
                            DropDownListCourses.DataValueField = "course_name";
                            DropDownListCourses.DataBind();
                        }
                    }
                    catch (Exception ex)
                    {
                        SelectCourse.Text = "Error loading courses.";
                        System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                    }
                }
            }
            DropDownListCourses.Items.Insert(0, new ListItem("All Courses", "1"));
        }

        protected void DropDownListCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCourse = DropDownListCourses.SelectedValue;
            if (!string.IsNullOrEmpty(selectedCourse))
            {
                DropDownListInstructors.Items.Clear();
                DropDownListInstructors.Items.Add(new ListItem("Select an Instructor", ""));
                List<ListItem> instructors = GetInstructors(selectedCourse);
                DropDownListInstructors.Items.AddRange(instructors.ToArray());
            }
        }

        protected void DropDownListInstructors_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(DropDownListCourses.SelectedValue) ||
                string.IsNullOrEmpty(DropDownListInstructors.SelectedValue))
            {
                RatingsListPanel.Visible = false;
            }
            else
            {
                string ratingsHtml = GetRatingsData(DropDownListCourses.SelectedValue, DropDownListInstructors.SelectedValue);
                RatingsLiteral.Text = ratingsHtml;
                RatingsListPanel.Visible = true;
                RatingFormPanel.Visible = false;
                ResultLabel.Text = "";
            }
        }
        private string GetRatingsData(string course, string instructor)
        {
            StringBuilder sb = new StringBuilder();
            string connStr = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT TotalScore, Percentage, StarRating, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8 FROM Ratings WHERE Course = @Course AND Instructor = @Instructor";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Course", course);
                    cmd.Parameters.AddWithValue("@Instructor", instructor);

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
                                if (reader["TotalScore"] is DBNull) continue;
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

                                sb.Append("<div class='average-rating-container' style='padding-top: 2px;'>"); // NEW: control padding yourself
                                sb.Append("<br />");
                                sb.Append("<div class='rating' style='pointer-events: none; margin: 0; padding: 0;'>"); // make stars no extra margin/padding
                                for (int i = 5; i >= 1; i--)
                                {
                                    sb.Append($"<input type='radio' id='rating-{i}' value='{i}' {(starDisplay == i ? "checked" : "")} disabled /><label for='rating-{i}'></label>");
                                }
                                sb.Append("</div>");
                                sb.Append("<br />"); // add line break under stars

                                sb.Append($"<p style='font-size: 1.2rem; font-weight: 600; margin: 8px 0;'>Total Students Rated: {count}</p>");
                                sb.Append($"<p style='font-size: 1.2rem; font-weight: 600; margin: 8px 0;'>Average Feedback Score: {avgScore:F2} / {questions.Length * 5}</p>");
                                sb.Append($"<p style='font-size: 1.2rem; font-weight: 600; margin: 8px 0;'>Overall Satisfaction: {avgPercent:F2}%</p>");
                                sb.Append($"<p style='font-size: 1.2rem; font-weight: 600; margin: 8px 0;'>Overall Rating: {avgStars:F1} out of 5 stars</p>");


                                sb.Append("<h4 style='color: #fcd93a; font-size: 1.5rem; font-weight: 700; margin-top: 30px; margin-bottom: 15px;'><strong>Per-Question Averages:</strong></h4><ul>");

                                List<string> improvements = new List<string>();
                                for (int i = 0; i < questions.Length; i++)
                                {
                                    double avgQ = perQuestionCounts[i] > 0 ? perQuestionSums[i] / perQuestionCounts[i] : 0;
                                    sb.Append($"<li style='font-size: 1.3rem; margin: 6px 0;'>{i + 1}. {questions[i].Split('.')[0]}: {avgQ:F2}</li>");
                                    if (avgQ < 3.5)
                                        improvements.Add($"🔸 {questions[i]} (Avg: {avgQ:F2})");
                                }
                                sb.Append("</ul>");

                                sb.Append("</div>");
                                sb.Append("<br />");
                            }
                            else
                            {
                                sb.Append("<span style='color:gray;'>No feedback submitted yet.</span>");
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        sb.Append("<span style='color:red;'>Error retrieving ratings: " + ex.Message + "</span>");
                    }
                }
            }
            return sb.ToString();
        }
        
        private List<ListItem> GetInstructors(string courseName)
        {
            List<ListItem> instructors = new List<ListItem>();
            string connectionString = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT DISTINCT i.Instructor_ID, CONCAT(i.Fname, ' ', i.Lname) AS FullName
                    FROM instructor i
                    INNER JOIN teaches s ON i.Instructor_ID = s.Instructor_ID
                    INNER JOIN courses c ON s.Course_ID = c.Course_IDs
                    WHERE c.course_name = @courseName";
                if (courseName == "1")
                {
                    query = "SELECT DISTINCT i.Instructor_ID, CONCAT(i.Fname, ' ', i.Lname) AS FullName FROM instructor i";
                }
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (courseName != "1")
                    {
                        cmd.Parameters.AddWithValue("@courseName", courseName);
                    }
                    try
                    {
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                instructors.Add(new ListItem
                                {
                                    Value = reader["Instructor_ID"].ToString(),
                                    Text = reader["FullName"].ToString()
                                });
                            }
                        }
                    }
                    catch (Exception) { }
                }
            }
            return instructors;
        }

        private string GenerateQuestionsHtml()
        {
            StringBuilder html = new StringBuilder();
            for (int i = 0; i < questions.Length; i++)
            {
                int qNum = i + 1;

                html.Append("<div class='question-row'>"); // No inline style needed now

                // Question text
                html.Append($"<div class='question-text'>{qNum}. {questions[i]}</div>");

                // Feedback emojis
                html.Append("<div class='feedback'>");

                html.Append($"<label class='angry'><input type='radio' name='q{qNum}' value='1' /><div><svg class='eye left'><use xlink:href='#eye'></use></svg><svg class='eye right'><use xlink:href='#eye'></use></svg><svg class='mouth'><use xlink:href='#mouth'></use></svg></div></label>");
                html.Append($"<label class='sad'><input type='radio' name='q{qNum}' value='2' /><div><svg class='eye left'><use xlink:href='#eye'></use></svg><svg class='eye right'><use xlink:href='#eye'></use></svg><svg class='mouth'><use xlink:href='#mouth'></use></svg></div></label>");
                html.Append($"<label class='ok'><input type='radio' name='q{qNum}' value='3' /><div></div></label>");
                html.Append($"<label class='good'><input type='radio' name='q{qNum}' value='4' /><div><svg class='eye left'><use xlink:href='#eye'></use></svg><svg class='eye right'><use xlink:href='#eye'></use></svg><svg class='mouth'><use xlink:href='#mouth'></use></svg></div></label>");
                html.Append($"<label class='happy'><input type='radio' name='q{qNum}' value='5' /><div><svg class='eye left'><use xlink:href='#eye'></use></svg><svg class='eye right'><use xlink:href='#eye'></use></svg></div></label>");

                html.Append("</div></div>"); // Close feedback and question-row divs
            }
            return html.ToString();
        }



        protected void AddRatingButton_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(DropDownListCourses.SelectedValue) ||
                string.IsNullOrEmpty(DropDownListInstructors.SelectedValue))
            {
                ResultLabel.Text = "Please select both a course and an instructor before adding a rating.";
                RatingFormPanel.Visible = false;
                RatingsListPanel.Visible = false;
            }
            else
            {
                ResultLabel.Text = "";
                RatingFormPanel.Visible = true;
                RatingsListPanel.Visible = false;
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString().ToLower() != "student")
            {
                ResultLabel.Text = "Only students are allowed to submit ratings.";
                return;
            }

            string course = DropDownListCourses.SelectedValue;
            string instructor = DropDownListInstructors.SelectedValue;

            if (string.IsNullOrEmpty(course) || string.IsNullOrEmpty(instructor))
            {
                ResultLabel.Text = "Please select a course and instructor.";
                return;
            }

            int totalScore = 0;
            int maxScore = questions.Length * 5;
            int[] responses = new int[questions.Length];

            for (int i = 1; i <= questions.Length; i++)
            {
                string selected = Request.Form[$"q{i}"];
                if (string.IsNullOrEmpty(selected))
                {
                    ResultLabel.Text = $"Please answer question {i}.";
                    return;
                }
                responses[i - 1] = int.Parse(selected);
                totalScore += responses[i - 1];
            }

            double percentage = (totalScore / (double)maxScore) * 100;

            int starCount = percentage >= 80 ? 5 :
                            percentage >= 60 ? 4 :
                            percentage >= 40 ? 3 :
                            percentage >= 20 ? 2 : 1;

            Session["starCount"] = starCount.ToString();

            string connStr = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
            INSERT INTO Ratings (Course, Instructor, TotalScore, Percentage, StarRating, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8)
            VALUES (@Course, @Instructor, @TotalScore, @Percentage, @StarRating, @Q1, @Q2, @Q3, @Q4, @Q5, @Q6, @Q7, @Q8)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Course", course);
                    cmd.Parameters.AddWithValue("@Instructor", instructor);
                    cmd.Parameters.AddWithValue("@TotalScore", totalScore);
                    cmd.Parameters.AddWithValue("@Percentage", percentage.ToString("F2"));
                    cmd.Parameters.AddWithValue("@StarRating", starCount);

                    for (int i = 0; i < questions.Length; i++)
                    {
                        cmd.Parameters.AddWithValue($"@Q{i + 1}", responses[i]);
                    }

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        ResultLabel.Text = $"Thank you! Your rating has been submitted. Total Score: {totalScore} ({percentage:F2}%) with {starCount} star(s).";
                    }
                    catch (Exception ex)
                    {
                        ResultLabel.Text = "Error: " + ex.Message;
                    }
                }
            }
        }


    }
}