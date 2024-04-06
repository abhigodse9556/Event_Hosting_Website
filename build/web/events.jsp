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
          th{
              color: red;
              background-color: rgba(0,0,0,0.5);
          }
              
          .name, 
          .date{
              width: 200px;
              text-align: center;
              padding: 20px auto;
          }
          
          td{
              font-size: large;
              font-weight: 900;
              text-align: center;
              padding: 20px;
          }
          
          .poster-image{
              width: 200px;
              height: 300px;
          }
          
          .all_events{
              display: none;
              flex-wrap: wrap;
              justify-content: space-between;
              
              h2{
                  position: fixed;
              }
          }
          
          .slider {
              overflow: hidden;
              white-space: nowrap;
          }
          
          .slider .events-box{
              display: inline-block;
              vertical-align: top;
              width: calc(25% - 20px);
              margin-right: 20px;
              margin-top: 40px;
          }

        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: #333;
            color: white;
            border: none;
            padding: 10px;
            z-index: 1000;
        }

        .prev {
            left: 0;
            margin-left: 100px;
        }

        .next {
            right: 0;
            margin-right: 100px;
        }
        
        .event_slider{
            margin-left: 20px;
            margin-right: 20px;
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
    List<DataObject> dataList = (List<DataObject>) request.getAttribute("dataList");
    for (DataObject data : dataList) {
    %>
    <div class="events-box">
        <h1><%= data.getId() %></h1>
        <% 
        Blob posterBlob1 = data.getPoster();
        if (posterBlob1 != null) {
            try (InputStream inputStream = posterBlob1.getBinaryStream()) {
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
        <%= data.getName() %><br>
        <%= data.getDate() %>
    </div>
    <% 
    }
    %>
</div>
<div class="event_slider">
<h2>All Events</h2>
<div id="all_event_slider" class="slider">
    <!-- Slider content will be dynamically generated here -->
</div>

<button id="prevBtn" class="prev" onclick="moveSlider(-1)">&#10094;</button>
<button id="nextBtn" class="next" onclick="moveSlider(1)">&#10095;</button>

</div>
<div class="all_events">
    
    <% 
    List<SportObject> sportList = (List<SportObject>) request.getAttribute("sportList");
    for (SportObject data : sportList) {
    %>
    <div class="sport-events-box">
        <h1><%= data.getId() %></h1>
        <% 
        Blob posterBlob1 = data.getPoster();
        if (posterBlob1 != null) {
            try (InputStream inputStream = posterBlob1.getBinaryStream()) {
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
        <%= data.getName() %><br>
        <%= data.getDate() %>
    </div>
    <% 
    }
    %>
</div>
<div class="sport_event_slider">
<h2>Sport Events</h2>
<div id="sport_event_slider" class="sportslider">
    <!-- Slider content will be dynamically generated here -->
</div>

<button id="prevBtn1" class="prev1" onclick="moveSlider1(-1)">&#10094;</button>
<button id="nextBtn1" class="next1" onclick="moveSlider1(1)">&#10095;</button>

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
   
   <script>
let slideIndex = 0;
const slider = document.getElementById("all_event_slider");
const prevBtn = document.getElementById("prevBtn");
const nextBtn = document.getElementById("nextBtn");

// Function to move the slider
function moveSlider(n) {
    const eventTables = document.querySelectorAll(".events-box");
    const slidesPerPage = 4;
    const totalSlides = eventTables.length;
    const maxSlides = Math.ceil(totalSlides / slidesPerPage);
    
    slideIndex += n;
    if (slideIndex < 0) {
        slideIndex = maxSlides - 1;
    }
    if (slideIndex >= maxSlides) {
        slideIndex = 0;
    }

    const startIndex = slideIndex * slidesPerPage;
    const endIndex = Math.min(startIndex + slidesPerPage, totalSlides);

    slider.innerHTML = "";
    for (let i = startIndex; i < endIndex; i++) {
        slider.appendChild(eventTables[i].cloneNode(true));
    }
}

let slideIndex1 = 0;
const slider1 = document.getElementById("sport_event_slider");
const prevBtn1 = document.getElementById("prevBtn1");
const nextBtn1 = document.getElementById("nextBtn1");

// Function to move the slider
function moveSlider1(n) {
    const eventTables1 = document.querySelectorAll(".sport-events-box");
    const slidesPerPage1 = 4;
    const totalSlides1 = eventTables1.length;
    const maxSlides1 = Math.ceil(totalSlides1 / slidesPerPage1);
    
    slideIndex1 += n;
    if (slideIndex1 < 0) {
        slideIndex1 = maxSlides1 - 1;
    }
    if (slideIndex1 >= maxSlides1) {
        slideIndex1 = 0;
    }

    const startIndex1 = slideIndex1 * slidesPerPage1;
    const endIndex1 = Math.min(startIndex1 + slidesPerPage1, totalSlides1);

    slider1.innerHTML = "";
    for (let i = startIndex1; i < endIndex1; i++) {
        slider1.appendChild(eventTables1[i].cloneNode(true));
    }
}

// Initial slider setup
window.addEventListener("load", function() {
    moveSlider(0);
    moveSlider1(0);
});

   </script>
   
<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="script.js"></script>
   
</html>
