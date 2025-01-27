<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PMU_Campus.SignUp.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <h1 class="text-center mb-4">Create Your Account</h1>
        <!-- ASP.NET automatically adds a form element; do not add another form -->
        <div class="needs-validation">
            <div class="row mb-3">
                <label for="TextBoxFirstName" class="col-sm-4 col-form-label text-end">First Name:</label>
                <div class="col-sm-6">
                    <asp:TextBox ID="TextBoxFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <label for="TextBoxLastName" class="col-sm-4 col-form-label text-end">Last Name:</label>
                <div class="col-sm-6">
                    <asp:TextBox ID="TextBoxLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <label for="TextBoxMajorName" class="col-sm-4 col-form-label text-end">Major:</label>
                <div class="col-sm-6">
                    <asp:TextBox ID="TextBoxMajorName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <label for="TextBoxEmail" class="col-sm-4 col-form-label text-end">Student Email:</label>
                <div class="col-sm-6">
                    <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator1" 
                        runat="server" 
                        ErrorMessage="Invalid Email. You must use a PMU Email!" 
                        ForeColor="Red" 
                        ControlToValidate="TextBoxEmail" 
                        ValidationExpression="^[a-zA-Z0-9._%+-]+@pmu\.edu\.sa$" 
                        CssClass="form-text text-danger">
                    </asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row mb-3">
                <label for="TextBoxPassword" class="col-sm-4 col-form-label text-end">Password:</label>
                <div class="col-sm-6">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <label for="TextBoxConfirmPassword" class="col-sm-4 col-form-label text-end">Confirm Password:</label>
                <div class="col-sm-6">
                    <asp:TextBox ID="TextBoxConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:CompareValidator 
                        ID="CompareValidator1" 
                        runat="server" 
                        ControlToValidate="TextBoxConfirmPassword" 
                        ControlToCompare="TextBoxPassword" 
                        ErrorMessage="Passwords do not match!" 
                        ForeColor="Red" 
                        CssClass="form-text text-danger">
                    </asp:CompareValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 text-center">
                    <asp:Button ID="ButtonRegister" runat="server" Text="Register" OnClick="ButtonRegister_Click" CssClass="btn btn-primary" />
                </div>
            </div>
            <div class="text-center mt-3">
                <asp:HyperLink ID="HyperLinkLogin" runat="server" NavigateUrl="../LogIn/SignIn.aspx" CssClass="text-decoration-none">
                    Already have an account? Sign in here
                </asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>
