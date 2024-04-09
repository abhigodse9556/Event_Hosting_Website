<%@page import="java.util.Base64"%>
<%@page import="ServersidePackages.DataObject"%>
<%@page import="ServersidePackages.DataObject"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.cj.jdbc.Blob"%>
<%@ page import="java.io.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String loggedInUsername = request.getParameter("loggedInUsername"); %>
<% String eventID = request.getParameter("event-id"); %>
<!DOCTYPE html>
<html>
     <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">

      <!--=============== FAVICON ===============-->
      <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

      <!--=============== REMIXICONS ===============-->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.4.0/remixicon.css" crossorigin="">
      
      <!--=============== CSS ===============-->
      <link rel="stylesheet" href="assets/css/styles.css">
      <link rel="stylesheet" href="assets/css/organizerpage.css">

      <title>Event Organizer Dashboard</title>
      <style>
        
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right bottom, #1d4350, #a43931);
            color: #fff;
            display: block;
        }

        .view_container {
            width: 100%;
            height: 100%;
            margin: 80px auto auto auto;
            padding: 50px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
        }

        .text-section {
            background-color: rgba(0, 0, 0, 0.8);
            color: #fff;
            height: 700px;
            border-radius: 20px;
            padding: 50px;
            overflow-y: scroll;
            scrollbar-width: none;
        }
        
        .view-button{
                background-color: #a82877;
                color: #fff;
                padding-top: 5px;
                border-radius: 5px;
                padding-bottom: 9px;
                padding-left: 15px;
                padding-right: 15px;
                margin-left: 5px;
            }
            .view-button:hover{
                background-color: black;
            }

            .btn-block button {
            background-color: #a82877;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 15px;
            font-weight: bold;
            width: 170px;
            margin-bottom: 10px;
        }
        .btn-block button:hover {
            background-color: black;
        }
        .image-section {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 700px;
            border-radius: 20px;

        }
        
        .postevent{
                margin-top: 20px;
                box-shadow: 0 0 0px 0 #ffffff;
            }
h1 {
    font-size: 2.5rem;
    margin-bottom: 10px;
    color: #333; /* Dark color for headings */
}

h4 {
    font-size: 1.2rem;
    margin-bottom: 5px;
    color: #555; /* Slightly darker color for subheadings */
}

h3 {
    font-size: 1.3rem;
    margin-bottom: 5px;
    color: #666; /* Another shade for headings */
}

p {
    font-size: 1.1rem;
    margin-bottom: 10px;
    color: #777; /* Lighter color for paragraphs */
    text-align: justify;
}

b {
    font-weight: bold;
    color: #222; /* Darker color for emphasis */
}

h5 {
    font-size: 1rem;
    margin-top: 10px;
    margin-bottom: 5px;
    color: #888; /* Light color for secondary information */
}

/* Advanced Styling */
h1, h3, h4, h5, p {
    transition: all 0.3s ease-in-out; /* Smooth transition for hover effects */
}

h1:hover, h3:hover, h4:hover, h5:hover, p:hover {
    color: #a82877; /* Change color on hover */
}

