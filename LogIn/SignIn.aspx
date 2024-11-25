<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="PMU_Campus.LogIn.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In</title>
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

        .register-link {
            margin-top: 10px;
            text-align: center;
            display: block;
        }

        .register-link a {
            text-decoration: none;
            color: #0066cc;
            font-size: 14px;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        h1 {
            margin-bottom: 20px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <h1>Sign In</h1>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="User Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="StudentEmail" runat="server" Text="Student Email:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator1" 
                        runat="server" 
                        ErrorMessage="Invalid Email. You must use a PMU Email!" 
                        ForeColor="Red" 
                        ControlToValidate="TextBox1" 
                        ValidationExpression="^[a-zA-Z0-9._%+-]+@pmu\.edu\.sa$">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="Button1" runat="server" Text="Log in" />
                </td>
            </tr>
        </table>
        <div class="register-link">
            Don't have an account? <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="../SignUp/Register.aspx">Register here</asp:HyperLink>
        </div>
    </form>
</body>

</html>
