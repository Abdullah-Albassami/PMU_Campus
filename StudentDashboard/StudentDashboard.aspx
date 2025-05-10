<%@ Page Title="Student Dashboard" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="PMU_Campus.StudentDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <style>
    /* === Student Dashboard – Enlarged Cards & Icons === */
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
      padding: 40px 20px;        /* more vertical padding */
      min-height: 280px;         /* ensure cards are taller */
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

    .btn-card img {
      width: 120px;              /* larger icon */
      height: 120px;
      object-fit: contain;
      margin-bottom: 16px;       /* more spacing below icon */
    }

    .btn-label {
      display: block;
      font-weight: bold;
      font-size: 1.25rem;         /* larger label */
      color: #FFFFFF;
      margin-top: 12px;
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
      <a href="../Rating/Rate.aspx">
        <img src="https://cdn-icons-png.flaticon.com/512/1828/1828884.png" alt="Rating Icon" />
        <span class="btn-label">Course &amp; Professor Ratings</span>
      </a>
    </div>
    <div class="btn-card">
      <a href="UpdateProfile.aspx">
        <img src="https://cdn-icons-png.flaticon.com/512/747/747545.png" alt="Profile Icon" />
        <span class="btn-label">Edit Profile</span>
      </a>
    </div>
  </div>
</asp:Content>




