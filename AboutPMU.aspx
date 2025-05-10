<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PMU_Campus.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Hero Section Styles */
        .about-hero {
            background: linear-gradient(rgba(45, 39, 134, 0.85), rgba(45, 39, 134, 0.95)), url('/images/campus-aerial.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 80px 0;
            text-align: center;
            margin-bottom: 60px;
            border-radius: 0 0 50% 50% / 20px;
        }
        
        .about-hero h1 {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 20px;
            text-shadow: 0 2px 10px rgba(0,0,0,0.3);
        }
        
        .about-hero p {
            font-size: 1.2rem;
            max-width: 800px;
            margin: 0 auto;
            line-height: 1.6;
        }
        
        /* Feature Cards */
        .feature-card {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            padding: 30px;
            height: 100%;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }
        
        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: #ffa500;
            z-index: 2;
        }
        
        .feature-icon {
            font-size: 2.5rem;
            color: #2D2786;
            margin-bottom: 20px;
            display: inline-block;
        }
        
        .feature-card h3 {
            color: #2D2786;
            font-weight: 600;
            margin-bottom: 15px;
        }
        
        /* Purpose Section */
        .purpose-section {
            background-color: #f8f9fa;
            padding: 60px 0;
            margin: 60px 0;
            position: relative;
        }
        
        .purpose-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('/images/pattern.png');
            opacity: 0.05;
        }
        
        .purpose-content {
            position: relative;
            z-index: 1;
        }
        
        .purpose-list {
            list-style: none;
            padding: 0;
            margin: 30px 0;
        }
        
        .purpose-list li {
            padding: 15px 0;
            border-bottom: 1px solid rgba(0,0,0,0.05);
            display: flex;
            align-items: center;
        }
        
        .purpose-list li:last-child {
            border-bottom: none;
        }
        
        .purpose-list li::before {
            content: '✓';
            display: inline-block;
            margin-right: 15px;
            color: #ffa500;
            font-weight: bold;
            font-size: 1.2rem;
        }
        
        /* Technology Section */
        .tech-section {
            padding: 40px 0 60px;
        }
        
        .tech-icons {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
            margin-top: 30px;
        }
        
        .tech-icon {
            text-align: center;
            width: 120px;
        }
        
        .tech-icon img {
            height: 60px;
            margin-bottom: 10px;
        }
        
        .tech-icon span {
            display: block;
            font-size: 0.9rem;
            color: #666;
        }
        
        /* Section Headers */
        .section-header {
            text-align: center;
            margin-bottom: 40px;
        }
        
        .section-header h2 {
            color: #2D2786;
            font-weight: 700;
            position: relative;
            display: inline-block;
            padding-bottom: 15px;
        }
        
        .section-header h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: #ffa500;
        }
        
        .section-header p {
            color: #666;
            max-width: 700px;
            margin: 15px auto 0;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .about-hero {
                padding: 60px 0;
            }
            
            .about-hero h1 {
                font-size: 2.2rem;
            }
            
            .feature-card {
                margin-bottom: 30px;
            }
        }
    </style>

    <!-- Hero Section -->
    <section class="about-hero">
        <div class="container">
            <h1>About PMU Campus</h1>
            <p>Enhancing campus life at Prince Mohammad Bin Fahd University through innovative navigation and course review solutions.</p>
        </div>
    </section>

    <!-- Features Section -->
    <section class="container">
        <div class="section-header">
            <h2>Key Features</h2>
            <p>Discover the tools and resources designed to enhance your campus experience</p>
        </div>
        
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="feature-card">
                    <i class="bi bi-map-fill feature-icon"></i>
                    <h3>Interactive 3D Campus Map</h3>
                    <p>Navigate the campus effortlessly with our detailed 3D map. Locate buildings, classrooms, offices, and points of interest with precision and ease.</p>
                </div>
            </div>
            
            <div class="col-md-4 mb-4">
                <div class="feature-card">
                    <i class="bi bi-star-fill feature-icon"></i>
                    <h3>Course & Professor Ratings</h3>
                    <p>Access and share insights on courses and professors. Make informed decisions about your academic journey with real feedback from fellow students.</p>
                </div>
            </div>
            
            <div class="col-md-4 mb-4">
                <div class="feature-card">
                    <i class="bi bi-info-circle-fill feature-icon"></i>
                    <h3>Comprehensive Information</h3>
                    <p>Find detailed information about instructors, office hours, course schedules, and classroom locations all in one convenient platform.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Purpose Section -->
    <section class="purpose-section">
        <div class="container purpose-content">
            <div class="section-header">
                <h2>Our Purpose</h2>
                <p>Creating a more connected and informed campus community</p>
            </div>
            
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <img src="/images/students.jpg" alt="PMU Students" class="img-fluid rounded shadow" onerror="this.src='https://via.placeholder.com/600x400?text=PMU+Students'">
                </div>
                
                <div class="col-lg-6 mt-4 mt-lg-0">
                    <p>Our platform is designed to benefit students, faculty, and visitors by providing a comprehensive suite of tools that enhance the campus experience:</p>
                    
                    <ul class="purpose-list">
                        <li>Effortless navigation around campus buildings and facilities</li>
                        <li>Valuable insights into courses and professor teaching styles</li>
                        <li>Streamlined access to important campus information</li>
                        <li>Enhanced connectivity between students and academic resources</li>
                        <li>Improved campus experience for visitors and new students</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Technology Section -->
    <section class="tech-section container">
        <div class="section-header">
            <h2>Technology</h2>
            <p>Powered by cutting-edge technologies for optimal performance</p>
        </div>
        
        <p class="text-center mb-4">
            The application leverages Unity for 3D map integration and a robust backend powered by Python and C#. 
            The frontend employs responsive web technologies for seamless functionality across all devices.
        </p>
        
        <div class="tech-icons">
            <div class="tech-icon">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/unity/unity-original.svg" alt="Unity" onerror="this.src='https://via.placeholder.com/60x60?text=Unity'">
                <span>Unity</span>
            </div>
            <div class="tech-icon">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/csharp/csharp-original.svg" alt="C#" onerror="this.src='https://via.placeholder.com/60x60?text=C%23'">
                <span>C#</span>
            </div>
            <div class="tech-icon">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" alt="Python" onerror="this.src='https://via.placeholder.com/60x60?text=Python'">
                <span>Python</span>
            </div>
            <div class="tech-icon">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="HTML5" onerror="this.src='https://via.placeholder.com/60x60?text=HTML5'">
                <span>HTML5</span>
            </div>
            <div class="tech-icon">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/css3/css3-original.svg" alt="CSS3" onerror="this.src='https://via.placeholder.com/60x60?text=CSS3'">
                <span>CSS3</span>
            </div>
            <div class="tech-icon">
                <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" alt="JavaScript" onerror="this.src='https://via.placeholder.com/60x60?text=JavaScript'">
                <span>JavaScript</span>
            </div>
        </div>
    </section>

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</asp:Content>
