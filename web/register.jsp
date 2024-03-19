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
         
         <div class="home__images">
            <img src="assets/img/img-44.png" alt="image" class="home__img-4" style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-3.png" alt="image" class="home__img-3" style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-2.png" alt="image" class="home__img-2" style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-11.png" alt="image" class="home__img-1" style="z-index: -1; filter: blur(3px); position: fixed;">
                </div>
         
         <section class="register">
             <div class="column">
                 <h2 class="headings">Why Register as an Organizer?</h2>
                 <p style="text-align: center;">Welcome to Festa Vista! Here are some benefits of Organizer Registration</p>
                 
                 <li>
                     <b>Showcase Your Event:</b>
By registering as an organizer, you gain the opportunity to showcase your event to a wider audience. Your event will be featured on our platform, making it visible to potential participants who are actively seeking exciting events to attend.
                 </li>
                 <li>
                     <b>Expand Your Reach:</b>
Registration allows you to expand your event's reach beyond your immediate network. With our platform, you have access to a diverse audience of event enthusiasts who may not have otherwise discovered your event.
                 </li>
                 <li>
                     <b>Streamlined Event Management:</b>
Our registration process simplifies event management tasks such as attendee registration, communication, and updates. You'll have access to tools and features designed to streamline the planning and execution of your event, saving you time and effort.
                 </li>
                 <li>
                     <b>Enhance Credibility:</b>
Listing your event on a reputable platform like ours enhances its credibility and legitimacy. Visitors to our website trust our recommendations and are more likely to engage with events listed by registered organizers.
                 </li>
                 <li>
                     <b>Increase Participation:</b>
Registration increases the likelihood of participant engagement with your event. Visitors can easily register for your event through our platform, making it convenient for them to join and participate.
                 </li>
                 </div>
             <div class="column">
        <form class="reg-form" id="register" onsubmit="return validateRegisterForm()" method="post" action="Servlet?id=register">
            <h4 class="headings">Already Registered!</h4><br>
            <a class="bottom-line" href="login.jsp" style="margin-left: 95px;"> Go to login page</a><br><br>
            <h2 class="headings">Organizer Registration</h2><br>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="organizaion">Organization Name:</label>
        <input type="text" id="organizaion" name="organizaion" required><br>

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

