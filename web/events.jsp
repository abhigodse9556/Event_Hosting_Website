<%@page import="ServersidePackages.PromosObject"%>
<%@page import="ServersidePackages.EduObject"%>
<%@page import="ServersidePackages.BusinessObject"%>
<%@page import="ServersidePackages.CulturalObject"%>
<%@page import="ServersidePackages.TrekkObject"%>
<%@page import="ServersidePackages.MusicObject"%>
<%@page import="ServersidePackages.SportObject"%>
<%@page import="java.util.Base64"%>
<%@page import="ServersidePackages.DataObject"%>
<%@page import="ServersidePackages.DataObject"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.cj.jdbc.Blob"%>
<%@page import="java.io.*, java.sql.*" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
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

      <title>Event Management Website</title>
      <style>
           body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right bottom, #ffffff, #02effe);
            color: #fff;
            display: block;
        }
        
        .event__container{
            margin: 100px 20px 0px;
            height: 780px;
            padding: 20px;
            overflow-y: auto;
            scrollbar-width: none;
        }
        
        .event-selector{
            text-align: end;
            margin: 10px 60px 10px 20px;
            font-weight: bold;
            font-size: x-large;
        }
        
        .event-selector select{
            font-size: medium;
        }
        
        .event-selector select:hover{
            color: #f09819;
        }
        
          .all_events{
              display: grid;
              gap: 24px;
              grid-template-columns: repeat(5, 1fr);
              
              h2{
                  position: fixed;
              }
          } 
          
          .sport_events,
          .dj_events,
          .business_events,
          .cultural_events,
          .edu_events,
          .promo_events,
          .trekk_events{
              display: none;
              gap: 24px;
              grid-template-columns: repeat(5, 1fr);
              
              h2{
                  position: fixed;
              }
          }
          
          .events-box{
              padding: 20px;
              background: linear-gradient(to right bottom, #3231a4, #319da4c9);
              border-radius: 10px;
              text-align: center;
              color: #b4fff1;
              
              .show_btn{
                display: none;
              }
          }
          .events-box:hover{
              background: linear-gradient(to right bottom, hsl(258.09deg 76.62% 70.36%), #dcacacba);
              
              .show_btn{
                display: flex;
                border-style: hidden;
                font-size: 18px;
                margin: auto;
              }
          }
          
          
          
          
          .poster-image{
              width: 200px;
              height: 300px;
              margin: auto;
          }
         
          button{
              cursor: pointer;
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
                    <a href="participantdashboard.jsp" class="nav__button-ghost"><%= loggedInUsername %></a>
                    <a href="index.jsp" class="nav__button-link">Logout</a>
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
            <div class="event__container">
                
                <div class="event-selector">
                    <p>Event Categories</p>
          <select id="event_type" name="event_type" onchange="showSelectedCategory()">
            <option value=""></option>
            <option value="All Events" selected>All Events</option>
            <option value="Sports">Sports</option>
            <option value="Trekking / Adventures">Trekking / Adventures</option>
            <option value="Cultural">Cultural</option>
            <option value="Musical / DJ">Musical / DJ</option>
            <option value="Business">Business</option>
            <option value="Educational">Educational</option>
            <option value="Promos / Expos">Promos / Expos</option>
          </select>
                </div>
                              
<div id="all_events" class="all_events">
    
    <% 
    List<DataObject> dataList = (List<DataObject>) request.getAttribute("dataList");
    for (DataObject data : dataList) {
    %>
    <div class="events-box">
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="ParticipantServlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <input type="hidden" name="loggedParticipant" value="<%= loggedInUsername%>">
    <button type="submit" class="show_btn">Show Details</button>
</form>
    </div>
    <% 
    }
    %>
</div>

<div id="sport_events" class="sport_events">
    
    <% 
    List<SportObject> sportList = (List<SportObject>) request.getAttribute("sportList");
    for (SportObject data : sportList) {
    %>
    <div class="events-box">
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="ParticipantServlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <input type="hidden" name="loggedParticipant" value="<%= loggedInUsername%>">
    <button type="submit" class="show_btn">Show Details</button>
</form>
    </div>
    <% 
    }
    %>
</div>

<div id="dj_events" class="dj_events">
    
    <% 
    List<MusicObject> musicList = (List<MusicObject>) request.getAttribute("musicList");
    for (MusicObject data : musicList) {
    %>
    <div class="events-box">
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="ParticipantServlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <input type="hidden" name="loggedParticipant" value="<%= loggedInUsername%>">
    <button type="submit" class="show_btn">Show Details</button>
</form>
    </div>
    <% 
    }
    %>
</div>


<div id="trekk_events" class="trekk_events">
    
    <% 
    List<TrekkObject> trekkList = (List<TrekkObject>) request.getAttribute("trekkList");
    for (TrekkObject data : trekkList) {
    %>
    <div class="events-box">
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="ParticipantServlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <input type="hidden" name="loggedParticipant" value="<%= loggedInUsername%>">
    <button type="submit" class="show_btn">Show Details</button>
</form>
    </div>
    <% 
    }
    %>
</div>

<div id="cultural_events" class="cultural_events">
    
    <% 
    List<CulturalObject> culturalList = (List<CulturalObject>) request.getAttribute("culturalList");
    for (CulturalObject data : culturalList) {
    %>
    <div class="events-box">
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="ParticipantServlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <input type="hidden" name="loggedParticipant" value="<%= loggedInUsername%>">
    <button type="submit" class="show_btn">Show Details</button>
</form>
    </div>
    <% 
    }
    %>
</div>

<div id="business_events" class="business_events">
    
    <% 
    List<BusinessObject> businessList = (List<BusinessObject>) request.getAttribute("businessList");
    for (BusinessObject data : businessList) {
    %>
    <div class="events-box">
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
       <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="ParticipantServlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <input type="hidden" name="loggedParticipant" value="<%= loggedInUsername%>">
    <button type="submit" class="show_btn">Show Details</button>
</form>
    </div>
    <% 
    }
    %>
</div>

<div id="edu_events" class="edu_events">
    
    <% 
    List<EduObject> eduList = (List<EduObject>) request.getAttribute("eduList");
    for (EduObject data : eduList) {
    %>
    <div class="events-box">
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="ParticipantServlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <input type="hidden" name="loggedParticipant" value="<%= loggedInUsername%>">
    <button type="submit" class="show_btn">Show Details</button>
</form>
    </div>
    <% 
    }
    %>
</div>

<div id="promo_events" class="promo_events">
    
    <% 
    List<PromosObject> promoList = (List<PromosObject>) request.getAttribute("promoList");
    for (PromosObject data : promoList) {
    %>
    <div class="events-box">
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="ParticipantServlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <input type="hidden" name="loggedParticipant" value="<%= loggedInUsername%>">
    <button type="submit" class="show_btn">Show Details</button>
</form>
    </div>
    <% 
    }
    %>
</div>
    
            </div>
         </section>
      </main>
      
     
   </body>
   

   <script>
       function showSelectedCategory() {
            var selectedCategory = document.getElementById("event_type").value;
            var all_events = document.getElementById("all_events");
            var sport_events = document.getElementById("sport_events");
            var dj_events = document.getElementById("dj_events");
            var trekk_events = document.getElementById("trekk_events");
            var cultural_events = document.getElementById("cultural_events");
            var business_events = document.getElementById("business_events");
            var edu_events = document.getElementById("edu_events");
            var promo_events = document.getElementById("promo_events");
            

            // Show the selected event category
            if (selectedCategory === "All Events") {
                all_events.style.display = "grid";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            } else if (selectedCategory === "Sports") {
                all_events.style.display = "none";
                sport_events.style.display = "grid";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Musical / DJ") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "grid";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Business") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "grid";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Trekking / Adventures") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "grid";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Cultural") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "grid";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Educational") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "grid";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Promos / Expos") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "grid";
            }
            // Show other event category elements based on selected option
        }
   </script>
<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="script.js"></script>
   
</html>
