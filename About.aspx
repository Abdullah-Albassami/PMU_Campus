<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PMU_Campus.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Main Styles */
        .about-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* Split Header Design */
        .split-header {
            display: flex;
            flex-wrap: wrap;
            margin-top: 40px;
            margin-bottom: 60px;
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        }
        
        .header-content {
            flex: 1;
            min-width: 300px;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .header-image {
            flex: 1;
            min-width: 300px;
            background: linear-gradient(135deg, rgba(45, 39, 134, 0.9), rgba(45, 39, 134, 0.7)), 
                        url('https://via.placeholder.com/800x600?text=PMU+Campus') center/cover no-repeat;
            min-height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }
        
        .header-image::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            background: url('https://via.placeholder.com/100x100?text=Pattern') repeat;
            opacity: 0.1;
            animation: backgroundScroll 30s linear infinite;
        }
        
        @keyframes backgroundScroll {
            from { transform: translateX(0) translateY(0); }
            to { transform: translateX(-50%) translateY(-50%); }
        }
        
        .header-title {
            font-size: 2.5rem;
            color: #2D2786;
            margin-bottom: 20px;
            font-weight: 800;
            line-height: 1.2;
        }
        
        .header-subtitle {
            font-size: 1.1rem;
            color: #666;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        
        .header-buttons {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }
        
        .btn-primary {
            background-color: #2D2786;
            color: white;
            padding: 12px 25px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-block;
            border: none;
        }
        
        .btn-primary:hover {
            background-color: #1a1660;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(45, 39, 134, 0.3);
        }
        
        .btn-secondary {
            background-color: transparent;
            color: #2D2786;
            padding: 12px 25px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-block;
            border: 2px solid #2D2786;
        }
        
        .btn-secondary:hover {
            background-color: rgba(45, 39, 134, 0.1);
            transform: translateY(-3px);
        }
        
        /* Features Section */
        .features-section {
            padding: 60px 0;
        }
        
        .section-title {
            text-align: center;
            margin-bottom: 50px;
            position: relative;
        }
        
        .section-title h2 {
            font-size: 2rem;
            color: #2D2786;
            display: inline-block;
            position: relative;
            z-index: 1;
        }
        
        .section-title h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 100%;
            height: 3px;
            background: #ffa500;
        }
        
        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 30px;
        }
        
        .feature-item {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .feature-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .feature-icon-wrapper {
            background: #2D2786;
            padding: 25px;
            text-align: center;
        }
        
        .feature-icon {
            font-size: 2.5rem;
            color: white;
        }
        
        .feature-content {
            padding: 25px;
        }
        
        .feature-content h3 {
            color: #2D2786;
            margin-bottom: 15px;
            font-weight: 600;
        }
        
        .feature-content p {
            color: #666;
            line-height: 1.6;
        }
        
        /* Purpose Section with Timeline */
        .purpose-section {
            padding: 80px 0;
            background-color: #f8f9fa;
            position: relative;
        }
        
        .purpose-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://via.placeholder.com/100x100?text=Dots') repeat;
            opacity: 0.05;
        }
        
        .timeline {
            position: relative;
            max-width: 1200px;
            margin: 40px auto 0;
        }
        
        .timeline::after {
            content: '';
            position: absolute;
            width: 6px;
            background-color: #2D2786;
            top: 0;
            bottom: 0;
            left: 50%;
            margin-left: -3px;
            border-radius: 3px;
        }
        
        .timeline-item {
            padding: 10px 40px;
            position: relative;
            width: 50%;
            box-sizing: border-box;
        }
        
        .timeline-item:nth-child(odd) {
            left: 0;
        }
        
        .timeline-item:nth-child(even) {
            left: 50%;
        }
        
        .timeline-item::after {
            content: '';
            position: absolute;
            width: 25px;
            height: 25px;
            background-color: white;
            border: 4px solid #ffa500;
            top: 15px;
            border-radius: 50%;
            z-index: 1;
        }
        
        .timeline-item:nth-child(odd)::after {
            right: -17px;
        }
        
        .timeline-item:nth-child(even)::after {
            left: -17px;
        }
        
        .timeline-content {
            padding: 20px 30px;
            background-color: white;
            position: relative;
            border-radius: 6px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .timeline-content h3 {
            color: #2D2786;
            margin-bottom: 10px;
        }
        
        .timeline-content p {
            color: #666;
            line-height: 1.6;
        }
        
        /* Technology Cards */
        .tech-section {
            padding: 60px 0;
        }
        
        .tech-cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 40px;
        }
        
        .tech-card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            width: 160px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }
        
        .tech-card:hover {
            transform: translateY(-10px);
        }
        
        .tech-card img {
            width: 60px;
            height: 60px;
            margin-bottom: 15px;
        }
        
        .tech-card h4 {
            color: #2D2786;
            font-size: 1rem;
            margin-bottom: 5px;
        }
        
        .tech-card p {
            color: #666;
            font-size: 0.85rem;
        }
        
        /* Call to Action */
        .cta-section {
            background: linear-gradient(135deg, #2D2786, #1a1660);
            padding: 60px 0;
            text-align: center;
            color: white;
            border-radius: 15px;
            margin: 60px 20px;
        }
        
        .cta-content {
            max-width: 700px;
            margin: 0 auto;
        }
        
        .cta-content h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }
        
        .cta-content p {
            margin-bottom: 30px;
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .btn-cta {
            background-color: #ffa500;
            color: white;
            padding: 15px 30px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-block;
            border: none;
        }
        
        .btn-cta:hover {
            background-color: #ff8c00;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(255, 165, 0, 0.3);
        }
        
        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .header-title {
                font-size: 2rem;
            }
            
            .header-content {
                padding: 30px;
            }
            
            .timeline::after {
                left: 31px;
            }
            
            .timeline-item {
                width: 100%;
                padding-left: 70px;
                padding-right: 25px;
            }
            
            .timeline-item:nth-child(even) {
                left: 0;
            }
            
            .timeline-item::after {
                left: 15px;
            }
            
            .timeline-item:nth-child(odd)::after {
                right: auto;
                left: 15px;
            }
            
            .header-buttons {
                flex-direction: column;
                gap: 10px;
            }
            
            .btn-primary, .btn-secondary {
                text-align: center;
            }
        }
    </style>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <div class="about-container">
        <!-- Split Header Section -->
        <div class="split-header">
            <div class="header-content">
                <h1 class="header-title">Discover PMU Campus Navigation</h1>
                <p class="header-subtitle">Enhancing campus life at Prince Mohammad Bin Fahd University through innovative navigation and course review solutions. Our platform connects students, faculty, and visitors with the resources they need.</p>
                <div class="header-buttons">
                    <a href="/Navigation.aspx" class="btn-primary">Try Campus Navigation</a>
                    <a href="/Rating/Rate" class="btn-secondary">Rate Courses</a>
                </div>
            </div>
            <div class="header-image">
                <!-- Background image is set in CSS -->
            </div>
        </div>
        
        <!-- Features Section -->
        <section class="features-section">
            <div class="section-title">
                <h2 style="color: white">Key Features</h2>
            </div>
            
            <div class="feature-grid">
                <div class="feature-item">
                    <div class="feature-icon-wrapper">
                        <i class="fas fa-map-marked-alt feature-icon"></i>
                    </div>
                    <div class="feature-content">
                        <h3>Interactive 3D Campus Map</h3>
                        <p>Navigate the campus effortlessly with our detailed 3D map. Locate buildings, classrooms, offices, and points of interest with precision and ease.</p>
                    </div>
                </div>
                
                <div class="feature-item">
                    <div class="feature-icon-wrapper">
                        <i class="fas fa-star feature-icon"></i>
                    </div>
                    <div class="feature-content">
                        <h3>Course & Professor Ratings</h3>
                        <p>Access and share insights on courses and professors. Make informed decisions about your academic journey with real feedback from fellow students.</p>
                    </div>
                </div>
                
                <div class="feature-item">
                    <div class="feature-icon-wrapper">
                        <i class="fas fa-info-circle feature-icon"></i>
                    </div>
                    <div class="feature-content">
                        <h3>Comprehensive Information</h3>
                        <p>Find detailed information about instructors, office hours, course schedules, and classroom locations all in one convenient platform.</p>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Purpose Section with Timeline -->
        <section class="purpose-section">
            <div class="about-container">
                <div class="section-title">
                    <h2>Our Purpose</h2>
                </div>
                
                <div class="timeline">
                    <div class="timeline-item">
                        <div class="timeline-content">
                            <h3>Campus Navigation</h3>
                            <p>Providing effortless navigation around campus buildings and facilities, helping students, faculty, and visitors find their way with ease.</p>
                        </div>
                    </div>
                    
                    <div class="timeline-item">
                        <div class="timeline-content">
                            <h3>Course Insights</h3>
                            <p>Offering valuable insights into courses and professor teaching styles to help students make informed decisions about their academic journey.</p>
                        </div>
                    </div>
                    
                    <div class="timeline-item">
                        <div class="timeline-content">
                            <h3>Streamlined Access</h3>
                            <p>Streamlined access to important campus information to help students, faculty, and visitors find their way with ease.</p>
                        </div>
                    </div>
                    
                    <div class="timeline-item">
                        <div class="timeline-content">
                            <h3>Enhanced Connectivity</h3>
                            <p>Enhanced connectivity between students and academic resources to help students make informed decisions about their academic journey.</p>
                        </div>
                    </div>
                    
                    <div class="timeline-item">
                        <div class="timeline-content">
                            <h3>Improved Campus Experience</h3>
                            <p>Improved campus experience for visitors and new students to help students, faculty, and visitors find their way with ease.</p>
                        </div>
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
            
            <div class="tech-cards">
                <div class="tech-card">
                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/unity/unity-original.svg" alt="Unity">
                    <h4>Unity</h4>
                    <p>Unity is a powerful game engine used for creating 3D and 2D games and applications.</p>
                </div>
                <div class="tech-card">
                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/csharp/csharp-original.svg" alt="C#">
                    <h4>C#</h4>
                    <p>C# is a modern, object-oriented programming language used for developing applications.</p>
                </div>
                <div class="tech-card">
                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" alt="Python">
                    <h4>Python</h4>
                    <p>Python is a high-level, interpreted programming language used for general-purpose programming.</p>
                </div>
                <div class="tech-card">
                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="HTML5">
                    <h4>HTML5</h4>
                    <p>HTML5 is the latest version of the HTML standard used for structuring web content.</p>
                </div>
                <div class="tech-card">
                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/css3/css3-original.svg" alt="CSS3">
                    <h4>CSS3</h4>
                    <p>CSS3 is the latest version of the CSS standard used for styling web content.</p>
                </div>
                <div class="tech-card">
                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" alt="JavaScript">
                    <h4>JavaScript</h4>
                    <p>JavaScript is a scripting language used for adding interactivity to web pages.</p>
                </div>
            </div>
        </section>
        
        <!-- Call to Action -->
        <section class="cta-section">
            <div class="cta-content">
                <h2>Ready to Explore?</h2>
                <p>Join our community and discover the power of PMU Campus Navigation.</p>
                <a href="/Navigation.aspx" class="btn-cta">Try Campus Navigation</a>
            </div>
        </section>
    </div>
</asp:Content>
