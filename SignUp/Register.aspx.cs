using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

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
                string query = "INSERT INTO instructor (Major_Name, Fname, Lname, Email, Password) VALUES (@MajorName, @FirstName, @LastName, @Email, @Password)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@MajorName", majorName);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password); // Consider hashing passwords in production

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
