<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PMU_Campus._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Splash Screen -->
    <div class="splash-screen" id="splash">
        <div class="moving-image"></div>
    </div>

    <!-- Main Content (Hidden Initially) -->
    <main id="mainContent" style="opacity: 0;">
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">ASP.NET</h1>
            <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
            <p><a href="http://www.asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a></p>
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle">Getting Started</h2>
                <p>
                    ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
                    A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="librariesTitle">
                <h2 id="librariesTitle">Get More Libraries</h2>
                <p>
                    NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="hostingTitle">
                <h2 id="hostingTitle">Web Hosting</h2>
                <p>
                    You can easily find a web hosting company that offers the right mix of features and price for your applications.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                </p>
            </section>
        </div>
    </main>

    <!-- JavaScript for Splash and Redirect -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const splash = document.getElementById("splash");
            const mainContent = document.getElementById("mainContent");

            // Show splash screen and then redirect
            setTimeout(() => {
                splash.style.opacity = "0"; // Fade out effect
                setTimeout(() => {
                    splash.style.display = "none"; // Hide splash completely
                    window.location.href = "/HomePAGE/HomePAGE.aspx"; // Redirect to homepage
                }, 1000); // Wait for fade-out animation
            }, 3000); // Show splash for 3 seconds
        });
    </script>

    <style>
        /* Splash screen styling */
        .splash-screen {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            background-color: #111;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            transition: opacity 1s ease-out;
        }

        /* Moving Image Animation */
        .moving-image {
            width: 300px;
            height: 300px;
            background: url('/Images/logo4.png') no-repeat center center / cover;
            border-radius: 50%;
            animation: moveAround 3s infinite ease-in-out;
        }

@keyframes moveAround {
    0% { transform: translate(0, 0) scale(1); }
    25% { transform: translate(60px, -60px) scale(1.2); }
    50% { transform: translate(-60px, 60px) scale(1); }
    75% { transform: translate(40px, -40px) scale(0.95); }
    100% { transform: translate(0, 0) scale(1); }
}
    </style>
</asp:Content>
