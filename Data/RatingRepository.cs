using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace PMU_Campus.Data
{
    public class RatingRepository
    {
        private readonly string _connStr;

        public RatingRepository()
        {
            _connStr = ConfigurationManager.ConnectionStrings["PMU_DatabaseConnectionString"].ConnectionString;
        }

        public bool InsertTestRating(string course, string instructor, int totalScore)
        {
            string query = @"
            INSERT INTO Ratings (Course, Instructor, TotalScore, Percentage, StarRating, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8)
            VALUES (@Course, @Instructor, @TotalScore, @Percentage, @StarRating, 5, 5, 5, 5, 5, 5, 5, 5)";

            try
            {
                using (SqlConnection conn = new SqlConnection(_connStr))
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    double percentage = (totalScore / 40.0) * 100;
                    int stars = percentage >= 80 ? 5 :
                                percentage >= 60 ? 4 :
                                percentage >= 40 ? 3 :
                                percentage >= 20 ? 2 : 1;

                    cmd.Parameters.AddWithValue("@Course", course);
                    cmd.Parameters.AddWithValue("@Instructor", instructor);
                    cmd.Parameters.AddWithValue("@TotalScore", totalScore);
                    cmd.Parameters.AddWithValue("@Percentage", percentage.ToString("F2"));
                    cmd.Parameters.AddWithValue("@StarRating", stars);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        public bool RatingExists(string course, string instructor)
        {
            string query = "SELECT COUNT(*) FROM Ratings WHERE Course = @Course AND Instructor = @Instructor";
            using (SqlConnection conn = new SqlConnection(_connStr))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Course", course);
                cmd.Parameters.AddWithValue("@Instructor", instructor);
                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        public void DeleteTestRating(string course, string instructor)
        {
            string query = "DELETE FROM Ratings WHERE Course = @Course AND Instructor = @Instructor";
            using (SqlConnection conn = new SqlConnection(_connStr))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Course", course);
                cmd.Parameters.AddWithValue("@Instructor", instructor);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
