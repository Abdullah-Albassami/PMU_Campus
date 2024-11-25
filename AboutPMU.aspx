<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutPMU.aspx.cs" Inherits="PMU_Campus.AboutPMU" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About PMU Campus</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #1E3A5F;
            color: #ffffff;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 60px auto;
            padding: 20px;
            background-color: #ffffff;
            color: #333333;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 36px;
            color: #1E3A5F;
        }

        .header p {
            font-size: 18px;
            color: #555555;
        }

        .content {
            font-size: 18px;
        }

        .content h2 {
            font-size: 24px;
            color: #1E3A5F;
            margin-top: 30px;
        }

        .content p {
            margin-bottom: 20px;
        }

        .content ul {
            list-style-type: disc;
            margin-left: 20px;
        }

        .content ul li {
            margin-bottom: 10px;
        }

        footer {
            text-align: center;
            margin-top: 40px;
            padding: 20px;
            background-color: #1E3A5F;
            color: #ffffff;
        }

        .btn-learn-more {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn-learn-more:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>About PMU Campus Web Application</h1>
            <p>Enhancing Campus Life at Prince Mohammad Bin Fahd University</p>
        </div>
        <div class="content">
            <h2>Introduction</h2>
            <p>This innovative web application is designed to enhance campus life at Prince Mohammad Bin Fahd University (PMU) by providing features like campus navigation and course insights.</p>
            <p>The interactive 3D campus map is being developed to offer an intuitive and simple way for students, faculty, and visitors to explore the PMU campus. Users will be able to locate buildings, rooms, and points of interest with ease, utilizing technologies such as AI pathfinding and Matterport Pro3 3D lidar scanning for precise navigation.</p>

            <h2>Features</h2>
            <ul>
                <li><strong>Interactive 3D Campus Map</strong>: Leverages Unity's powerful real-time development engine to provide a visually immersive way to explore the PMU campus, making it easy for users to locate key points of interest, such as coffee shops and faculty offices.</li>
                <li><strong>Course Insight System</strong>: Offers a collaborative environment where students can rate and review courses. Students can gain insights into course difficulty and provide feedback to help others make informed academic decisions.</li>
                <li><strong>Faculty & Course Ratings</strong>: Allows students to rate both courses and instructors based on their experiences, contributing to a transparent and supportive academic community.</li>
            </ul>

            <h2>Technology Stack</h2>
            <p>The technology stack for this project includes:</p>
            <ul>
                <li><strong>Unity</strong> for 3D campus map integration, ensuring a highly interactive experience.</li>
                <li><strong>Matterport Pro3 3D</strong> lidar scanner for precise campus modeling, enabling accurate representation of buildings and rooms.</li>
                <li><strong>Python & C#</strong> for backend development.</li>
                <li><strong>HTML, CSS, and JavaScript</strong> for the front-end web experience, providing a seamless and responsive user interface.</li>
                <li><strong>Flutter or React Native</strong> for possible future mobile app integration.</li>
            </ul>

            <h2>Target Audience</h2>
            <p>The web application is primarily designed for PMU students, but it will also benefit faculty and campus visitors:</p>
            <ul>
                <li><strong>Students</strong>: Access course reviews, find faculty office hours, and navigate the campus.</li>
                <li><strong>Faculty Members</strong>: Stay connected with students and provide information about courses and office availability.</li>
                <li><strong>Visitors</strong>: Easily navigate the PMU campus and locate important buildings.</li>
            </ul>

            <a href="#" class="btn-learn-more">Learn More</a>
        </div>
    </div>
    <footer>
        &copy; 2024 PMU Campus. All rights reserved.
    </footer>
</body>
</html>
