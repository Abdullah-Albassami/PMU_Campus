<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RatingSystem.aspx.cs" Inherits="PMU_Campus.RatingSystem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rating System</title>
    <link rel="stylesheet" href="main.css">
  <style>
        .rating-system {
            border: 1px solid black;
            padding: 20px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.3);
            max-width: 400px;
            margin: 0 auto;
        }
        .rate-advanced {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        .rating-container {
            flex: 1;
        }
        .advanced-checkbox {
            flex: 1;
            text-align: right;
        }
        .text-box {
            display: block;
            margin-top: 10px;
        }
        .advanced-rating {
            display: none;
            margin-top: 10px;
        }
        .advanced-rating .extra {
            display: inline-block;
            width: 48%;
            margin-bottom: 10px;
        }
        .submit-button {
            text-align: center;
            margin-top: 20px;
        }
    </style>
    
</head>
<body>
    <form id="ratingForm" runat="server" class="rating-system">
        <div class="rate-advanced">
            <div class="rating-container">
                <label for="overallRating">Overall:</label>
                <asp:DropDownList ID="overallRating" runat="server" CssClass="rating-dropdown" AutoPostBack="true">
                    <asp:ListItem Value="">Select</asp:ListItem>
                    <asp:ListItem Value="1">✭</asp:ListItem>
                    <asp:ListItem Value="2">★</asp:ListItem>
                    <asp:ListItem Value="3">★✭</asp:ListItem>
                    <asp:ListItem Value="4">★★</asp:ListItem>
                    <asp:ListItem Value="5">★★✭</asp:ListItem>
                    <asp:ListItem Value="6">★★★</asp:ListItem>
                    <asp:ListItem Value="7">★★★✭</asp:ListItem>
                    <asp:ListItem Value="8">★★★★</asp:ListItem>
                    <asp:ListItem Value="9">★★★★✭</asp:ListItem>
                    <asp:ListItem Value="10">★★★★★</asp:ListItem>


                </asp:DropDownList>
            </div>
            <div class="advanced-checkbox">
                <label for="advancedRatingCheckbox">Advanced Rating:</label>
                <asp:CheckBox ID="advancedRatingCheckbox" runat="server" CssClass="advanced-checkbox" AutoPostBack="true" OnCheckedChanged="toggleAdvancedRating" />            </div>
        </div>
        <div class="advanced-rating" id="advancedRating" runat="server">
            <div class="extra">
                <label for="homeworkRating">Homework:</label>
                <asp:DropDownList ID="homeworkRating" runat="server" CssClass="rating-dropdown">
                    <asp:ListItem Value="">Select</asp:ListItem>
                    <asp:ListItem Value="1">✭</asp:ListItem>
                    <asp:ListItem Value="2">★</asp:ListItem>
                    <asp:ListItem Value="3">★✭</asp:ListItem>
                    <asp:ListItem Value="4">★★</asp:ListItem>
                    <asp:ListItem Value="5">★★✭</asp:ListItem>
                    <asp:ListItem Value="6">★★★</asp:ListItem>
                    <asp:ListItem Value="7">★★★✭</asp:ListItem>
                    <asp:ListItem Value="8">★★★★</asp:ListItem>
                    <asp:ListItem Value="9">★★★★✭</asp:ListItem>
                    <asp:ListItem Value="10">★★★★★</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="extra">
                <label for="examsRating">Exams:</label>
                <asp:DropDownList ID="examsRating" runat="server" CssClass="rating-dropdown">
                    <asp:ListItem Value="">Select</asp:ListItem>
                    <asp:ListItem Value="1">✭</asp:ListItem>
                    <asp:ListItem Value="2">★</asp:ListItem>
                    <asp:ListItem Value="3">★✭</asp:ListItem>
                    <asp:ListItem Value="4">★★</asp:ListItem>
                    <asp:ListItem Value="5">★★✭</asp:ListItem>
                    <asp:ListItem Value="6">★★★</asp:ListItem>
                    <asp:ListItem Value="7">★★★✭</asp:ListItem>
                    <asp:ListItem Value="8">★★★★</asp:ListItem>
                    <asp:ListItem Value="9">★★★★✭</asp:ListItem>
                    <asp:ListItem Value="10">★★★★★</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="extra">
                <label for="teachingRating">Teaching:</label>
                <asp:DropDownList ID="teachingRating" runat="server" CssClass="rating-dropdown">
                    <asp:ListItem Value="">Select</asp:ListItem>
                    <asp:ListItem Value="1">✭</asp:ListItem>
                    <asp:ListItem Value="2">★</asp:ListItem>
                    <asp:ListItem Value="3">★✭</asp:ListItem>
                    <asp:ListItem Value="4">★★</asp:ListItem>
                    <asp:ListItem Value="5">★★✭</asp:ListItem>
                    <asp:ListItem Value="6">★★★</asp:ListItem>
                    <asp:ListItem Value="7">★★★✭</asp:ListItem>
                    <asp:ListItem Value="8">★★★★</asp:ListItem>
                    <asp:ListItem Value="9">★★★★✭</asp:ListItem>
                    <asp:ListItem Value="10">★★★★★</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="extra">
                <label for="gradingRating">Grading:</label>
                <asp:DropDownList ID="gradingRating" runat="server" CssClass="rating-dropdown">
                    <asp:ListItem Value="">Select</asp:ListItem>
                    <asp:ListItem Value="1">✭</asp:ListItem>
                    <asp:ListItem Value="2">★</asp:ListItem>
                    <asp:ListItem Value="3">★✭</asp:ListItem>
                    <asp:ListItem Value="4">★★</asp:ListItem>
                    <asp:ListItem Value="5">★★✭</asp:ListItem>
                    <asp:ListItem Value="6">★★★</asp:ListItem>
                    <asp:ListItem Value="7">★★★✭</asp:ListItem>
                    <asp:ListItem Value="8">★★★★</asp:ListItem>
                    <asp:ListItem Value="9">★★★★✭</asp:ListItem>
                    <asp:ListItem Value="10">★★★★★</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="text-box">
            <label for="feedbackTextBox">Feedback:</label>
            <asp:TextBox ID="feedbackTextBox" runat="server" TextMode="MultiLine" Rows="25" Columns="50" CssClass="feedback-textbox" Required="true"></asp:TextBox>
        </div>
        <div class="submit-button">
            <asp:Button ID="submitButton" runat="server" Text="Submit" CssClass="submit-button" OnClick="SubmitRating" />
        </div>
    </form>
</body>
    <script src="scripts/toggleAdvancedRating.js"></script>
</html>
