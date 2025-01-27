<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PMU_Campus.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <!-- Title Section -->
        <header class="text-center mb-4">
            <h2 class="display-5">About PMU Campus Web Application</h2>
            <p class="text-muted">
                Enhancing campus life at Prince Mohammad Bin Fahd University through innovative navigation and course review solutions.
            </p>
        </header>

        <!-- Key Features Section -->
        <section class="mb-5">
            <h3 class="mb-3">Key Features</h3>
            <div class="row">
                <div class="col-md-6">
                    <h4><i class="bi bi-map"></i> Interactive 3D Campus Map</h4>
                    <p>Navigate the campus effortlessly with a detailed 3D map, locate buildings, rooms, and points of interest like coffee shops.</p>
                </div>
                <div class="col-md-6">
                    <h4><i class="bi bi-star"></i> Course & Professor Ratings</h4>
                    <p>Access and share insights on courses and professors, helping students make informed academic decisions.</p>
                </div>
            </div>
        </section>

        <!-- Purpose Section -->
        <section class="mb-5">
            <h3 class="mb-3">Purpose</h3>
            <p>
                Our platform is designed to benefit students, faculty, and visitors by providing:
            </p>
            <ul>
                <li>Effortless campus navigation.</li>
                <li>Valuable course and professor insights.</li>
                <li>Streamlined access to campus-related information.</li>
            </ul>
        </section>

        <!-- Technology Section -->
        <section>
            <h3 class="mb-3">Technology</h3>
            <p>
                The application leverages Unity for 3D map integration and a robust backend powered by Python and C#. 
                The frontend employs responsive web technologies for seamless functionality across devices.
            </p>
        </section>
    </div>
</asp:Content>
