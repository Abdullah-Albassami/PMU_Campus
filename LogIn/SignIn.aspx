<%@ Page Title="Student Sign In" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="PMU_Campus.SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <style>
    .login-container { max-width:400px; margin:50px auto; padding:20px; border:1px solid #ddd; border-radius:8px; background:#fff; box-shadow:0 4px 6px rgba(0,0,0,.1); }
    h2 { color:#fff; background:#2C2C6C; padding:15px; border-radius:5px 5px 0 0; margin:0 -20px 20px; text-align:center; }
    .form-group { margin-bottom:15px; text-align:left; }
    label { font-weight:bold; margin-bottom:5px; display:block; color: black; }
    .form-control { width:100%; padding:10px; font-size:16px; border:1px solid #ccc; border-radius:5px; }
    .btn { width:100%; padding:10px; background:#007bff; color:#fff; font-size:18px; border:none; border-radius:5px; cursor:pointer; }
    .btn:hover { background:#0056b3; }
    .text-danger { color:#c00; font-size:14px; }
    .register-link { margin-top:15px; display:block; font-size:14px; text-align:center; }
  </style>

  <div class="login-container">
    <h2>Sign In</h2>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
        CssClass="text-danger" HeaderText="Please fix these:" />

    <div class="form-group">
      <label for="txtEmail">Email</label>
      <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
      <asp:RequiredFieldValidator ControlToValidate="txtEmail"
          ErrorMessage="Email is required." CssClass="text-danger" runat="server" />
      <asp:RegularExpressionValidator ControlToValidate="txtEmail"
          ValidationExpression="^[a-zA-Z0-9._%+-]+@pmu\.edu\.sa$"
          ErrorMessage="Use your PMU email." CssClass="text-danger" runat="server" />
    </div>

    <div class="form-group">
      <label for="txtPassword">Password</label>
      <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
          CssClass="form-control" />
      <asp:RequiredFieldValidator ControlToValidate="txtPassword"
          ErrorMessage="Password is required." CssClass="text-danger" runat="server" />
    </div>

    <asp:Button ID="btnLogin" runat="server" Text="Login"
        CssClass="btn" OnClick="BtnLogin_Click" />

    <asp:Label ID="lblError" runat="server" CssClass="text-danger" />

    <a href="/SignUp/Register.aspx" class="register-link">
      Don’t have an account? Register here
    </a>
  </div>
</asp:Content>
