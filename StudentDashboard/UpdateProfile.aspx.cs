using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PMU_Campus
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("/LogIn/SignIn.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserData();
            }
        }

        private void LoadUserData()
        {
            string userId = Session["UserID"].ToString();
            string connStr = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Fname, Lname, Email, major FROM users WHERE id = @UserID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblFname.Text = reader["Fname"].ToString();
                    lblLname.Text = reader["Lname"].ToString();
                    lblEmail.Text = reader["Email"].ToString();
                    lblMajor.Text = reader["major"].ToString();
                }
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            string userId = Session["UserID"].ToString();
            string fname = txtFname.Visible ? txtFname.Text.Trim() : lblFname.Text;
            string lname = txtLname.Visible ? txtLname.Text.Trim() : lblLname.Text;
            string major = txtMajor.Visible ? txtMajor.Text.Trim() : lblMajor.Text;

            string connStr = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE users SET Fname=@Fname, Lname=@Lname, major=@Major, updated_at=GETDATE() WHERE id=@UserID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Fname", fname);
                cmd.Parameters.AddWithValue("@Lname", lname);
                cmd.Parameters.AddWithValue("@Major", major);
                cmd.Parameters.AddWithValue("@UserID", userId);

                conn.Open();
                int rows = cmd.ExecuteNonQuery();
                lblStatus.Text = rows > 0 ? "✅ Profile updated." : "❌ Update failed.";

                // Update labels
                lblFname.Text = fname;
                lblLname.Text = lname;
                lblMajor.Text = major;

                // Hide inputs
                txtFname.Visible = false;
                txtLname.Visible = false;
                txtMajor.Visible = false;
            }
        }

        protected void BtnEditFname_Click(object sender, EventArgs e)
        {
            txtFname.Visible = true;
            txtFname.Text = lblFname.Text;
        }

        protected void BtnEditLname_Click(object sender, EventArgs e)
        {
            txtLname.Visible = true;
            txtLname.Text = lblLname.Text;
        }

        protected void BtnEditMajor_Click(object sender, EventArgs e)
        {
            txtMajor.Visible = true;
            txtMajor.Text = lblMajor.Text;
        }
    }
}
