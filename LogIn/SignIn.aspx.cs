using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMU_Campus.LogIn
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic if necessary
        }

        protected void ButtonSignIn_Click(object sender, EventArgs e)
        {
            string firstName = TextBoxFirstName.Text.Trim();
            string email = TextBoxEmail.Text.Trim();
            string password = TextBoxPassword.Text.Trim();

            string connectionString = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Check if a student with the given credentials exists in the database
                string query = "SELECT COUNT(1) FROM student WHERE Fname=@FirstName AND Email=@Email AND Password=@Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password); // Note: Remember to hash passwords in production

                try
                {
                    conn.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count == 1)
                    {
                        // Set session and redirect to homepage
                        Session["UserEmail"] = email;
                        Response.Redirect("../HomePage/HomePAGE.aspx");
                    }
                    else
                    {
                        Response.Write("Invalid credentials. Please try again.");
                    }
                }
                catch (Exception ex)
                {
                    // Log error and provide feedback to the user
                    System.Diagnostics.Debug.WriteLine("Error signing in user: " + ex.Message);
                    Response.Write("Error: Could not sign in. Please try again later.");
                }
            }
        }
    }
}
