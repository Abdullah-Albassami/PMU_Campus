<%@ Page Title="Campus Navigation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Navigation.aspx.cs" Inherits="PMU_Campus.Navigation" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Unity-specific styles -->
    <link rel="shortcut icon" href="Unity/TemplateData/favicon.ico">
    <link rel="stylesheet" href="Unity/TemplateData/style.css">
    <style>
        #unity-container {
            margin-bottom: 20px;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            position: relative;
        }
        
        #unity-canvas {
            width: 100% !important;
            height: 600px !important;
            background: #231F20;
            float: none !important;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }
        
        #unity-loading-bar {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            z-index: 10;
        }
        
        #unity-footer {
            position: relative;
            width: 100%;
        }
        
        #unity-fullscreen-button {
            float: right;
            width: 38px;
            height: 38px;
            background: url('Unity/TemplateData/fullscreen-button.png') no-repeat center;
            background-size: contain;
        }
        
        #roomInfo {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin-top: 20px;
        width: 100%;
            max-width: 300px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            color: #333; /* Dark text for light background */
            text-align: left;
        }
        
        #roomInfo div {
            margin-bottom: 8px;
            line-height: 1.5;
        }
        
        #coursePopup {
            position: relative;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            z-index: 1000;
            width: 100%;
            margin-top: 20px;
            color: #333; /* Dark text for light background */
            display: none;
        }
        
        .popup-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            background-color: #4CAF50;
            padding: 10px 15px;
            border-radius: 4px 4px 0 0;
        }
        
        .popup-header h2 {
            margin: 0;
            color: white;
            font-size: 18px;
        }
        
        .close-btn {
            font-size: 24px;
            cursor: pointer;
            color: white;
        }
        
        .close-btn:hover {
            color: #f0f0f0;
        }
        
        .popup-content p {
            margin: 8px 0;
        }
        
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
        border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            width: auto;
            min-width: 100px;
        }
        
        .button:hover {
            background-color: #45a049;
        }
        
        #roomInput {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 200px;
            margin-right: 10px;
        }

        .navigation-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            margin: 30px auto;
            max-width: 1600px;
            color: #333;
        }

        .navigation-title {
            color: #2D2786;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 28px;
        }

        .navigation-description {
            text-align: center;
            margin-bottom: 30px;
            color: #555;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .navigation-layout {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: flex-start;
            gap: 30px;
        }
        
        .unity-wrapper {
            flex: 1;
            min-width: 300px;
            max-width: 1200px;
        }
        
        .controls-wrapper {
            width: 350px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .controls-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #2D2786;
            text-align: center;
    }

        .input-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            width: 100%;
        }
        
        .input-group .button {
            margin-top: 0;
            white-space: nowrap;
        }

        #MainContent_roomInput {
            flex: 1;
            margin-right: 10px;
            width: auto;
    }
