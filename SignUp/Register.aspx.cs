using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMU_Campus.SignUp
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic if necessary
        }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            string firstName = TextBoxFirstName.Text.Trim();
            string lastName = TextBoxLastName.Text.Trim();
            string email = TextBoxEmail.Text.Trim();
            string password = TextBoxPassword.Text.Trim();
            string majorName = TextBoxMajorName.Text.Trim(); // Added Major field

            string connectionString = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Insert into the student table
                string query = "INSERT INTO student (Major_Name, Fname, Lname, Email) VALUES (@MajorName, @FirstName, @LastName, @Email)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@MajorName", majorName);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);
                cmd.Parameters.AddWithValue("@Email", email);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Response.Redirect("../LogIn/SignIn.aspx");
                }
                catch (Exception ex)
                {
                    // Log error and provide feedback to the user
                    System.Diagnostics.Debug.WriteLine("Error registering user: " + ex.Message);
                    Response.Write("Error: Could not register user. Please try again.");
                }
            }
        }
    }
}
