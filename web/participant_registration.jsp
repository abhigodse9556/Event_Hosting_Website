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
      <link rel="stylesheet" href="assets/css/register.css">

      <title>Event Management Website</title>
      
      <style>
          .register{
              background: linear-gradient(to right bottom, #ffffff, #02effe);
          }
          
          .reg-form {
              background: linear-gradient(to right bottom, #ff00c8, #0013c4);
              width: 400px;
              color: #ffffff;
              margin: 3px auto;
              padding: 30px;
              border-radius: 15px;
              box-shadow: 0 4px 10px rgba(0, 0, 0, 5);
          }
          
          .column li {
    color: #401fcc;
    background-color: rgb(27 239 11 / 0%);
    text-align: justify;
    text-justify: inter-word;
    border-radius: 15px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 5);
    padding: 10px 5px;
    margin: 10px 5px;
}

.column p {
    color: #00d9ff;
    background-color: rgba(275, 0, 0, 0);
    text-align: justify;
    text-justify: inter-word;
    border-radius: 15px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 5);
    padding: 10px 5px;
    margin: 10px 5px;
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
     <main class="main">
         
         <section class="register">
             <div class="column">
                 <h2 class="headings">Why Register as a Participant?</h2>
                 <p style="text-align: center;">Welcome to Festa Vista! Here are some benefits of Participant Registration</p>
                 
                 <li>
                     <b>Event Discovery: </b>
Participants can easily browse through a wide range of events across various categories and locations.
                 </li>
                 <li>
                     <b>Detailed Event Information:</b>
 Provide comprehensive details about each event including date, time, location, agenda, speakers, sponsors, and any other relevant information.
                 </li>
                 <li>
                     <b>Registration: </b>
Allow participants to register for events directly through your website, streamlining the process and eliminating the need for manual registration.
                 </li>
                 <li>
                     <b>Customizable Profiles: </b>
Enable participants to create personalized profiles where they can manage their event registrations, preferences, and other relevant information.
                 </li>
                 <li>
                     <b>Exclusive Offer:</b>
 Flat 10% discount on entry fees on registering through our website!
                 </li>
               </div>
             <div class="column">
        <form class="reg-form" id="register" onsubmit="return validateRegisterForm()" method="post" action="ParticipantServlet?id=register">
            <h4 class="headings">Already Registered!</h4><br>
            <a class="bottom-line" href="participant_login.jsp" style="margin-left: 95px;"> Go to login page</a><br><br>
            <h2 class="headings">Participant Registration</h2><br>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" oninput="autofillUsername()" required><br>

        <label for="mobileNo">Mobile No:</label>
        <input type="text" id="mobileNo" name="mobileNo" required><br>

        <label for="registerUsername">Username:</label>
        <input type="text" id="registerUsername" name="registerUsername" readonly><br>

        <label for="registerPassword">Password:</label>
        <input type="password" id="registerPassword" name="registerPassword" required><br>

        <div class="submitbuttons">
            <input type="submit" value="Submit">
            <br><br>
            <a class="bottom-line" href="index.jsp"  style="margin-left: 160px;">Cancel Registration</a>
        </div>
    
    </form>
    
            </div>
             
             <h2 class="headings">Get Started Today!</h2><p class="bottom">
Don't miss out on the opportunity to showcase your event to a broader audience and streamline your event management process. Register as an organizer today and unlock a world of possibilities for your event!</p>
             <h2 class="headings">Get in Touch</h2>
  <p  class="bottom">Want to know more about us visit our <a href="about.jsp">about</a> page or Have questions, feedback, or need assistance? We're here to help! Feel free to reach out to us via our <a href="contact.jsp">contact</a> page or connect with us on social media.

Thank you for choosing Festa Vista for all your event needs. Let's create unforgettable experiences together!</p>
             
         </section>
        
      </main>
    
    <script>
        function autofillUsername() {
    // Get the value of the email field
    var emailInput = document.getElementById('email');
    var emailValue = emailInput.value;

    // Extract the part before the '@' symbol
    var username = emailValue.split('@')[0];

    // Autofill the registerUsername field
    var usernameInput = document.getElementById('registerUsername');
    usernameInput.value = username;
}
    </script>
    
</body>
<% Boolean registrationSuccess = (Boolean) request.getAttribute("registrationSuccess"); %>
<% if (registrationSuccess != null) { %>
    <script>
        var message = <%= registrationSuccess ? "'Registration successful!'" : "'Error in registration. Please try again.'" %>;
        alert(message);
    </script>
<% } %>

   
<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="script.js"></script>
   
</html>

