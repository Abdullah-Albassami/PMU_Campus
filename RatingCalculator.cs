using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PMU_Campus.Helpers
{
    public static class RatingCalculator
    {
        public static int CalculateStars(double percentage)
        {
            return percentage >= 80 ? 5 :
                   percentage >= 60 ? 4 :
                   percentage >= 40 ? 3 :
                   percentage >= 20 ? 2 : 1;
        }

        public static double CalculatePercentage(int totalScore, int maxScore)
        {
            return (totalScore / (double)maxScore) * 100;
        }
    }
}
