<%@ Page Title="Sign In" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="PMU_Campus.LogIn.SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <h1 class="text-center mb-4">Sign In</h1>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <!-- ASP.NET automatically includes a form element -->
                <div class="mb-3">
                    <label for="TextBoxFirstName" class="form-label">First Name:</label>
                    <asp:TextBox ID="TextBoxFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="TextBoxEmail" class="form-label">Email:</label>
                    <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator1" 
                        runat="server" 
                        ErrorMessage="Invalid Email. You must use a PMU Email!" 
                        ForeColor="Red" 
                        ControlToValidate="TextBoxEmail" 
                        ValidationExpression="^[a-zA-Z0-9._%+-]+@pmu\.edu\.sa$">
                    </asp:RegularExpressionValidator>
                </div>
                <div class="mb-3">
                    <label for="TextBoxPassword" class="form-label">Password:</label>
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="text-center">
                    <asp:Button ID="ButtonSignIn" runat="server" Text="Log In" CssClass="btn btn-primary" OnClick="ButtonSignIn_Click" />
                </div>
                <div class="text-center mt-3">
                    <asp:HyperLink ID="HyperLinkRegister" runat="server" NavigateUrl="../SignUp/Register.aspx" CssClass="link-primary">Don't have an account? Register here</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