</style>

    <div class="navigation-container">
        <h2 class="navigation-title">PMU Campus Navigation</h2>
        <p class="navigation-description">Explore the PMU campus with our interactive 3D navigation system. Enter a room number to find your way and view instructor information.</p>
        
        <div class="navigation-layout">
            <!-- Unity Container -->
            <div class="unity-wrapper">
                <div id="unity-container">
                    <canvas id="unity-canvas"></canvas>
                    <div id="unity-loading-bar">
                        <div id="unity-logo"></div>
                        <div id="unity-progress-bar-empty">
                            <div id="unity-progress-bar-full"></div>
                        </div>
                    </div>
                    <div id="unity-warning"></div>
                    <div id="unity-footer">
                        <div id="unity-webgl-logo"></div>
                        <div id="unity-fullscreen-button"></div>
                        <div id="unity-build-title">PMU Campus Navigation</div>
                    </div>
                </div>
            </div>
            
            <!-- Controls -->
            <div class="controls-wrapper">
                <div class="controls-title">Room Navigation</div>
                <div class="input-group">
                    <asp:TextBox ID="roomInput" runat="server" placeholder="Enter room name"></asp:TextBox>
                    <asp:Button ID="navigateButton" runat="server" Text="Navigate" OnClientClick="sendInputToUnity(); return false;" CssClass="button" />
                </div>

                <div id="roomInfo" style="visibility:hidden; margin-top: 20px;">
                    <div id="instructorName">Instructor Name: </div>
                    <div id="instructorEmail">Instructor Email: </div>
                    <div id="phoneNumber">Phone Number: </div>
                    <div id="officeHours">Office Hours: </div>
                    <div id="coursesTaught">Courses Taught: </div>
                </div>
                
                <div id="coursePopup"></div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        // Get references to ASP.NET controls after the page has loaded
        var roomInputControl;
        
        var container;
        var canvas;
        var loadingBar;
        var progressBarFull;
        var fullscreenButton;
        var warningBanner;

        // Define room information data globally so it can be accessed by all functions
        //JS OBJECTS JAVA OBJECT --- ctrl f search tags --- 
        const roomData = {
            "f005": {
                instructorName: "Dr. Ghassen Ben Brahim",
                instructorEmail: "gbrahim@pmu.edu.sa",
                phoneNumber: "+966 13 872 3948",
                officeHours: "Monday 11:00 AM - 12:30 PM, Wednesday 2:30 PM - 4:00 PM",
                courses: [
                    {
                        name: "CS100",
                        description: "Introduction to Computer Science.",
                        schedule: "Sunday 8:00 AM - 9:30 AM, Tuesday 8:00 AM - 9:30 AM",
                        classroom: "f034",
                        textbook: "Computer Science: An Overview by Brookshear",
                        prerequisites: "None"
                    }
                ]
            },
            "f015": {
                instructorName: "Dr. Majid Ali Khan",
                instructorEmail: "makhan@pmu.edu.sa",
                phoneNumber: "+966 13 846 2753",
                officeHours: "Tuesday 9:00 AM - 10:30 AM, Thursday 1:00 PM - 2:30 PM",
                courses: [
                    {
                        name: "CS100",
                        description: "Introduction to Computer Science.",
                        schedule: "Monday 10:00 AM - 11:30 AM, Wednesday 10:00 AM - 11:30 AM",
                        classroom: "f003",
                        textbook: "Computer Science: An Overview by Brookshear",
                        prerequisites: "None"
                    },
                    {
                        name: "CS200",
                        description: "Intermediate Computer Science.",
                        schedule: "Sunday 10:00 AM - 11:30 AM, Tuesday 11:00 AM - 12:30 PM",
                        classroom: "f004",
                        textbook: "Data Structures and Algorithms by Goodrich",
                        prerequisites: "CS100"
                    }
                ]
            },
            "f041": {
                instructorName: "Dr. Nazeeruddin Mohammad",
                instructorEmail: "nmohammad@pmu.edu.sa",
                phoneNumber: "+966 13 853 7612",
                officeHours: "Sunday 12:00 PM - 1:30 PM, Tuesday 3:00 PM - 4:30 PM",
                courses: [
                    {
                        name: "PHYS101",
                        description: "Physics I: Mechanics.",
                        schedule: "Monday 8:00 AM - 9:30 AM, Wednesday 8:00 AM - 9:30 AM",
                        classroom: "f008",
                        textbook: "University Physics by Young and Freedman",
                        prerequisites: "None"
                    }
                ]
            },
            "f014": {
                instructorName: "Dr. Anwar Majid Mirza",
                instructorEmail: "amirza@pmu.edu.sa",
                phoneNumber: "+966 13 877 4951",
                officeHours: "Monday 8:30 AM - 10:00 AM, Thursday 1:30 PM - 3:00 PM",
                courses: [
                    {
                        name: "CS200",
                        description: "Intermediate Computer Science.",
                        schedule: "Monday 10:30 AM - 12:00 PM, Wednesday 12:00 PM - 1:30 PM",
                        classroom: "f024",
                        textbook: "Data Structures and Algorithms by Goodrich",
                        prerequisites: "CS100"
                    }
                ]
            },
            "f010": {
                instructorName: "Dr. Shahabuddin Muhammad",
                instructorEmail: "smuhammad@pmu.edu.sa",
                phoneNumber: "+966 13 849 5206",
                officeHours: "Wednesday 9:00 AM - 10:30 AM, Sunday 2:00 PM - 3:30 PM",
                courses: [
                    {
                        name: "CS200",
                        description: "Intermediate Computer Science.",
                        schedule: "Tuesday 8:00 AM - 9:30 AM, Thursday 8:00 AM - 9:30 AM",
                        classroom: "f027",
                        textbook: "Data Structures and Algorithms by Goodrich",
                        prerequisites: "CS100"
                    }
                ]
            },
            "f019": {
                instructorName: "Dr. Marius Nagy",
                instructorEmail: "mnagy@pmu.edu.sa",
                phoneNumber: "+966 13 864 1823",
                officeHours: "Tuesday 1:30 PM - 3:00 PM, Thursday 10:30 AM - 12:00 PM",
                courses: [
                    {
                        name: "PHYS101",
                        description: "Physics I: Mechanics.",
                        schedule: "Monday 10:00 AM - 11:30 AM, Wednesday 10:00 AM - 11:30 AM",
                        classroom: "f028",
                        textbook: "University Physics by Young and Freedman",
                        prerequisites: "None"
                    }
                ]
            },
            "f007": {
                instructorName: "Dr. Abul Bashar",
                instructorEmail: "abashar@pmu.edu.sa",
                phoneNumber: "+966 13 848 3920",
                officeHours: "Sunday 10:00 AM - 11:30 AM, Wednesday 12:30 PM - 2:00 PM",
                courses: [
                    {
                        name: "PHYS101",
                        description: "Physics I: Mechanics.",
                        schedule: "Tuesday 10:00 AM - 11:30 AM, Thursday 10:00 AM - 11:30 AM",
                        classroom: "f030",
                        textbook: "University Physics by Young and Freedman",
                        prerequisites: "None"
                    }
                ]
            },
            "f013": {
                instructorName: "Dr. Kashif Amjad",
                instructorEmail: "kamjad@pmu.edu.sa",
                phoneNumber: "+966 13 874 2497",
                officeHours: "Monday 2:00 PM - 3:30 PM, Wednesday 9:00 AM - 10:30 AM",
                courses: [
                    {
                        name: "CS300",
                        description: "Advanced Computer Science.",
                        schedule: "Monday 12:00 PM - 1:30 PM, Wednesday 2:00 PM - 3:30 PM",
                        classroom: "f029",
                        textbook: "Advanced Programming in the UNIX Environment by Stevens",
                        prerequisites: "CS200"
                    }
                ]
            },
            "f020": {
                instructorName: "Dr. Jawad Alkhateeb",
                instructorEmail: "jalkhateeb@pmu.edu.sa",
                phoneNumber: "+966 13 861 5372",
                officeHours: "Tuesday 11:30 AM - 1:00 PM, Thursday 3:00 PM - 4:30 PM",
                courses: [
                    {
                        name: "CS300",
                        description: "Advanced Computer Science.",
                        schedule: "Tuesday 9:00 AM - 10:30 AM, Thursday 12:00 PM - 1:30 PM",
                        classroom: "f032",
                        textbook: "Advanced Programming in the UNIX Environment by Stevens",
                        prerequisites: "CS200"
                    }
                ]
            },
            "f009": {
                instructorName: "Dr. Taha Houda",
                instructorEmail: "thouda@pmu.edu.sa",
                phoneNumber: "+966 13 878 2461",
                officeHours: "Sunday 1:00 PM - 2:30 PM, Tuesday 2:00 PM - 3:30 PM",
                courses: [
                    {
                        name: "CS100",
                        description: "Introduction to Computer Science.",
                        schedule: "Monday 8:00 AM - 9:30 AM, Wednesday 8:00 AM - 9:30 AM",
                        classroom: "f164",
                        textbook: "Computer Science: An Overview by Brookshear",
                        prerequisites: "None"
                    }
                ]
            },
            "f026": {
                instructorName: "Dr. Muhamed Mudawar",
                instructorEmail: "mmudawar@pmu.edu.sa",
                phoneNumber: "+966 13 852 3678",
                officeHours: "Monday 9:30 AM - 11:00 AM, Wednesday 2:00 PM - 3:30 PM",
                courses: [
                    {
                        name: "CS301",
                        description: "Special Topics in Computer Science.",
                        schedule: "Monday 11:00 AM - 12:30 PM, Wednesday 10:00 AM - 11:30 AM",
                        classroom: "f163",
                        textbook: "Selected Readings",
                        prerequisites: "CS300"
                    }
                ]
            },
            "f016": {
                instructorName: "Dr. Jawad Ahmad",
                instructorEmail: "jahmad@pmu.edu.sa",
                phoneNumber: "+966 13 859 4186",
                officeHours: "Tuesday 10:00 AM - 11:30 AM, Thursday 12:30 PM - 2:00 PM",
                courses: [
                    {
                        name: "CS300",
                        description: "Advanced Computer Science.",
                        schedule: "Monday 12:00 PM - 1:30 PM, Wednesday 12:00 PM - 1:30 PM",
                        classroom: "f162",
                        textbook: "Advanced Programming in the UNIX Environment by Stevens",
                        prerequisites: "CS200"
                    }
                ]
            },
            "f017": {
                instructorName: "Dr. Ehsan Rehman",
                instructorEmail: "erehman@pmu.edu.sa",
                phoneNumber: "+966 13 867 3851",
                officeHours: "Sunday 10:30 AM - 12:00 PM, Wednesday 11:00 AM - 12:30 PM",
                courses: []
            },
            "f011": {
                instructorName: "Dr. Khaled Fawagregh",
                instructorEmail: "kfawagregh@pmu.edu.sa",
                phoneNumber: "+966 13 862 3754",
                officeHours: "Monday 12:00 PM - 1:30 PM, Thursday 10:00 AM - 11:30 AM",
                courses: [
                    {
                        name: "CS200",
                        description: "Intermediate Computer Science.",
                        schedule: "Tuesday 10:00 AM - 11:30 AM, Thursday 12:00 PM - 1:30 PM",
                        classroom: "f161",
                        textbook: "Data Structures and Algorithms by Goodrich",
                        prerequisites: "CS100"
                    }
                ]
            },
            "f012": {
                instructorName: "Dr. Ghazanfar Latif",
                instructorEmail: "glatif@pmu.edu.sa",
                phoneNumber: "+966 13 841 5273",
                officeHours: "Tuesday 9:30 AM - 11:00 AM, Thursday 3:30 PM - 5:00 PM",
                courses: [
                    {
                        name: "MATH101",
                        description: "Calculus I.",
                        schedule: "Monday 2:00 PM - 3:30 PM, Wednesday 2:00 PM - 3:30 PM",
                        classroom: "f160",
                        textbook: "Calculus: Early Transcendentals by Stewart",
                        prerequisites: "None"
                    }
                ]
            },
            "f023": {
                instructorName: "Dr. Sagheer Abbas",
                instructorEmail: "sabbas@pmu.edu.sa",
                phoneNumber: "+966 13 865 1729",
                officeHours: "Monday 3:00 PM - 4:30 PM, Wednesday 8:30 AM - 10:00 AM",
                courses: [
                    {
                        name: "MATH101",
                        description: "Calculus I.",
                        schedule: "Tuesday 2:00 PM - 3:30 PM, Thursday 2:00 PM - 3:30 PM",
                        classroom: "f159",
                        textbook: "Calculus: Early Transcendentals by Stewart",
                        prerequisites: "None"
                    }
                ]
            },
            "f031": {
                instructorName: "Dr. Muhammad Attique Khan",
                instructorEmail: "mkhan3@pmu.edu.sa",
                phoneNumber: "+966 13 843 2984",
                officeHours: "Sunday 11:00 AM - 12:30 PM, Tuesday 12:00 PM - 1:30 PM",
                courses: [
                    {
                        name: "CS300",
                        description: "Advanced Computer Science.",
                        schedule: "Monday 4:00 PM - 5:30 PM, Wednesday 4:00 PM - 5:30 PM",
                        classroom: "f158",
                        textbook: "Advanced Programming in the UNIX Environment by Stevens",
                        prerequisites: "CS200"
                    }
                ]
            },
            "f025": {
                instructorName: "Dr. Farhan Ullah",
                instructorEmail: "fullah@pmu.edu.sa",
                phoneNumber: "+966 13 868 4517",
                officeHours: "Tuesday 10:00 AM - 11:30 AM, Thursday 1:30 PM - 3:00 PM",
                courses: [
                    {
                        name: "CS200",
                        description: "Intermediate Computer Science.",
                        schedule: "Monday 2:00 PM - 3:30 PM, Wednesday 2:00 PM - 3:30 PM",
                        classroom: "f064",
                        textbook: "Data Structures and Algorithms by Goodrich",
                        prerequisites: "CS100"
                    }
                ]
            },
            "f018": {
                instructorName: "Mr. Zafar Kazimi",
                instructorEmail: "zkazimi@pmu.edu.sa",
                phoneNumber: "+966 13 866 4219",
                officeHours: "Sunday 2:30 PM - 4:00 PM, Wednesday 1:00 PM - 2:30 PM",
                courses: [
                    {
                        name: "CS200",
                        description: "Intermediate Computer Science.",
                        schedule: "Tuesday 4:00 PM - 5:30 PM, Thursday 4:00 PM - 5:30 PM",
                        classroom: "f063",
                        textbook: "Data Structures and Algorithms by Goodrich",
                        prerequisites: "CS100"
                    }
                ]
            },
            "f021": {
                instructorName: "Mr. Mohammad Zikria",
                instructorEmail: "mzikria@pmu.edu.sa",
                phoneNumber: "+966 13 875 6293",
                officeHours: "Monday 10:00 AM - 11:30 AM, Thursday 2:00 PM - 3:30 PM",
                courses: [
                    {
                        name: "CS200",
                        description: "Intermediate Computer Science.",
                        schedule: "Monday 12:00 PM - 1:30 PM, Wednesday 10:00 AM - 11:30 AM",
                        classroom: "f062",
                        textbook: "Data Structures and Algorithms by Goodrich",
                        prerequisites: "CS100"
                    }
                ]
            },
            "f022": {
                instructorName: "Mr. Awadalla Salaheldin Awadalla",
                instructorEmail: "asalih@pmu.edu.sa",
                phoneNumber: "+966 13 847 5738",
                officeHours: "Tuesday 3:00 PM - 4:30 PM, Thursday 9:30 AM - 11:00 AM",
                courses: [
                    {
                        name: "CS200",
                        description: "Intermediate Computer Science.",
                        schedule: "Tuesday 12:00 PM - 1:30 PM, Thursday 2:00 PM - 3:30 PM",
                        classroom: "f061",
                        textbook: "Data Structures and Algorithms by Goodrich",
                        prerequisites: "CS100"
                    }
                ]
            },
            "f006": {
                instructorName: "Mr. Christopher Sulit",
                instructorEmail: "csulit@pmu.edu.sa",
                phoneNumber: "+966 13 844 2357",
                officeHours: "Sunday 8:30 AM - 10:00 AM, Tuesday 2:30 PM - 4:00 PM",
                courses: [
                    {
                        name: "PHYS101",
                        description: "Physics I: Mechanics.",
                        schedule: "Monday 4:00 PM - 5:30 PM, Wednesday 4:00 PM - 5:30 PM",
                        classroom: "f060",
                        textbook: "University Physics by Young and Freedman",
                        prerequisites: "None"
                    }
                ]
            }
        };

        

        // Shows a temporary message banner/ribbon for a few seconds, or
        // a permanent error message on top of the canvas if type=='error'.
        // If type=='warning', a yellow highlight color is used.
        function unityShowBanner(msg, type) {
            function updateBannerVisibility() {
                warningBanner.style.display = warningBanner.children.length ? 'block' : 'none';
            }
            var div = document.createElement('div');
            div.innerHTML = msg;
            warningBanner.appendChild(div);
            if (type == 'error') div.style = 'background: red; padding: 10px;';
            else {
                if (type == 'warning') div.style = 'background: yellow; padding: 10px;';
                setTimeout(function () {
                    warningBanner.removeChild(div);
                    updateBannerVisibility();
                }, 5000);
            }
            updateBannerVisibility();
        }

        // Initialize Unity WebGL
        function initUnity() {
            console.log("Initializing Unity WebGL...");
            
            // Initialize element references
            container = document.querySelector("#unity-container");
            canvas = document.querySelector("#unity-canvas");
            loadingBar = document.querySelector("#unity-loading-bar");
            progressBarFull = document.querySelector("#unity-progress-bar-full");
            fullscreenButton = document.querySelector("#unity-fullscreen-button");
            warningBanner = document.querySelector("#unity-warning");
            roomInputControl = document.getElementById('<%= roomInput.ClientID %>');
            
            if (!container || !canvas) {
                console.error("Unity container or canvas not found!");
                return;
            }
            
            var buildUrl = "Unity/Build";
            var loaderUrl = buildUrl + "/9th_feb_2.loader.js";
            var config = {
                dataUrl: buildUrl + "/9th_feb_2.data",
                frameworkUrl: buildUrl + "/9th_feb_2.framework.js",
                codeUrl: buildUrl + "/9th_feb_2.wasm",
                streamingAssetsUrl: "Unity/StreamingAssets",
                companyName: "DefaultCompany",
                productName: "Nav3",
                productVersion: "0.1",
                showBanner: unityShowBanner,
            };

            if (/iPhone|iPad|iPod|Android/i.test(navigator.userAgent)) {
                // Mobile device style: fill the whole browser client area with the game canvas:
                var meta = document.createElement('meta');
                meta.name = 'viewport';
                meta.content = 'width=device-width, height=device-height, initial-scale=1.0, user-scalable=no, shrink-to-fit=yes';
                document.getElementsByTagName('head')[0].appendChild(meta);
                container.className = "unity-mobile";
                canvas.className = "unity-mobile";
            } else {
                // Desktop style: Render the game canvas in a window that can be maximized to fullscreen:
                canvas.style.width = "100%";
                canvas.style.height = "600px";
            }

            loadingBar.style.display = "block";

            var script = document.createElement("script");
            script.src = loaderUrl;
            script.onload = () => {
                console.log("Unity loader script loaded successfully");
                createUnityInstance(canvas, config, (progress) => {
                    progressBarFull.style.width = 100 * progress + "%";
                }).then((unityInstance) => {
                    console.log("Unity instance created successfully");
                    window.unityInstance = unityInstance;
                    loadingBar.style.display = "none";
                    fullscreenButton.onclick = () => {
                        unityInstance.SetFullscreen(1);
                    };
                }).catch((message) => {
                    console.error("Unity WebGL error:", message);
                    alert("Unity WebGL error: " + message);
                });
            };
            script.onerror = (e) => {
                console.error("Failed to load Unity WebGL loader script:", e);
                alert("Failed to load Unity WebGL loader script. Check that the path is correct.");
            };

            document.body.appendChild(script);
        }

        // Call initUnity when the document is fully loaded
        document.addEventListener("DOMContentLoaded", function() {
            console.log("DOM loaded, initializing Unity...");
            // Wait a short time to ensure DOM is fully loaded
            setTimeout(initUnity, 1000);
        });

        // Send data from the input field to Unity
        function sendInputToUnity() {
            if (!roomInputControl) {
                roomInputControl = document.getElementById('<%= roomInput.ClientID %>');
                if (!roomInputControl) {
                    console.error("Room input control not found");
                    alert("Error: Room input control not found");
                    return;
                }
            }
            
            var roomName = roomInputControl.value;

            const validRooms = [
                "f001", "f002", "f003", "f004", "f005", "f034", "f006", "f007", "f008",
                "f009", "f010", "f011", "f012", "f013", "f014", "f015", "f016", "f017",
                "f018", "f019", "f020", "f021", "f022", "f023", "f024", "f025", "f027",
                "f026", "f028", "f030", "f029", "f031", "f032", "f164", "f163", "f162",
                "f161", "f160", "f159", "f158", "f064", "f063", "f062", "f061", "f060",
                "f059", "f058", "f057", "f056", "f055", "f054", "f053", "f052", "f051",
                "g022", "g019", "g018", "g017", "g016", "g015", "g014"
            ];

            if (!window.unityInstance) {
                console.error("Unity instance not found. Wait for Unity to load.");
                alert("Unity is still loading. Please wait a moment and try again.");
                return;
            }

            if (!roomName) {
                console.error("Empty input. Please enter a classroom.");
                alert("Please enter a classroom number.");
                return;
            }

            console.log("Sending classroom:", roomName);
            window.unityInstance.SendMessage("Agent", "SetTargetRoom", roomName);

            // Call displayInfo to show room information if available
            displayInfo();
        }

        function displayInfo() {
            var roomName = roomInputControl.value.toLowerCase();
            var roomInfoDiv = document.getElementById("roomInfo");
            
            // Hide any existing course popup
            closeCoursePopup();
            
            // Check if the entered room exists in our data
            if (roomData[roomName]) {
                // Update the room information
                document.getElementById("instructorName").innerHTML = "Instructor Name: " + roomData[roomName].instructorName;
                document.getElementById("instructorEmail").innerHTML = "Instructor Email: " + roomData[roomName].instructorEmail;
                document.getElementById("phoneNumber").innerHTML = "Phone Number: " + roomData[roomName].phoneNumber;
                document.getElementById("officeHours").innerHTML = "Office Hours: " + roomData[roomName].officeHours;
                
                // Create clickable course links
                let coursesHtml = "Courses Taught: ";
                roomData[roomName].courses.forEach((course, index) => {
                    coursesHtml += `<a href="#" onclick="showCourseDetails('${roomName}', ${index}); return false;">${course.name}</a>`;
                    if (index < roomData[roomName].courses.length - 1) {
                        coursesHtml += ", ";
                    }
                });
                
                document.getElementById("coursesTaught").innerHTML = coursesHtml;
                
                // Make the room info div visible
                roomInfoDiv.style.visibility = "visible";
            } else {
                // Hide the room info div if the room is not in our database
                roomInfoDiv.style.visibility = "hidden";
            }
        }
        
        // Function to show course details in a popup
        function showCourseDetails(roomName, courseIndex) {
            const course = roomData[roomName].courses[courseIndex];
            
            // Get the course popup
            const coursePopup = document.getElementById("coursePopup");
            
            // Populate the popup with course details
            coursePopup.innerHTML = `
                <div class="popup-header">
                    <h2>${course.name}</h2>
                    <span class="close-btn" onclick="closeCoursePopup()">&times;</span>
                </div>
                <div class="popup-content">
                    <p><strong>Description:</strong> ${course.description}</p>
                    <p><strong>Schedule:</strong> ${course.schedule}</p>
                    <p><strong>Classroom:</strong> ${course.classroom}</p>
                    <p><strong>Textbook:</strong> ${course.textbook}</p>
                    <p><strong>Prerequisites:</strong> ${course.prerequisites}</p>
                    <p><strong>Instructor:</strong> ${roomData[roomName].instructorName}</p>
                </div>
            `;
            
            // Show the popup
            coursePopup.style.display = "block";
        }
        
        // Function to close the course popup
        function closeCoursePopup() {
            const coursePopup = document.getElementById("coursePopup");
            if (coursePopup) {
                coursePopup.style.display = "none";
            }
        }
    </script>
</asp:Content>
