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
            background: linear-gradient(to right bottom, #ffffff, #02effe);
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
            background: linear-gradient(to right bottom, #319da4c9, #3231a4);
            text-align: center;
            font-weight: bold;
            font-size: 24px;
        }
        
        .heading{
            height: min-content;
        }
            
            form{
                /*box-shadow: 0 0 0px 0 #ffffff;*/
            }

        /* Profile Section */
        .profile {
            background: linear-gradient(to right bottom, #3231a4, #319da4c9);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 40px;
            height: 730px;
            
            h2{
                background: linear-gradient(to right bottom, #319da4c9, #3231a4);
            }
        }
        .profile p {
            margin: 10px 0;
            font-size: 18px;
        }
        .profile button {
            background: linear-gradient(to right bottom, #00f0ff, #0018ff);
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
            background: linear-gradient(to right bottom, #0018ff, #000000);
        }
        
        .edit{
            display: none;
        }
        
            .cancel-button{
                background: linear-gradient(to right bottom, #00f0ff, #0018ff);
                color: #fff;
                padding-top: 5px;
                border-radius: 5px;
                padding-bottom: 7px;
                padding-left: 15px;
                padding-right: 15px;
                margin-left: 5px;
            }
            .cancel-button:hover{
                background: linear-gradient(to right bottom, #0018ff, #000000);
            }
            .logout-button{
                background: linear-gradient(to right bottom, #00f0ff, #0018ff);
                color: #fff;
                padding-top: 5px;
                border-radius: 5px;
                padding-bottom: 7px;
                padding-left: 15px;
                padding-right: 15px;
                margin-left: 5px;
                margin-top: 10px;
            }
            .logout-button:hover{
                background: linear-gradient(to right bottom, #0018ff, #000000);
            }
            

        /* Events Section */
        .events {
            background: linear-gradient(to right bottom, #3231a4, #319da4c9);
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
            height: 730px;
            overflow-y: scroll;
            scrollbar-width: none;
        }
        .event {
            background: linear-gradient(to right bottom, hsl(258.09deg 76.62% 70.36%), #dcacacba);
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
            padding: 40px 10px 10px 10px;
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
            background: linear-gradient(to right bottom, #00f0ff, #0018ff);
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 14px;
            margin: 5px 5px;
            width: 150px;
        }
        .event-actions button:hover {
            background: linear-gradient(to right bottom, #0018ff, #000000);
        }
        
        .event_form{
            margin: 10px;
        }
        
        .post-button{
            background: linear-gradient(to right bottom, #00f0ff, #0018ff);
        }
        .post-button:hover{
            background: linear-gradient(to right bottom, #0018ff, #000000);
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
                    <a href="#" class="nav__button-ghost" onclick="openEventPostForm()">Post Event</a>
<!--                    <form action="postevent.jsp" method="post">
    <input type="hidden" name="loggedinuser" value="<%= loggedInUsername %>">
    <button type="submit" class="nav__link">Post an Event</button>
</form>-->
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
            <h3>Hello, <%= loggedInUsername %>!</h3><br>
            <h3>Welcome to Organizer Dashboard!</h3><br>
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
        <div id="event_history" class="section events">
            <div class="heading">
                <h2>Posted Event History</h2>
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
                <p class="event-info"><strong> <%= data.getDate() %></strong></p>
                
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
        
        <!-- Events Posting Section -->
        <div id="event_posting" class="section events" style="display: none;">
            <div class="heading">
                <h2>Event Posting Form</h2>
            </div>
            <div class="event_form">
            <form action="Servlet?id=postevent" method="post" enctype="multipart/form-data">
          
                <div class="item" style="display: none;">
          <p>Organizer's Username</p>
          <input type="text" name="eventorganizerusername" value="<%=loggedInUsername%>" readonly/>
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
          <input type="text" name="entry_fees"/>
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
          <button class="post-button" type="submit">POST EVENT</button>
          <a href="#" class="cancel-button" onclick="closeEventPostForm()">Cancel</a>
        </div>
      </form>
            </div>
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
    function openEventPostForm(){
        document.getElementById("event_history").style.display = "none";
        document.getElementById("event_posting").style.display = "block";
    }
    function closeEventPostForm(){
        document.getElementById("event_history").style.display = "grid";
        document.getElementById("event_posting").style.display = "none";
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