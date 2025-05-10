using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace PMU_Campus
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserEmail"] == null)
                {
                    Response.Redirect("~/LogIn/SignIn.aspx?error=Unauthorized");
                    return;
                }
            }
        }
    }
}
