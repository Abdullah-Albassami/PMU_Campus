<%@ Page Title="Rate Courses and Instructors" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Rate.aspx.cs" Inherits="PMU_Campus.Rating.Rate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-5">
        <h1 class="text-center mb-4">Rate a Course and Instructor</h1>
        <!-- ASP.NET automatically includes a form element -->
        <div class="row mb-3">
            <label for="DropDownListCourses" class="col-sm-4 col-form-label text-end">Select a Course:</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="DropDownListCourses" runat="server" CssClass="form-select"></asp:DropDownList>
                <asp:Label ID="SelectCourse" runat="server" Text="" CssClass="form-text text-danger"></asp:Label>
            </div>
        </div>
        <div class="row mb-3">
            <label for="DropDownListInstructors" class="col-sm-4 col-form-label text-end">Select an Instructor:</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="DropDownListInstructors" runat="server" CssClass="form-select"></asp:DropDownList>
                <asp:Label ID="SelectInstructor" runat="server" Text="" CssClass="form-text text-danger"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
