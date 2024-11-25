<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePAGE.aspx.cs" Inherits="PMU_Campus.HomePage.HomePAGE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PMU Campus - Home Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #1E3A5F;
            color: #ffffff;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #1E3A5F;
            padding: 20px;
            text-align: center;
        }

        header h1 {
            color: #ffffff;
            margin: 0;
        }

        nav .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #333333;
            padding: 10px 30px;
        }

        nav .logo {
            height: 50px;
        }

        nav .nav-links a {
            color: #ffffff;
            text-decoration: none;
            margin-right: 20px;
            font-size: 16px;
        }

        nav .nav-links a:hover {
            color: #ffa500;
        }

        .main-content {
            padding: 40px 20px;
            text-align: center;
        }

        .main-content img.background-image {
            width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        .call-to-action {
            margin-top: 40px;
        }

        .call-to-action a {
            display: inline-block;
            background-color: #007bff;
            color: #ffffff;
            padding: 15px 25px;
            margin: 10px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .call-to-action a:hover {
            background-color: #0056b3;
        }

        footer {
            background-color: #333333;
            padding: 20px;
            text-align: center;
            color: #ffffff;
        }

        footer a {
            color: #ffa500;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Welcome to PMU Campus Website</h1>
        </header>

        <nav>
            <div class="header">
                <img src="../images/PMUNAVLogo1.png" alt="logo" class="logo" />
                <div class="nav-links">
                    <a href="#">About PMU Campus</a>
                    <a href="#">Navigations</a>
                    <a href="../Rating/Rate">Rate Courses & Professors</a>
                    <a href="../LogIn/SignIn.aspx" class="sign-in-button"><strong>Sign in</strong></a>
                </div>
            </div>
        </nav>


            <div>
            <img src="../images/background.png" alt="Background Image" class="background-image" />
            </div>

    <form id="form1" runat="server">

    </form>
    </div>
</body>
</html>
