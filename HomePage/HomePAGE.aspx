<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="HomePAGE.aspx.cs" Inherits="PMU_Campus.HomePage.HomePAGE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-content">

        <!-- Embedded CSS -->
        <style>
            body {
                margin: 0;
                font-family: 'Segoe UI', Arial, sans-serif;
                background-color: #2D2786; 
            }


            .background-image {
                background-image: url("../images/background.png");
                background-size: cover;
                background-position: center;
            }
            header.header {
                background: #2D2786;
                margin-top: 0;
                padding-top: 20px;
            }
            nav {
                margin-bottom: 0;
                padding-bottom: 0;
            }

            .header {
                background: #2D2786;
                padding: 20px;
                color: white;
                text-align: center;
            }

            .PMU-Header {
                font-family: 'Monotage Sans', sans-serif;
                font-size: 35px;
                margin: 0;
            }

            .PMU-SecondHeader {
                font-family: 'LEMON MILK', sans-serif;
                font-size: 12px;
                color: #FBBD04;
                margin-top: 10px;
            }

            .hero {
                width: 100%;
                background: url("../images/background.png") no-repeat center center;
                background-size: cover;
                padding: 70px 210px; /* was 60px 20px */
                text-align: left;
                color: white;
            }


            .hero h1 {
                font-size: 2.8rem;
                margin-bottom: 15px;
                font-family: 'Segoe UI', sans-serif;
                font-weight: normal;
            }

            .Header-fontsize {
                font-size: 1.2rem;
                line-height: 1.5;
                font-family: 'Segoe UI', sans-serif;
            }

            .btn-signin, .btn-primary {
                background: orange;
                color: white;
                padding: 8px 25px;
                border: none;
                border-radius: 30px;
                font-size: 1rem;
                font-weight: bold;
                text-decoration: none;
                display: inline-block;
                text-align: center;
                transition: background 0.3s ease;
            }

            .btn-signin:hover, .btn-primary:hover {
                background: #d47500;
            }

            .navigation-feedback-wrapper {
                position: relative;
                z-index: 1;
                background: #f9f9f9;
            }

            .navigation-feedback-wrapper::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: url("../images/Backimg.png") no-repeat center center;
                background-size: 38%;
                opacity: 0.05;
                filter: grayscale(100%);
                z-index: 0;
            }

            .navigation-section, .feedback-section {
                padding: 50px 20px;
                text-align: center;
                position: relative;
                z-index: 1;
                background: transparent;
            }

            .navigation-section h2, .feedback-section h2 {
                font-size: 2rem !important;
                font-family: 'Segoe UI', sans-serif;
                font-weight: bold;
                margin-bottom: 30px;
            }

            .grid, .feedback-grid {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                gap: 20px;
            }

            .card-wrapper {
                text-align: center;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .card {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                width: 450px;
                overflow: hidden;
            }

            .image-container {
                position: relative;
                width: 100%;
                height: 300px;
                overflow: hidden;
                border-radius: 10px;
            }

            .image-container img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                display: block;
                border-radius: 10px;
            }

            .btn-overlay {
                position: absolute;
                bottom: 15px;
                left: 15px;
                background: #2D2786;
                color: white;
                padding: 8px 15px;
                border-radius: 5px;
                font-size: 1rem;
                font-weight: bold;
                text-decoration: none;
                transition: transform 0.3s ease;
            }

            .btn-overlay:hover {
                background: #1f1b6b;
                transform: translateY(-5px);
            }

            .feedback-card {
                background: #D3D3D3;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                width: 220px;
                font-size: 1rem;
                font-weight: bold;
                color: black;
                text-align: center;
            }

            h2 {
                font-family: 'Segoe UI', sans-serif;
                font-weight: bold;
            }
            .navigation-section, 
            .feedback-section, 
            .navigation-section h2, 
            .feedback-section h2, 
            .card-wrapper p {
                font-size: 1.2rem;
                font-weight: 500;
                color: black;
            }

        </style>


        <!-- Header Section -->
        <header class="header">
            <div class="PMU-Header">
                <p>P R I N C E&nbsp; &nbsp;M O H A M M A D&nbsp; &nbsp;B I N&nbsp; &nbsp;F A H D&nbsp; &nbsp;U N I V E R S T Y</p>
                <p class="PMU-SecondHeader">C&nbsp; &nbsp;R&nbsp; &nbsp;E&nbsp; &nbsp;A&nbsp; &nbsp;T&nbsp; &nbsp;I&nbsp; &nbsp;V&nbsp; &nbsp;E&nbsp; &nbsp; &nbsp; &nbsp;M&nbsp; &nbsp;I&nbsp; &nbsp;N&nbsp; &nbsp;D&nbsp; &nbsp;S&nbsp;,&nbsp; &nbsp; T&nbsp; &nbsp;R&nbsp; &nbsp;A&nbsp; &nbsp;N&nbsp; &nbsp;S&nbsp; &nbsp;F&nbsp; &nbsp;O&nbsp; &nbsp;R&nbsp; &nbsp;M&nbsp; &nbsp; &nbsp; T&nbsp; &nbsp;H&nbsp; &nbsp;E&nbsp; &nbsp; &nbsp; &nbsp;W&nbsp; &nbsp;O&nbsp; &nbsp;R&nbsp; &nbsp;L&nbsp; &nbsp;D</p>
            </div>

            <div class="hero">
                <h1>Welcome to PMU Campus</h1>
                <p class="Header-fontsize">
                    Find Your Way Around Campus and <br />
                    Rate Courses and Professors with Ease
                </p>
                <a href="/Navigation.aspx" class="btn-primary">Explore Features</a>
            </div>
        </header>

        <!-- Navigation Section -->
        <div class="navigation-feedback-wrapper">
            <section class="navigation-section">
                <h2>Discover Your Way Around Campus</h2>
                <div class="grid">
                    <div class="card-wrapper">
                        <div class="card">
                            <div class="image-container">
                                <img src="../images/pic2.png" alt="Explore PMU Campus Map" />
                                <a href="../Navigation" class="btn-overlay">Explore</a>
                            </div>
                        </div>
                        <p>Explore the entire campus effortlessly.</p>
                    </div>

                    <div class="card-wrapper">
                        <div class="card">
                            <div class="image-container">
                                <img src="../images/pic1.png" alt="Navigate PMU Buildings" />
                                <a href="../Navigation" class="btn-overlay">Explore</a>
                            </div>
                        </div>
                        <p>Navigate through the buildings with ease.</p>
                    </div>
                </div>
            </section>

            <section class="feedback-section">
                <h2>Provide Feedback on Courses and Professors</h2>
                <div class="feedback-grid">
                    <div class="feedback-card">Overall Rating</div>
                    <div class="feedback-card">Search by Instructor Name</div>
                    <div class="feedback-card">Search by Course Name</div>
                </div>
                <a href="/Rating/Rate" class="btn-primary">Explore Rating</a>
            </section>
        </div>

    </div>
</asp:Content>
