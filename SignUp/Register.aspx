<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PMU_Campus.SignUp.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }

        form {
            display: inline-block;
            text-align: left;
            margin-top: 50px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            margin: 0 auto;
            width: 100%;
        }

        td {
            padding: 8px;
        }

        .login-link {
            margin-top: 10px;
            text-align: center;
            display: block;
        }

        .login-link a {
            text-decoration: none;
            color: #0066cc;
            font-size: 14px;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        h1 {
            margin-bottom: 20px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <h1>Create Your Account</h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelMajor" runat="server" Text="Major:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxMajorName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Student Email:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator1" 
                        runat="server" 
                        ErrorMessage="Invalid Email. You must use a PMU Email!" 
                        ForeColor="Red" 
                        ControlToValidate="TextBoxEmail" 
                        ValidationExpression="^[a-zA-Z0-9._%+-]+@pmu\.edu\.sa$">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Password:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Confirm Password:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator 
                        ID="CompareValidator1" 
                        runat="server" 
                        ControlToValidate="TextBoxConfirmPassword" 
                        ControlToCompare="TextBoxPassword" 
                        ErrorMessage="Passwords do not match!" 
                        ForeColor="Red">
                    </asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                </td>
            </tr>
        </table>
        <div class="login-link">
            Already have an account? <asp:HyperLink ID="HyperLinkLogin" runat="server" NavigateUrl="../LogIn/SignIn.aspx">Sign in here</asp:HyperLink>
        </div>
    </form>
</body>

</html>
