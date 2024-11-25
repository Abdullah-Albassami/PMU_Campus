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
            }
        }

        private void LoadCourses()
        {
            // Fetch the connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"]?.ConnectionString;

            if (string.IsNullOrEmpty(connectionString))
            {
                // Handle missing connection string
                SelectCourse.Text = "Error: Connection string is missing or invalid.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT course_name FROM courses";
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Bind data to DropDownList
                    DropDownList1.DataSource = reader;
                    DropDownList1.DataTextField = "course_name";  // Displayed text
                    DropDownList1.DataValueField = "course_name"; // Value of each item
                    DropDownList1.DataBind();
                }
                catch (Exception ex)
                {
                    // Display user-friendly error message
                    SelectCourse.Text = "Error loading courses. Please try again later.";
                    // Log the error (optional)
                    // System.Diagnostics.Debug.WriteLine(ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }

            // Add default option
            DropDownList1.Items.Insert(0, new ListItem("Select a Course", ""));
        }
    }
}
