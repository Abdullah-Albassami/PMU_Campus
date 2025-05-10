<%@ Page Title="Student Register" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PMU_Campus.StudentRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <style>
    .register-container { 
        max-width:500px; 
        margin:50px auto; 
        padding:20px; 
        border:1px solid #ddd; border-radius:8px; 
        background:#fff; box-shadow:0 4px 6px rgba(0,0,0,.1); 

    }
    h2 { 
        color:#fff; background:#2C2C6C; 
        padding:15px; 
        border-radius:5px 5px 0 0; 
        margin:0 -20px 20px; 
        text-align:center; 

    }
    .form-group { 
        margin-bottom:15px; 
        text-align:left; 

    }
    label { 
        font-weight:bold; 
        margin-bottom:5px; 
        display:block; 
        color: black;

    }
    .form-control { 
        width:100%; padding:10px; 
        font-size:16px; 
        border:1px solid #ccc; border-radius:5px; 

    }
    .btn { 
        width:100%; 
        padding:10px; 
        background:#007bff; color:#fff; 
        font-size:18px; 
        border:none; border-radius:5px; 
        cursor:pointer; 

    }
    .btn:hover { 
        background:#0056b3; 

    }
    .text-danger { 
        color:#c00; font-size:14px; 

    }
    .text-success { 
        color:#080; 
        font-size:14px; 
        margin-top:10px; 
        display:block; 
        text-align:center; 

    }
  </style>

  <div class="register-container">
    <h2>Register</h2>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />

    <div class="form-group">
      <label for="txtFname">First Name</label>
      <asp:TextBox ID="txtFname" runat="server" CssClass="form-control" />
      <asp:RequiredFieldValidator ControlToValidate="txtFname" ErrorMessage="First Name is required." CssClass="text-danger" runat="server" />
    </div>

    <div class="form-group">
      <label for="txtLname">Last Name</label>
      <asp:TextBox ID="txtLname" runat="server" CssClass="form-control" />
      <asp:RequiredFieldValidator ControlToValidate="txtLname" 
          ErrorMessage="Last Name is required." CssClass="text-danger" runat="server" />
    </div>

    <div class="form-group">
      <label for="txtMajor">Major</label>
      <asp:TextBox ID="txtMajor" runat="server" CssClass="form-control" />
      <asp:RequiredFieldValidator ControlToValidate="txtMajor" ErrorMessage="Major is required." 
          CssClass="text-danger" runat="server" />
    </div>

    <div class="form-group">
      <label for="txtEmail">Email</label>
      <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
      <asp:RequiredFieldValidator ControlToValidate="txtEmail" ErrorMessage="Email is required." 
          CssClass="text-danger" runat="server" />
      <asp:RegularExpressionValidator ControlToValidate="txtEmail"
        ValidationExpression="^[a-zA-Z0-9._%+-]+@pmu\.edu\.sa$"
        ErrorMessage="Use your PMU email." CssClass="text-danger" runat="server" />
    </div>

    <div class="form-group">
      <label for="txtPassword">Password</label>
      <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
      <asp:RequiredFieldValidator ControlToValidate="txtPassword" ErrorMessage="Password is required." 
          CssClass="text-danger" runat="server" />
      <asp:RegularExpressionValidator ControlToValidate="txtPassword"
        ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\s]).{8,}$"
        ErrorMessage="Min 8 chars, upper, lower, digit & special." 
          CssClass="text-danger" runat="server" />
    </div>

    <div class="form-group">
      <label for="txtConfirmPassword">Confirm Password</label>
      <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" />
      <asp:RequiredFieldValidator ControlToValidate="txtConfirmPassword" ErrorMessage="Please confirm password." 
          CssClass="text-danger" runat="server" />
      <asp:CompareValidator ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword"
        ErrorMessage="Passwords do not match." CssClass="text-danger" runat="server" />
    </div>

    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="BtnRegister_Click" />
    <asp:Label ID="lblMessage" runat="server" CssClass="text-success" />
  </div>
</asp:Content>
