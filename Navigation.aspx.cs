using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PMU_Campus
{
    public partial class Navigation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set the page title
                Title = "Campus Navigation - PMU";
                
                // Register script for Unity initialization
                ScriptManager.RegisterStartupScript(this, this.GetType(), 
                    "UnityInitScript", 
                    "document.addEventListener('DOMContentLoaded', function() { " +
                    "  console.log('DOM loaded from server-side registration'); " +
                    "  setTimeout(function() { " +
                    "    if(typeof initUnity === 'function') { " +
                    "      initUnity(); " +
                    "    } else { " +
                    "      console.error('Unity initialization function not found'); " +
                    "    } " +
                    "  }, 1500); " +
                    "});", 
                    true);
            }
        }

        // Add any server-side event handlers if needed

        // This method can be used in the future to fetch room data from the database
        private DataTable GetRoomData(string roomNumber)
        {
            DataTable dt = new DataTable();

            // This is just a placeholder for future database integration
            // Uncomment and modify when you're ready to connect to your SQL database
            /*
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Rooms WHERE RoomNumber = @RoomNumber";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@RoomNumber", roomNumber);
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(dt);
                }
            }
            */
            return dt;
        }

        // This method can be used to fetch course data for a specific room
        private DataTable GetCourseData(string roomNumber)
        {
            DataTable dt = new DataTable();

            // This is just a placeholder for future database integration
            // Uncomment and modify when you're ready to connect to your SQL database
            /*
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Courses WHERE RoomNumber = @RoomNumber";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@RoomNumber", roomNumber);
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(dt);
                }
            }
            */
            return dt;
        }
    }
}