/* Gradient Background for Headers */
h1, h3, h4, h5 {
    background: linear-gradient(45deg, #ff7e5f, #feb47b); /* Gradient background */
    -webkit-background-clip: text; /* Clip text to the background */
    -webkit-text-fill-color: transparent; /* Transparent text to show the gradient */
}

/* Box Shadow for Text Content */
h1, h3, h4, h5, p {
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Soft shadow */
    padding: 10px; /* Add padding to give depth */
    border-radius: 8px; /* Rounded corners */
}

/* Special Attraction Highlight */
h4:nth-of-type(3) {
    color: #a82877; /* Highlight color for special attraction */
}

        .image-section img {
            max-width: 100%;
            max-height: 100%;
        }

        @media (max-width: 768px) {
            /* For smaller screens, switch to a single column layout */
            .container {
                grid-template-columns: 1fr;
                height: auto;
            }

            .text-section, .image-section {
                width: 100%;
            }
        }
    </style>
   </head>
   
   <!--==================== HEADER ====================-->
      <header class="header" id="header">
        <nav class="nav container">
            <a href="#" class="nav__logo">
                <img src="assets/img/logo.svg" alt="logo">
            </a>

            <div class="nav__menu" id="nav-menu">
                <ul class="nav__list">
                    <li class="nav__item">
                        <a href="index.jsp" class="nav__link">Home</a>
                    </li>

                    <li class="nav__item">
                        <a href="#" class="nav__link">Events</a>
                    </li>

                    <li class="nav__item">
                        <a href="about.jsp" class="nav__link">About</a>
                    </li>

                    <li class="nav__item">
                        <a href="contact.jsp" class="nav__link">Contact</a>
                    </li>
                </ul>
                <div class="nav__buttons">
                    <a href="#" class="nav__button-link" onclick="openEditEvent()">Update Profile</a>
                    <form class="postevent" action="#postevent.jsp" method="post">
    <input type="hidden" name="loggedinuser" value="<%= loggedInUsername %>">
    <button type="submit" class="nav__link">Register for Event</button>
</form>
                </div>

                <!--close button-->
                <div class="nav__close" id="nav-close">
                    <i class="ri-close-line"></i>
                </div>
            </div>

            <!--toggle button-->
            <div class="nav__toggle" id="nav-toggle">
                <i class="ri-menu-line"></i>
            </div>
        </nav>
         
      </header>
    
   <div class="view_container">
       <%
        // Display event details if available in request attributes
        String e_name = (String) request.getAttribute("e_name");
        String e_type = (String) request.getAttribute("e_type");
        String e_date = (String) request.getAttribute("e_date");
        String e_time = (String) request.getAttribute("e_time");
        String e_duration = (String) request.getAttribute("e_duration");
        String e_specialattraction = (String) request.getAttribute("e_specialattraction");
        String e_description = (String) request.getAttribute("e_description");
        String e_promoter = (String) request.getAttribute("e_promoter");
        String e_venue = (String) request.getAttribute("e_venue");
        String e_addline1 = (String) request.getAttribute("e_addline1");
        String e_addline2 = (String) request.getAttribute("e_addline2");
        String e_city = (String) request.getAttribute("e_city");
        String e_state = (String) request.getAttribute("e_state");
        String e_post = (String) request.getAttribute("e_post");
        String e_country = (String) request.getAttribute("e_country");
        int e_tickets = (int) request.getAttribute("e_tickets");
        String e_contactpersonfirst = (String) request.getAttribute("e_contactpersonfirst");
        String e_conatactpersonlast = (String) request.getAttribute("e_conatactpersonlast");
        String e_contactemail = (String) request.getAttribute("e_contactemail");
        String e_contactnumber = (String) request.getAttribute("e_contactnumber");
        String e_isrecord = (String) request.getAttribute("e_isrecord");
        String e_organizer = (String) request.getAttribute("e_organizer");

        if (e_name != null && e_date != null) {
    %>
   
        <div id="text-section" class="text-section">
            
         
            <h2><%= e_name %></h2>
    
            <h4>Category: <%= e_type %></h4>
            <h3>Date & Time: <%= e_date %> at <%= e_time %></h3>
            <h3>Duration: <%= e_duration %></h3>
            <h4>Special Attraction: <%= e_specialattraction %></h4>
            <p><b>Description:</b> <%= e_description %></p>
            <h4>Organizer's Name: <%= e_promoter %></h4>
            <h4>Venue Name: <%= e_venue %></h4>
            <p><b>Venue address:</b> <%= e_addline1 %>, <%= e_addline2 %>, <%= e_city %>, <%= e_state %>, <%= e_country %>, <%= e_post %></p>
            <h4>Entry fees: <%= e_tickets %></h4>
            <h4>Contact Person: <%= e_contactpersonfirst %> <%= e_conatactpersonlast %></h4>
            <h4>Email ID: <%= e_contactemail %></h4>
            <h4>Mobile Number: <%= e_contactnumber %></h4>
            <h5>Will event be recorded?: <%= e_isrecord %></h5>
            <p style="display: none">Organizer: <%= e_organizer %></p>
            <a href="#" class="view-button" onclick="openEditEvent()">Register for the event</a>
    </div>
        
            
        <div id="image-section" class="image-section">
                            <% Blob e_poster = (Blob) request.getAttribute("e_poster");
       if (e_poster != null) {
           byte[] imageBytes = e_poster.getBytes(1, (int) e_poster.length());
           String base64Image = javax.xml.bind.DatatypeConverter.printBase64Binary(imageBytes);
    %>
           <img src="data:image/jpeg;base64, <%=base64Image%> " alt="Event Poster" class="poster-image">   
    <% } %>
    
    
    
          <%
        }
    %>     
            
    </div>

   
</body>

<script>
    function openEditEvent(){
        document.getElementById("edit-section").style.display = "flex";
        document.getElementById("text-section").style.display = "none";
    }
    function cancelEditEvent(){
        document.getElementById("edit-section").style.display = "none";
        document.getElementById("text-section").style.display = "block";
    }
    function openEditPoster(){
        document.getElementById("image-edit").style.display = "flex";
        document.getElementById("image-section").style.display = "none";
    }
    function cancelEditPoster(){
        document.getElementById("image-edit").style.display = "none";
        document.getElementById("image-section").style.display = "block";
    }
    function showConfirmation(eventID) {
        var confirmed = confirm("Are you sure you want to delete event?");
        if (confirmed) {
            document.getElementById("deleteButton_" + eventID).click();
        }
    }
    function viewEvent(eventID){
        document.getElementById("viewButton_" + eventID).click();
    }
</script>
   
<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="assets/js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</html>