<%@page import="ServersidePackages.SportObject"%>
<%@page import="java.util.Base64"%>
<%@page import="ServersidePackages.DataObject"%>
<%@page import="ServersidePackages.DataObject"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.cj.jdbc.Blob"%>
<%@ page import="java.io.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

      <title>Event Management Website</title>
      <style>
          
          .poster-image{
              width: 200px;
              height: 300px;
          }
          
          .all_events{
              display: block;
              flex-wrap: wrap;
              justify-content: space-between;
              
              h2{
                  position: fixed;
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
                        <a href="events.jsp" class="nav__link">Events</a>
                    </li>

                    <li class="nav__item">
                        <a href="about.jsp" class="nav__link">About</a>
                    </li>

                    <li class="nav__item">
                        <a href="contact.jsp" class="nav__link">Contact</a>
                    </li>
                </ul>
                <div class="nav__buttons">
                    <a href="login.jsp" class="nav__button-ghost">I am a Participant</a>
                    <a href="register.jsp" class="nav__button-ghost">I am an Organizer</a>
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
   
    <body>
      <!--==================== MAIN ====================-->
      <main class="main">
         <!--==================== HOME ====================-->
         <section class="home">
            <div class="event__container container" style="margin-top: 100px">
                
<div class="all_events">
    
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
            <p>Name: <%= e_name %></p>
            <p>Category: <%= e_type %></p>
            <p>Date: <%= e_date %></p>
            <p>Time: <%= e_time %></p>
            <p>Duration: <%= e_duration %></p>
            <p>Special Attraction: <%= e_specialattraction %></p>
            <p>Description: <%= e_description %></p>
            <p>Promoter: <%= e_promoter %></p>
            <p>Venue: <%= e_venue %></p>
            <p>Address line 1: <%= e_addline1 %></p>
            <p>Address line 2: <%= e_addline2 %></p>
            <p>City: <%= e_city %></p>
            <p>State: <%= e_state %></p>
            <p>Postal Code: <%= e_post %></p>
            <p>Country: <%= e_country %></p>
            <p>Available Tickets: <%= e_tickets %></p>
            <p>Contact Person First Name: <%= e_contactpersonfirst %></p>
            <p>Contact Person Last Name: <%= e_conatactpersonlast %></p>
            <p>Email ID: <%= e_contactemail %></p>
            <p>Mobile Number: <%= e_contactnumber %></p>
            <p>Will event be recorded?: <%= e_isrecord %></p>
            <p>Organizer: <%= e_organizer %></p>
            <% Blob e_poster = (Blob) request.getAttribute("e_poster");
       if (e_poster != null) {
           byte[] imageBytes = e_poster.getBytes(1, (int) e_poster.length());
           String base64Image = javax.xml.bind.DatatypeConverter.printBase64Binary(imageBytes);
    %>
           <img src="data:image/jpeg;base64, <%=base64Image%> " alt="Event Poster">
    <% } %>
    <%
        }
    %>
</div>

                
                <div class="home__images">
                    <img src="assets/img/img-44.png" alt="image" class="home__img-4"  style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-3.png" alt="image" class="home__img-3"  style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-2.png" alt="image" class="home__img-2"  style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-11.png" alt="image" class="home__img-1"  style="z-index: -1; filter: blur(3px); position: fixed;">
                </div>
            </div>
    
    
         </section>
      </main>
      
     
   </body>
   
<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="script.js"></script>
   
</html>
