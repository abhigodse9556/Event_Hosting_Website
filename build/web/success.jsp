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
        /* CSS to fix the size of the image */
       
        
        .form-content{
            margin-top: 250px;
            height: 700px;
            overflow-y: scroll;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right bottom, #1d4350, #a43931);
            color: #fff;
            display: block;
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
        
        
            
            form{
                margin-top: 20px;
                box-shadow: 0 0 0px 0 #ffffff;
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
       
       <% 
    String loggedinuser = request.getParameter("loggedinuser");
    // Process 'data' as needed
%>
       
        <!-- Profile Section -->
        <div id="profile" class="section event_form">
         
        </div>
            
   </div>    
</body>

<% Boolean loginSuccess = (Boolean) request.getAttribute("loginSuccess"); %>
<% Boolean eventPostSuccess = (Boolean) request.getAttribute("eventPostSuccess"); %>
<% if (loginSuccess != null) { %>
    <script>
        var message = <%= loginSuccess ? "'Login successful!'" : "'Error in login. Please try again.'" %>;
        alert(message);
    </script>
<% } %>

<% if (eventPostSuccess != null) { %>
    <script>
        var message = <%= eventPostSuccess ? "'Event posted successfully!'" : "'Error in posting. Please try again.'" %>;
        alert(message);
    </script>
<% } %>

<script>
    function openEditProfile(){
        document.getElementById("edit_profile").style.display = "flex";
        document.getElementById("profile").style.display = "none";
    }
    function cancelEditProfile(){
        document.getElementById("edit_profile").style.display = "none";
        document.getElementById("profile").style.display = "flex";
    }
</script>
   
<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="assets/js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</html>