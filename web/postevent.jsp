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
            width: 100%;
            padding: 20px;
            border-radius: 16px;
            color: #fefefe;
            font-size: large;
            font-weight: bold;
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
            <form action="Servlet?id=postevent" method="post" enctype="multipart/form-data">
          
                <div class="item" style="display: none;">
          <p>Organizer's Username</p>
          <input type="text" name="eventorganizerusername" value="<%=loggedinuser%>" readonly/>
        </div>
                <div class="item" style="display: none;">
        </div>
        <div class="item">
          <p>Name of Event</p>
          <input type="text" name="eventname" />
        </div>
          <div class="item">
          <p>Type of Event</p>
          <select name="event_type">
            <option value=""></option>
            <option value="Please select" selected>*Please select from below options*</option>
            <option value="Sports">Sports</option>
            <option value="Trekking / Adventures">Trekking / Adventures</option>
            <option value="Cultural">Cultural</option>
            <option value="Musical / DJ">Musical / DJ</option>
            <option value="Business">Business</option>
            <option value="Educational">Educational</option>
            <option value="Promos / Expos">Promos / Expos</option>
          </select>
        </div>
        <div class="item">
          <p>Date of Event</p>
          <input type="text" name="bdate" placeholder="dd-mm-yyyy"/>
          <i class="fas fa-calendar-alt"></i>
        </div>
        <div class="item">
          <p>Time of Event</p>
          <input type="text" name="event_time" />
          <i class="fas fa-clock"></i>
        </div>
          <div class="item">
          <p>Set Duration</p>
          <input type="text" name="duration"/>
        </div>
        <div class="item">
          <p>Special Attraction</p>
          <input type="text" name="specialAttraction"/>
        </div>
        <div class="item">
          <p>Description of Event</p>
          <textarea rows="3" name="description"></textarea>
        </div>
        <div class="item">
          <p>Organizer's Name</p>
          <input type="text" name="promoter"/>
        </div>
        <div class="item">
          <p>Venue Name</p>
          <input type="text" name="venue_name"/>
        </div>
        <div class="item">
          <p>Venue Address</p>
          <input type="text" name="add1" placeholder="Street address" />
          <input type="text" name="add2" placeholder="Street address line 2" />
          <div class="city-item">
            <input type="text" name="city" placeholder="City" />
            <input type="text" name="state" placeholder="State/Region" />
            <input type="text" name="pin" placeholder="Postal / Zip code" />
            <input type="text" name="country" placeholder="Country" />
          </div>
        </div>
        <div class="item">
          <p>Entry Fees</p>
          <input type="text" name="ticket_count"/>
        </div>
        
        
        <div class="item">
          <p>Contact Person</p>
          <div class="name-item">
            <input type="text" name="firstname" placeholder="First" />
            <input type="text" name="lastname" placeholder="Last" />
          </div>
        </div>
        <div class="item">
          <p>Contact Email</p>
          <input type="text" name="email"/>
        </div>
        <div class="item">
          <p>Contact Number</p>
          <input type="text" name="con_num"/>
        </div>

          <div>
           <label for="poster">Upload Event Poster</label>
           <input type="file" id="poster" name="poster" accept="image/*" />
         </div>
        <div class="question">
          <p>Will this event be recorded?</p>
          <div class="question-answer">
            <div>
              <input type="radio" value="Yes" id="radio_1" name="recorded" />
              <label for="radio_1" class="radio"><span>Yes</span></label>
            </div>
            <div>
              <input type="radio" value="No" id="radio_2" name="recorded" />
              <label for="radio_2" class="radio"><span>No</span></label>
            </div>
          </div>
        </div>
                        
        <div class="btn-block">
          <button type="submit">POST EVENT</button>
        </div>
      </form>
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
</script>
   
<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="assets/js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</html>