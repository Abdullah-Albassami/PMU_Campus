<%@ Page Title="Update Profile" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="UpdateProfile.aspx.cs" Inherits="PMU_Campus.UpdateProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .register-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            text-align: left;
        }

        h2 {
            color: white;
            background-color: #2C2C6C;
            padding: 15px;
            border-radius: 5px 5px 0 0;
            margin-top: 0;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            font-size: 16px;
            color: black;
            display: inline-block;
            width: 120px;
        }

        .inline-label {
            display: inline-block;
            min-width: 200px;
            color: #333;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 8px;
        }

        .btn {
            margin-top: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 14px;
            font-size: 14px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        hr {
            margin: 30px 0 20px;
        }

        .center-btn {
            display: block;
            margin: 20px auto;
            width: fit-content;
        }
    </style>

    <div class="register-container">
        <h2>Update Profile</h2>

        <div class="form-group">
            <label>First Name:</label>
            <asp:Label ID="lblFname" runat="server" CssClass="inline-label" />
            <asp:Button ID="btnEditFname" runat="server" Text="Edit" CssClass="btn" OnClick="BtnEditFname_Click" />
            <asp:TextBox ID="txtFname" runat="server" CssClass="form-control" Visible="false" />
        </div>

        <div class="form-group">
            <label>Last Name:</label>
            <asp:Label ID="lblLname" runat="server" CssClass="inline-label" />
            <asp:Button ID="btnEditLname" runat="server" Text="Edit" CssClass="btn" OnClick="BtnEditLname_Click" />
            <asp:TextBox ID="txtLname" runat="server" CssClass="form-control" Visible="false" />
        </div>

        <div class="form-group">
            <label>Email:</label>
            <asp:Label ID="lblEmail" runat="server" CssClass="inline-label" />
        </div>

        <div class="form-group">
            <label>Major:</label>
            <asp:Label ID="lblMajor" runat="server" CssClass="inline-label" />
            <asp:Button ID="btnEditMajor" runat="server" Text="Edit" CssClass="btn" OnClick="BtnEditMajor_Click" />
            <asp:TextBox ID="txtMajor" runat="server" CssClass="form-control" Visible="false" />
        </div>

        <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" CssClass="btn center-btn" OnClick="BtnUpdate_Click" />

        <hr />

        <asp:HyperLink ID="lnkChangePassword" runat="server" NavigateUrl="ChangePassword.aspx" CssClass="btn center-btn">Change/Update Password</asp:HyperLink>

        <asp:Label ID="lblStatus" runat="server" CssClass="text-success d-block mt-3" />
    </div>
</asp:Content>
