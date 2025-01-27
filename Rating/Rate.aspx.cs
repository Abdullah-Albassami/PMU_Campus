using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMU_Campus.Rating
{
    public partial class Rate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourses();
                LoadInstructors();
            }
        }

        private void LoadCourses()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT course_name FROM courses";
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    DropDownListCourses.DataSource = reader;
                    DropDownListCourses.DataTextField = "course_name";
                    DropDownListCourses.DataValueField = "course_name";
                    DropDownListCourses.DataBind();
                }
                catch (Exception)
                {
                    SelectCourse.Text = "Error loading courses. Please try again later.";
                }
                finally
                {
                    conn.Close();
                }
            }

            DropDownListCourses.Items.Insert(0, new ListItem("Select a Course", ""));
        }

        private void LoadInstructors()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Combine Fname and Lname for the instructor's full name
                string query = "SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM instructor";
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    DropDownListInstructors.DataSource = reader;
                    DropDownListInstructors.DataTextField = "FullName"; // Combined full name
                    DropDownListInstructors.DataValueField = "FullName";
                    DropDownListInstructors.DataBind();
                }
                catch (Exception)
                {
                    SelectInstructor.Text = "Error loading instructors. Please try again later.";
                }
                finally
                {
                    conn.Close();
                }
            }

            DropDownListInstructors.Items.Insert(0, new ListItem("Select an Instructor", ""));
        }
    }
}
