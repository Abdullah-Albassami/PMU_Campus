<%@ Page Title="Instructor Dashboard" Language="C#"  
    MasterPageFile="~/Site.master" 
    AutoEventWireup="true" 
    CodeBehind="InstructorDashboard.aspx.cs" 
    Inherits="PMU_Campus.InstructorDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
  body {
    font-family: 'Arial', sans-serif;
    background-color: #2D2786;
    color: #FFFFFF;
    margin: 0;
    padding: 20px;
  }

  
  .button-grid {
    max-width: 1200px;
    margin: 40px auto;
    padding: 60px 0;               
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 30px;
    text-align: center;
  }

  .btn-card {
   
    background-color: rgba(0, 0, 0, 0.2);
    padding: 30px 20px;
    border-radius: 12px;
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2);
    transition: transform 0.2s ease;
    border: none;
    text-align: center;
  }

  .btn-card:hover {
    transform: scale(1.03);
  }

  .btn-card a {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-decoration: none !important;
    color: inherit;
  }

  .btn-card i,
  .btn-card img {
    font-size: 3rem;
    width: 90px;
    height: 90px;
    object-fit: contain;
    margin-bottom: 8px;
    color: #FCD93A;                 
  }

  .btn-card span,
  .btn-card .btn-label {
    display: block;
    font-weight: bold;
    font-size: 1rem;
    color: #FFFFFF;
    margin-top: 4px;
  }

 
  .form-select {
    width: 100%;
    padding: 10px;
    border: 3px solid #FCD93A;       
    border-radius: 6px;
    background-color: #FFFFFF;
    color: #2D2786;
    font-size: 16px;
    cursor: pointer;
  }

  .form-select:focus {
    outline: none;
    border-color: #FFFFFF;
  }

  .average-rating-container {
    background: rgb(0 0 0 / 30%);
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    max-width: 700px;
    margin: 5px auto 30px;
    text-align: center;
    color: #f2f2f2;
  }

  .rating-stars {
    display: flex;
    justify-content: center;
    margin-bottom: 15px;
  }

  .star {
    font-size: 35px;
    color: #FFD700;
    text-shadow: 0 0 8px rgba(255,215,0,0.6);
    margin: 0 5px;
    transition: text-shadow 0.2s ease;
  }

  .star:hover {
    text-shadow: 0 0 12px rgba(255,215,0,1);
  }

  .feedback-details {
    font-size: 16px;
    line-height: 1.6;
    color: #f2f2f2;
  }

  .feedback-list {
    margin-top: 15px;
    padding: 0;
    list-style-type: none;
    color: #f2f2f2;
  }

  .feedback-list li {
    font-size: 14px;
    padding: 6px 0;
    color: #f2f2f2;
  }

  .feedback-list li.low-score {
    color: #f2f2f2;
    font-weight: bold;
  }

  .average-rating-container h4 {
    color: #FCD93A;
    font-size: 1.5rem;
    font-weight: 700;
    margin-top: 20px;
    margin-bottom: 15px;
  }

  .average-rating-container .feedback-list {
    display: inline-block;
    text-align: left;
    margin: 0 auto;
  }

  .average-rating-container .feedback-list li {
    font-size: 1.2rem;
  }
</style>



    <div class="button-grid">
        <div class="btn-card">
            <a href="../Navigation.aspx">
                <img src="https://cdn-icons-png.flaticon.com/512/684/684908.png" alt="Map Icon" />
                <span class="btn-label">Campus Navigation</span>
            </a>
        </div>

        <div class="btn-card">
            <img src="https://cdn-icons-png.flaticon.com/512/1828/1828884.png" alt="Rating Icon" />
            <p style="color:white; font-weight:bold;">Ratings Overview</p>
            <asp:DropDownList 
                ID="DropDownListCourses" 
                runat="server" 
                CssClass="form-select"
                AutoPostBack="true" 
                OnSelectedIndexChanged="DropDownListCourses_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:Label 
                ID="SelectCourse" 
                runat="server" 
                CssClass="form-text text-danger">
            </asp:Label>
        </div>

        <div class="btn-card">
            <a href="../StudentDashboard/UpdateProfile.aspx">
                <img src="https://cdn-icons-png.flaticon.com/512/747/747545.png" alt="Profile Icon" />
                <span class="btn-label">Profile Settings</span>
            </a>
        </div>
    </div>

    <asp:Literal ID="Ratings" runat="server"></asp:Literal>

</asp:Content>
