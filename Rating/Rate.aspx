<%@ Page Title="Rate Courses and Instructors" Language="C#" 
    MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Rate.aspx.cs" Inherits="PMU_Campus.Rating.Rate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
  <link rel="stylesheet" type="text/css" href="rating.css" />

  <div class="container rating-container my-5">
      <h1 class="text-center mb-4">Course & Instructor Feedback</h1>
      <br />
      <div class="row mb-3 align-items-center">
          <label for="DropDownListCourses" 
              class="col-sm-3 col-form-label text-end"
              style="font-size:1.1rem;">Select a Course:</label>
          <div class="col-sm-7">
              <asp:DropDownList ID="DropDownListCourses" runat="server" 
                                  CssClass="form-select short-dropdown"
                                  AutoPostBack="true" 
                                  OnSelectedIndexChanged="DropDownListCourses_SelectedIndexChanged">
                  <asp:ListItem Text="Select a Course" Value="" style="display:none;"></asp:ListItem>
              </asp:DropDownList>
              <asp:Label ID="SelectCourse" runat="server" Text="" CssClass="form-text text-danger"></asp:Label>
          </div>
      </div>

      <div class="row mb-3">
          <label for="DropDownListCourses" class="col-sm-3 col-form-label text-sm-end"
              style="font-size:1.1rem;">Select an Instructor:</label>
          <div class="col-sm-7">
              <asp:DropDownList ID="DropDownListInstructors" runat="server" 
                                  CssClass="form-select short-dropdown" 
                                  AutoPostBack="true" 
                                  OnSelectedIndexChanged="DropDownListInstructors_SelectedIndexChanged">
              </asp:DropDownList>
              <asp:Label ID="SelectInstructor" runat="server" Text="" CssClass="form-text text-danger"></asp:Label>
          </div>
      </div>
      
      <div class="row mb-3">
          <div class="col text-center">
              <asp:Button ID="AddRatingButton" runat="server" 
                          Text="Add a Rating" 
                          CssClass="btn btn-success" 
                          OnClick="AddRatingButton_Click" />
          </div>
      </div>
  </div>

  <!-- Panel for the rating form. Initially hidden. -->
  <asp:Panel ID="RatingFormPanel" runat="server" Visible="false">
      <div id="feedback-container" class="rating-feedback-container">
          <h2 style="color: #5da9ff; font-size: 2rem; font-weight: 700; letter-spacing: 0.5px; text-shadow: 1px 1px 4px rgba(0,0,0,0.5);">
                 Course Feedback</h2>
          <br />
          <br />
          <asp:Literal ID="questionsContainerLiteral" runat="server"></asp:Literal>
          
          <!-- Integrated Star Rating UI -->
          
          <div class="rating">
              <input type="radio" name="rating" id="rating-5" value="5" <%= Session["starCount"]?.ToString() == "5" ? "checked" : "" %> /><label for="rating-5"></label>
              <input type="radio" name="rating" id="rating-4" value="4" <%= Session["starCount"]?.ToString() == "4" ? "checked" : "" %> /><label for="rating-4"></label>
              <input type="radio" name="rating" id="rating-3" value="3" <%= Session["starCount"]?.ToString() == "3" ? "checked" : "" %> /><label for="rating-3"></label>
              <input type="radio" name="rating" id="rating-2" value="2" <%= Session["starCount"]?.ToString() == "2" ? "checked" : "" %> /><label for="rating-2"></label>
              <input type="radio" name="rating" id="rating-1" value="1" <%= Session["starCount"]?.ToString() == "1" ? "checked" : "" %> /><label for="rating-1"></label>
          </div>
          
          <asp:Label ID="ResultLabel" runat="server" CssClass="text-success my-3 d-block"></asp:Label>
          <div class="text-center my-4">
              <asp:Button ID="SubmitButton" runat="server" 
                          Text="Submit Rating" 
                          CssClass="btn btn-primary" 
                          OnClick="SubmitButton_Click" />
          </div>
      </div>
      <br />
      <br />
      <asp:Label ID="Label1" runat="server" CssClass="text-success my-3 d-block"></asp:Label>
  </asp:Panel>

  <!-- Panel for displaying existing ratings. Initially hidden. -->
  <asp:Panel ID="RatingsListPanel" runat="server" Visible="false">
      <asp:Literal ID="RatingsLiteral" runat="server"></asp:Literal>
  </asp:Panel>

  <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol viewBox="0 0 7 4" id="eye">
        <path d="M1,1 C1.83333333,2.16666667 2.66666667,2.75 3.5,2.75 C4.33333333,2.75 5.16666667,2.16666667 6,1"></path>
    </symbol>
    <symbol viewBox="0 0 18 7" id="mouth">
        <path d="M1,5.5 C3.66666667,2.5 6.33333333,1 9,1 C11.6666667,1 14.3333333,2.5 17,5.5"></path>
    </symbol>
  </svg>
</asp:Content>