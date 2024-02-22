<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="head.jsp" %>
<% String loggedInUsername = (String) request.getAttribute("loggedInUsername"); %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Organizer Dashboard</title>
    <link rel="stylesheet" href="assets/css/organizer.css">
    <script src="assets/js/script.js"></script>
</head>

<body class="org-container">
    <script src="script.js"></script>
    
    
    <div class="sidebar">
        <h2>Welcome, <%= loggedInUsername %>!</h2><br>
        <!-- Left Sidebar with options -->
        <a href="#" onclick="showOrganizerProfile()">Organizer Profile</a>
        <a href="#" onclick="showEventForm()">Post an Event</a>
        <a href="#" onclick="showEventHistory()">Event History</a>
    </div>

    <div class="content">
        <!-- Initial Image Section -->
        <section id="initial-image">
            <img src="initial_image.jpg" alt="Initial Image">
        </section>

        <!-- Organizer Profile Section -->
        <section id="organizer-profile" style="display: none;">
            <!-- Organizer profile content goes here -->
            <h2>Organizer Profile</h2>
            <!-- Add relevant content for organizer profile -->
            <p>Organizer details go here.</p>
            
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>

            <label for="organizaion">Organization Name:</label>
            <input type="text" id="organizaion" name="organizaion" required><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" oninput="autofillUsername()" required><br>

            <label for="mobileNo">Mobile No:</label>
            <input type="text" id="mobileNo" name="mobileNo" required><br>
            
        </section>

        <!-- Post an Event Section -->
        <section id="event-form" style="display: none;">
            <h2>Post an Event</h2>
            <!-- Form for posting an event goes here -->
            <form>
                <!-- Add input fields for event details -->
                <label for="eventName">Event Name:</label>
                <input type="text" id="eventName" name="eventName" required>
                <!-- Add more input fields as needed -->

                <!-- Post Event Button -->
                <button type="submit">Post Event</button>
            </form>
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
    </div>  
</body>

<% Boolean loginSuccess = (Boolean) request.getAttribute("loginSuccess"); %>
<% if (loginSuccess != null) { %>
    <script>
        var message = <%= loginSuccess ? "'Login successful!'" : "'Error in login. Please try again.'" %>;
        alert(message);
    </script>
<% } %>


<%@ include file="footer.jsp" %>