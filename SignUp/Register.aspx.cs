using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using Konscious.Security.Cryptography;

namespace PMU_Campus
{
    public partial class StudentRegister : System.Web.UI.Page
    {
        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            var fName = txtFname.Text.Trim();
            var lName = txtLname.Text.Trim();
            var major = txtMajor.Text.Trim();
            var email = txtEmail.Text.Trim();
            var password = txtPassword.Text;

            var userId = email.Substring(0, email.IndexOf('@'));
            var accountType = IsStudent(userId) ? "Student" : "Instructor";

            var connStr = ConfigurationManager
                .ConnectionStrings["PMU_DatabaseConnectionString"]
                .ConnectionString;

            try
            {
                using (var conn = new SqlConnection(connStr))
                using (var cmd = conn.CreateCommand())
                {
                    conn.Open();

                    // 1) Duplicate email check
                    cmd.CommandText = "SELECT COUNT(1) FROM users WHERE Email = @Email";
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 255)
                              .Value = email;
                    if ((int)cmd.ExecuteScalar() > 0)
                    {
                        lblMessage.Text = "Email already registered.";
                        lblMessage.CssClass = "text-danger";
                        return;
                    }
                    cmd.Parameters.Clear();

                    // 2) Insert new user
                    cmd.CommandText = @"
                      INSERT INTO users
                        (id, Fname, Lname, Email, password_hash, account_type, major)
                      VALUES
                        (@id, @Fname, @Lname, @Email, @PasswordHash, @AccountType, @Major)";
                    cmd.Parameters.Add("@id", SqlDbType.NVarChar, 50)
                              .Value = userId;
                    cmd.Parameters.Add("@Fname", SqlDbType.NVarChar, 100)
                              .Value = fName;
                    cmd.Parameters.Add("@Lname", SqlDbType.NVarChar, 100)
                              .Value = lName;
                    cmd.Parameters.Add("@Major", SqlDbType.NVarChar, 100)
                              .Value = major;
                    cmd.Parameters.Add("@PasswordHash", SqlDbType.NVarChar, -1)
                              .Value = HashPassword(password);
                    cmd.Parameters.Add("@AccountType", SqlDbType.NVarChar, 50)
                              .Value = accountType;
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 255)
                              .Value = email;

                    cmd.ExecuteNonQuery();
                }

                Session["UserEmail"] = email;
                Session["Role"] = accountType;
                Response.Redirect("~/Login/SignIn.aspx");
            }
            catch (SqlException)
            {
                lblMessage.Text = "Registration failed. Please try again later.";
                lblMessage.CssClass = "text-danger";
            }
        }

        private static string HashPassword(string password)
        {
            // 16-byte salt
            var salt = new byte[16];
            using (var rng = RandomNumberGenerator.Create())
                rng.GetBytes(salt);

            var argon = new Argon2id(Encoding.UTF8.GetBytes(password))
            {
                Salt = salt,
                DegreeOfParallelism = 4,
                MemorySize = 64 * 1024,
                Iterations = 3
            };

            var hash = argon.GetBytes(32);
            return Convert.ToBase64String(salt) + ":" + Convert.ToBase64String(hash);
        }

        private static bool IsStudent(string userId)
        {
            return int.TryParse(userId, out _);
        }
    }
}
