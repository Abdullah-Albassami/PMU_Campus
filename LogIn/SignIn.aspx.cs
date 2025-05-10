using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Web.Security;
using Konscious.Security.Cryptography;

namespace PMU_Campus
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            var email = txtEmail.Text.Trim();
            var password = txtPassword.Text;

            var cs = ConfigurationManager
                .ConnectionStrings["PMU_DatabaseConnectionString"]
                .ConnectionString;

            try
            {
                using (var conn = new SqlConnection(cs))
                using (var cmd = conn.CreateCommand())
                {
                    conn.Open();
                    cmd.CommandText = @"
                      SELECT id, password_hash, account_type, Fname, Lname
                        FROM users
                       WHERE Email = @Email";
                    cmd.Parameters.Add("@Email", System.Data.SqlDbType.NVarChar, 255)
                               .Value = email;

                    using (var rdr = cmd.ExecuteReader())
                    {
                        if (!rdr.Read() ||
                            !VerifyPassword(password, rdr.GetString(1)))
                        {
                            lblError.Text = "Invalid email or password.";
                            return;
                        }

                        FormsAuthentication.SetAuthCookie(email, false);
                        Session["UserID"] = rdr.GetString(0);
                        Session["UserEmail"] = email;
                        Session["Role"] = rdr.GetString(2);
                        Session["Fname"] = rdr.GetString(3);
                        Session["Lname"] = rdr.GetString(4);

                        var dest = Session["Role"].ToString().Equals("Student", StringComparison.OrdinalIgnoreCase)
                          ? "~/StudentDashboard/StudentDashboard.aspx"
                          : "~/InstructorDashboard/InstructorDashboard.aspx";

                        Response.Redirect(dest, false);
                    }
                }
            }
            catch
            {
                lblError.Text = "An unexpected error occurred. Please try again later.";
            }
        }

        private bool VerifyPassword(string password, string storedHash)
        {
            var parts = storedHash.Split(':');
            if (parts.Length != 2) return false;

            var salt = Convert.FromBase64String(parts[0]);
            var hash = Convert.FromBase64String(parts[1]);
            var argon2 = new Argon2id(Encoding.UTF8.GetBytes(password))
            {
                Salt = salt,
                DegreeOfParallelism = 4,
                MemorySize = 64 * 1024,
                Iterations = 3
            };
            var newHash = argon2.GetBytes(32);
            return FixedTimeEquals(newHash, hash);
        }

        private static bool FixedTimeEquals(byte[] a, byte[] b)
        {
            if (a.Length != b.Length) return false;
            int diff = 0;
            for (int i = 0; i < a.Length; i++)
                diff |= a[i] ^ b[i];
            return diff == 0;
        }
    }
}
