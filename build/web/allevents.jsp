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
          
          .all_events{
              display: flex;
              flex-wrap: wrap;
              justify-content: space-between;
              
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
              flex-wrap: wrap;
              justify-content: space-between;
              
              h2{
                  position: fixed;
              }
          }
          
          .events-box{
              width: 25%;
              cursor: pointer;
          }
          
          .poster-image{
              width: 200px;
              height: 300px;
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
                
                <div>
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="Servlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <button type="submit" class="nav__link">Show Details</button>
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="Servlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <button type="submit" class="nav__link">Show Details</button>
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="Servlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <button type="submit" class="nav__link">Show Details</button>
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="Servlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <button type="submit" class="nav__link">Show Details</button>
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="Servlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <button type="submit" class="nav__link">Show Details</button>
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
       <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="Servlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <button type="submit" class="nav__link">Show Details</button>
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="Servlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <button type="submit" class="nav__link">Show Details</button>
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
        <h1><%= data.getName() %></h1>
        <h1><%= data.getDate() %></h1>
        <form action="Servlet?id=event_details" method="post">
    <input type="hidden" name="event-id" value="<%= data.getId()%>">
    <button type="submit" class="nav__link">Show Details</button>
</form>
    </div>
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
                all_events.style.display = "flex";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            } else if (selectedCategory === "Sports") {
                all_events.style.display = "none";
                sport_events.style.display = "flex";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Musical / DJ") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "flex";
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
                business_events.style.display = "flex";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Trekking / Adventures") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "flex";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Cultural") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "flex";
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
                edu_events.style.display = "flex";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Promos / Expos") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "flex";
            }
            // Show other event category elements based on selected option
        }
   </script>
<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="script.js"></script>
   
</html>
