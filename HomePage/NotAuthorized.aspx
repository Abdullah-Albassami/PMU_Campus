<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotAuthorized.aspx.cs" Inherits="PMU_Campus.HomePAGE.NotAuthorized" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Access Denied</title>
    <style>
        .centered {
            text-align: center;
            margin-top: 100px;
            font-family: Arial, sans-serif;
        }
        .error-box {
            border: 1px solid #ff4d4d;
            background-color: #ffe6e6;
            padding: 20px;
            display: inline-block;
            border-radius: 8px;
        }
        .error-title {
            color: #cc0000;
            font-size: 28px;
            font-weight: bold;
        }
        .error-message {
            color: #333;
            font-size: 18px;
            margin-top: 10px;
        }
        a.home-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="centered">
        <div class="error-box">
            <div class="error-title">Access Denied</div>
            <div class="error-message">You are not authorized to view this page.</div>
            <a class="home-link" href="/HomePage/HomePAGE.aspx">Return to Home</a>
        </div>
    </div>
    </form>
</body>
</html>
