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
            background: linear-gradient(to right bottom, #ffffff, #02effe);
            color: #fff;
            display: block;
        }
        
/*        main{
            overflow: scroll;
        }*/

        .view_container {
            width: 100%;
            height: 100%;
            margin: 80px auto auto auto;
            padding: 50px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
        }

        .edit-section,
        .text-section {
            background: linear-gradient(to right bottom, #3231a4, #319da4c9);
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
            background: linear-gradient(to right bottom, #3231a4, #319da4c9);
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
    color: #e76eb9; /* Change color on hover */
}

/* Gradient Background for Headers */
h1, h3, h4, h5 {
    background: linear-gradient(45deg, #adfaff, #fefefe); /* Gradient background */
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

        .poster-actions {
            position: absolute;
            top: 10px;
            right: 10px;
            opacity: 0;            
        }
        .image-section:hover .poster-actions {
            opacity: 1;
        }
        .poster-actions button {
            background-color: rgba(0, 0, 0, 5);
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 14px;
            margin: 5px 5px;
        }
        .poster-actions button:hover {
            background-color: rgba(0, 0, 0, 0.7);
        }
        .image-section:hover {
            transform: translateY(-5px);
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
                    <a href="#" class="nav__button-ghost" onclick="viewEventParticipants()">View Participant Registrations</a>
                    <a href="#" class="nav__button-ghost" onclick="openOrgProfile()"><%= loggedInUsername %></a>
                    <form class="postevent" action="Servlet?id=loadOrg" method="post" style="display: none;">
    <input type="hidden" name="username" value="<%= loggedInUsername %>">
    <button id="profile_btn" type="submit" class="nav__link"><%= loggedInUsername %></button>
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
    <main> 
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
        String e_tickets = (String) request.getAttribute("e_tickets");
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
            <h2><%= eventID %></h2>
    
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
            <h5>Will event be recorded?: <%= e_isrecord %></h5><br>
            <p style="display: none;">Organizer: <%= e_organizer %></p>
            <a href="#" class="view-button" onclick="openEditEvent()">EDIT EVENT DETAILS</a>
    </div>
    
<div id="edit-section" class="edit-section" style="display: none;">
    <form action="Servlet?id=update_event" method="post" enctype="multipart/form-data" style="overflow-y: scroll; scrollbar-width: none;">
          
                <div class="item" style="display:none;">
          <p>Organizer's Username</p>
          <input type="text" name="eventorganizerusername" value="<%= e_organizer %>" readonly/>
        </div>
                <div class="item" style="display:none;">
          <p>Event ID</p>
          <input type="text" name="eventID" value="<%= eventID %>" readonly/>
        </div>
        <div class="item">
          <p>Name of Event</p>
          <input type="text" name="eventname" value="<%= e_name %>"/>
        </div>
          <div class="item">
          <p>Type of Event</p>
          <select name="event_type" style="background-color: #ffffff">
            <option value=""></option>
            <option value="<%= e_type %>" selected><%= e_type %></option>
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
          <input type="text" name="bdate" value="<%= e_date %>"/>
          <i class="fas fa-calendar-alt"></i>
        </div>
        <div class="item">
          <p>Time of Event</p>
          <input type="text" name="event_time" value="<%= e_time %>"/>
          <i class="fas fa-clock"></i>
        </div>
          <div class="item">
          <p>Set Duration</p>
          <input type="text" name="duration" value="<%= e_duration %>"/>
        </div>
        <div class="item">
          <p>Special Attraction</p>
          <input type="text" name="specialAttraction" value="<%= e_specialattraction %>"/>
        </div>
        <div class="item">
          <p>Description of Event</p>
          <textarea rows="5" name="description"><%= e_description %></textarea>
        </div>
        <div class="item">
          <p>Organizer's Name</p>
          <input type="text" name="promoter" value="<%= e_promoter %>"/>
        </div>
        <div class="item">
          <p>Venue Name</p>
          <input type="text" name="venue_name" value="<%= e_venue %>"/>
        </div>
        <div class="item">
          <p>Venue Address</p>
          <input type="text" name="add1" value="<%= e_addline1 %>" />
          <input type="text" name="add2" value="<%= e_addline2 %>" />
          <div class="city-item">
            <input type="text" name="city" value="<%= e_city %>" />
            <input type="text" name="state" value="<%= e_state %>" />
            <input type="text" name="pin" value="<%= e_post %>" />
            <input type="text" name="country" value="<%= e_country %>"/>
          </div>
        </div>
        <div class="item">
          <p>Entry Fees</p>
          <input type="text" name="ticket_count" value="<%= e_tickets %>"/>
        </div>
        
        
        <div class="item">
          <p>Contact Person</p>
          <div class="name-item">
            <input type="text" name="firstname" value="<%= e_contactpersonfirst %>" />
            <input type="text" name="lastname" value="<%= e_conatactpersonlast %>" />
          </div>
        </div>
        <div class="item">
          <p>Contact Email</p>
          <input type="text" name="email" value="<%= e_contactemail %>"/>
        </div>
        <div class="item">
          <p>Contact Number</p>
          <input type="text" name="con_num" value="<%= e_contactnumber %>"/>
        </div>
        <div class="question">
          <p>Will this event be recorded?</p>
          <div class="question-answer">
             
            <div>
              <input type="radio" value="Yes" id="radio_1" name="recorded" <%= e_isrecord.equals("Yes") ? "checked" : "" %>/>
              <label for="radio_1" class="radio"><span>Yes</span></label>
            </div>
            
            <div>
              <input type="radio" value="No" id="radio_2" name="recorded" <%= e_isrecord.equals("No") ? "checked" : "" %>/>
              <label for="radio_2" class="radio"><span>No</span></label>
            </div>
          </div>
        </div>
                        
        <div class="btn-block">
          <button type="submit">SAVE CHANGES</button>
          <a href="#" class="view-button" onclick="cancelEditEvent()">CANCEL</a>
        </div>
      </form>
    </div>
        
            
        <div id="image-section" class="image-section">
                            <% Blob e_poster = (Blob) request.getAttribute("e_poster");
       if (e_poster != null) {
           byte[] imageBytes = e_poster.getBytes(1, (int) e_poster.length());
           String base64Image = javax.xml.bind.DatatypeConverter.printBase64Binary(imageBytes);
    %>
           <img src="data:image/jpeg;base64, <%=base64Image%> " alt="Event Poster" class="poster-image">   
    <% } %>
    <div class="poster-actions">
                    <button onclick="openEditPoster()">Change Poster</button>
                </div>
        </div>
    <div id="image-edit" class="image-section" style="display: none;">
        
            <form action="Servlet?id=update_event-poster" method="post" enctype="multipart/form-data" style="overflow-y: scroll; scrollbar-width: none;">
                <div class="item" style="display: none;">
          <p>Organizer's Username</p>
          <input type="text" name="eventorganizerusername" value="<%= e_organizer %>" readonly/>
        </div>
                <div class="item" style="display: none;">
          <p>Event ID</p>
          <input type="text" name="eventID" value="<%= eventID %>" readonly/>
        </div>
                <div>
           <label for="poster">Upload Event Poster</label>
           <input type="file" id="poster" name="poster" accept="image/*" required/>
         </div>
                <button type="submit">SAVE CHANGES</button>
          <a href="#" class="view-button" onclick="cancelEditPoster()">CANCEL</a>
            </form>
        </div>
    
    <form action="Servlet?id=eventparticipants" method="post" style="display: none;">
          <input type="text" name="eventorganizerusername" value="<%= e_organizer %>" readonly/>
          <input type="hidden" name="eventID" value="<%= eventID %>" readonly/>
          <input type="hidden" name="eventName" value="<%= e_name %>" readonly/>
         <button id="view_participants" type="submit">SAVE CHANGES</button>
            </form>
    
          <%
        }
    %> 
   </div>
    </main>
   
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
    function viewEventParticipants(){
        document.getElementById("view_participants").click();
    }
    function openOrgProfile(){
        document.getElementById("profile_btn").click();
    }
</script>
   
<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="assets/js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</html>