<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
      <link rel="stylesheet" href="assets/css/organizer.css">

      <title>Event Organizer Dashboard</title>
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

<body class="org-container">
    <script src="script.js"></script>
    
    
    
    <div class="sidebar">
        <% String loggedInUsername = (String) request.getAttribute("loggedInUsername"); %>
        <h2>Welcome, <%= loggedInUsername %>!</h2><br>
        <!-- Left Sidebar with options -->
        <a href="#" onclick="showOrganizerProfile()">Organizer Profile</a>
        <a href="#" onclick="showEventForm()">Post an Event</a>
        <a href="#" onclick="showEventHistory()">Event History</a>
    </div>

    <div class="content">
        <!-- Initial Image Section -->
        <section id="initial-image">
            
        </section>

        <!-- Organizer Profile Section -->
        <section id="organizer-profile" style="display: none;">
            <h2>Organizer Profile</h2>
            <%
        // Display organizer details if available in request attributes
        String organizerName = (String) request.getAttribute("organizerName");
        String organizerOrg = (String) request.getAttribute("organizerOrg");
        String organizerEmail = (String) request.getAttribute("organizerEmail");
        String organizerMobile = (String) request.getAttribute("organizerMobile");

        if (organizerName != null && organizerEmail != null) {
    %>
            <p>Name: <%= organizerName %></p>
            <p>Organization: <%= organizerOrg %></p>
            <p>Email: <%= organizerEmail %></p>
            <p>Mobile No: <%= organizerMobile %></p>
    <%
        }
    %>
        </section>

        <!-- Post an Event Section -->
        <section id="event-form" style="display: none;">
            
      <div class="testbox">
      <form action="Servlet?id=postevent" method="post" enctype="multipart/form-data">
          <div class="banner" >
              <img src="assets/img/post_event_form.jpg" class="banner_img">
          <h1>Event Posting Form</h1>
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
            <option value="Promos">Promos</option>
            <option value="Expos">Expos</option>
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
          <p>Available Tickets</p>
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
            
        </section>

        <!-- Event History Section -->
        <section id="event-history" style="display: none;">
            <h2>Event History</h2>
            <!-- Overview of posted events goes here -->
            <!-- Display poster image, event name, date, etc. -->
            <div class="event-overview" onclick="showDetailedEvent(1)">
                <!-- Event Overview Content -->
                <img src="event_poster.jpg" alt="Event Poster">
                <p>Event Name</p>
                <p>Date of Event</p>
            </div>

            <!-- Add more event overviews as needed -->
        </section>

        <!-- Detailed Event Information Section -->
        <section id="detailed-event" style="display: none;">
            <!-- Detailed event information goes here -->
            <h2>Event Details</h2>
            <!-- Display detailed information for the selected event -->
            <!-- Include all the details mentioned in the question -->
            <p>Detailed information for the selected event goes here.</p>
        </section>
        
        <div class="home__images">
            <img src="assets/img/img-44.png" alt="image" class="home__img-4" style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-3.png" alt="image" class="home__img-3" style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-2.png" alt="image" class="home__img-2" style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-11.png" alt="image" class="home__img-1" style="z-index: -1; filter: blur(3px); position: fixed;">
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


   
<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="assets/js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</html>