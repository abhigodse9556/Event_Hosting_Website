<%@page import="java.util.Base64"%>
<%@page import="ServersidePackages.DataObject"%>
<%@page import="ServersidePackages.DataObject"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.cj.jdbc.Blob"%>
<%@ page import="java.io.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String loggedInUsername = (String) request.getAttribute("loggedInUsername"); %>
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

        .poster-image {
            width: 200px; /* Adjust width as needed */
            height: 250px; /* Auto adjust height to maintain aspect ratio */
        }
        .org_container {
            max-width: 1200px;
            margin: 100px auto;
            padding: 20px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        .section {
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }
        h2 {
            margin: 0;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.6);
            text-align: center;
            font-weight: bold;
            font-size: 24px;
        }
        
        .heading{
            height: min-content;
        }
            
            form{
                margin-top: 20px;
                box-shadow: 0 0 0px 0 #ffffff;
            }

        /* Profile Section */
        .profile {
            background-color: rgba(0, 0, 0, 0.8);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 40px;
            height: 730px;
            
            h2{
                background-color: rgba(255, 255, 255, 0.1);
            }
        }
        .profile p {
            margin: 10px 0;
            font-size: 18px;
        }
        .profile button {
            background-color: #a82877;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 16px;
            font-weight: bold;
        }
        .profile button:hover {
            background-color: black;
        }
        
        .edit{
            display: none;
        }
        
            .cancel-button{
                background-color: #a82877;
                color: #fff;
                padding-top: 5px;
                border-radius: 5px;
                padding-bottom: 7px;
                padding-left: 15px;
                padding-right: 15px;
                margin-left: 5px;
            }
            .cancel-button:hover{
                background-color: black;
            }
            .logout-button{
                background-color: #a82877;
                color: #fff;
                padding-top: 5px;
                border-radius: 5px;
                padding-bottom: 7px;
                padding-left: 15px;
                padding-right: 15px;
                margin-left: 5px;
                margin-top: 5px;
            }
            .logout-button:hover{
                background-color: black;
            }
            

        /* Events Section */
        .events {
            background-color: rgba(0, 0, 0, 0.8);
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
            height: 730px;
            overflow-y: scroll;
            scrollbar-width: none;
        }
        .event {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            transition: transform 0.3s;
            cursor: pointer;
            position: relative;
            height: 290px;
            display: flex;
            column-gap: 20px;
        }
        .event:hover {
            transform: translateY(-5px);
        }
        .event h3 {
            margin: 0 0 10px;
            font-size: 20px;
        }
        .event p {
            margin: 5px 0;
            font-size: 16px;
        }
        .event-info {
            color: rgba(255, 255, 255, 0.7);
        }
        .event-details{
            text-align: center;
            padding: 50px;
        }
        .event-actions {
            position: absolute;
            top: 10px;
            right: 10px;
            opacity: 0;
            transition: opacity 0.3s;
            margin-left: 280px;
            margin-top: 140px;
            margin-right: 60px;
        }
        .event:hover .event-actions {
            opacity: 1;
        }
        .event-actions button {
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 14px;
            margin: 5px 5px;
        }
        .event-actions button:hover {
            background-color: rgba(0, 0, 0, 0.7);
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
                    <a href="login.jsp" class="nav__button-link">Update Profile</a>
                    <form action="postevent.jsp" method="post">
    <input type="hidden" name="loggedinuser" value="<%= loggedInUsername %>">
    <button type="submit" class="nav__link">Post an Event</button>
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
    
   <div class="org_container">
        <!-- Profile Section -->
        <div id="profile" class="section profile">
            <h3>Welcome, <%= loggedInUsername %>!</h3><br>
            <%
        // Display organizer details if available in request attributes
        String organizerName = (String) request.getAttribute("organizerName");
        String organizerOrg = (String) request.getAttribute("organizerOrg");
        String organizerEmail = (String) request.getAttribute("organizerEmail");
        String organizerMobile = (String) request.getAttribute("organizerMobile");

        if (organizerName != null && organizerEmail != null) {
    %>
            <h2>Organizer Profile</h2>
            <p><strong>Name:</strong> <%= organizerName%></p>
            <p><strong>Organization:</strong> <%= organizerOrg%></p>
            <p><strong>Email:</strong> <%= organizerEmail%></p>
            <p><strong>Mobile:</strong> <%= organizerMobile%></p>
            <%
        }
    %>
    <button onclick="openEditProfile()">Edit Profile</button>
    <a href="index.jsp" class="logout-button">Logout</a>
        </div>
            
            <div id="edit_profile" class="section profile edit">
                <h2>Edit Profile</h2>
                <form id="profileUpdateform" action="Servlet?id=updateOrgProfile" method="post">
                    <p><strong>Username:</strong> <input type="text" name="org_user" value="<%= loggedInUsername%>" readonly></p>
                    <p><strong>Name:</strong> <input type="text" name="org_name" value="<%= organizerName%>"></p>
                    <p><strong>Organization:</strong> <input type="text" name="org_organization" value="<%= organizerOrg%>"></p>
                    <p><strong>Email:</strong> <input type="text" name="org_email" value="<%= organizerEmail%>"></p>
                    <p><strong>Mobile:</strong> <input type="text" name="org_mobile" value="<%= organizerMobile%>"></p>
                    <button type="submit">Save Changes</button>
                    <a class="cancel-button" href="#" onclick="cancelEditProfile()">Cancel</a>
                </form>
            </div>

        <!-- Events Section -->
        <div class="section events">
            <div class="heading">
                <h2>Event History</h2>
            </div>
            <%
            List<DataObject> dataList = (List<DataObject>) request.getAttribute("dataList");
            for (DataObject data : dataList) {
        %>
            <div class="event">
                <%
                    Blob posterBlob = data.getPoster();
                    if (posterBlob != null) {
                        try (InputStream inputStream = posterBlob.getBinaryStream()) {
                            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                            byte[] buffer = new byte[4096];
                            int bytesRead = -1;
                            while ((bytesRead = inputStream.read(buffer)) != -1) {
                                outputStream.write(buffer, 0, bytesRead);
                            }
                            byte[] imageBytes = outputStream.toByteArray();
                            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                            out.println("<img src=\"data:image/jpeg;base64," + base64Image + "\" class=\"poster-image\">");
                        } catch (SQLException | IOException e) {
                            e.printStackTrace();
                        }
                    }
                %>
                <div class="event-details">
                <h3><%= data.getName() %></h3>
                <p class="event-info"><strong>Date:</strong> <%= data.getDate() %></p>
                
                </div>
                 <form id="deleteEvent_<%= data.getId() %>" action="Servlet?id=deleteEvent" method="post" style="display:none;">
                    <input type="hidden" name="eventID" value="<%= data.getId() %>">
                    <input type="hidden" name="eventOrg" value="<%= loggedInUsername %>">
                    <button id="deleteButton_<%= data.getId() %>" type="submit">Delete</button>
                </form>
                 <form id="viewEvent_<%= data.getId() %>" action="Servlet?id=event_details" method="post" style="display:none;">
                    <input type="hidden" name="loggedInUsername" value="<%= loggedInUsername %>">
                    <input type="hidden" name="event-id" value="<%= data.getId() %>">
                    <input type="hidden" name="viewer" value="organizer">
                    <button id="viewButton_<%= data.getId() %>" type="submit">View</button>
                </form>
                <div class="event-actions">
                    <button onclick="viewEvent(<%= data.getId() %>)">View</button>
                    <button onclick="showConfirmation(<%= data.getId() %>)">Delete</button>
                </div>
            </div>
                <%
            }
        %>
            
        </div>
    </div>

   
</body>

<script>
    function openEditProfile(){
        document.getElementById("edit_profile").style.display = "flex";
        document.getElementById("profile").style.display = "none";
    }
    function cancelEditProfile(){
        document.getElementById("edit_profile").style.display = "none";
        document.getElementById("profile").style.display = "flex";
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