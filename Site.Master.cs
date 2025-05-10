using System;
using System.Web.UI;
using System.Web.Security;

namespace PMU_Campus
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserEmail"] != null)
                {
                    LogoutLink.Visible = true;
                    SignInLink.Visible = false;
                    WelcomeLabel.Visible = true;

                    // Get Fname and Lname from session
                    string fname = Session["Fname"] != null ? Session["Fname"].ToString() : "";
                    string lname = Session["Lname"] != null ? Session["Lname"].ToString() : "";
                    string role = Session["Role"] != null ? Session["Role"].ToString() : "";

                    WelcomeLabel.Text = "Welcome, " + fname + " " + lname;
                }
                else
                {
                    LogoutLink.Visible = false;
                    SignInLink.Visible = true;
                    WelcomeLabel.Visible = false;
                }
            }
        }
        protected void WelcomeLabel_Click(object sender, EventArgs e)
        {
            if (Session["Role"] != null)
            {
                string role = Session["Role"].ToString();

                if (role == "student")
                {
                    Response.Redirect("~/StudentDashboard/StudentDashboard.aspx");
                }
                else if (role == "instructor")
                {
                    Response.Redirect("~/InstructorDashboard/InstructorDashboard.aspx");
                }
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            FormsAuthentication.SignOut(); // Sign out from Forms Authentication
            Response.Redirect("~/HomePAGE/HomePAGE.aspx");
        }
    }
}
