

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
      <link rel="stylesheet" href="assets/css/aboutpage.css">

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
    <div class="home_container container">
        
        <div class="home__images">
            <img src="assets/img/img-44.png" alt="image" class="home__img-4" style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-3.png" alt="image" class="home__img-3" style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-2.png" alt="image" class="home__img-2" style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-11.png" alt="image" class="home__img-1" style="z-index: -1; filter: blur(3px); position: fixed;">
                </div>
        
<div class="about-section">
  <h1>Welcome to Festa Vista</h1><br>
  <p>At Festa Vista, we're passionate about connecting organizers with their audience and creating memorable experiences. Whether you're an event organizer looking to showcase your event or an enthusiast seeking exciting experiences, we're here to make it happen.</p>
  <br><br><h1>Our Mission</h1><br>
  <p>Our mission is to bridge the gap between event organizers and attendees, providing a platform where events of all kinds can flourish. We strive to make event planning and participation seamless, enjoyable, and rewarding for everyone involved.</p>
  <br><br><h1>What we offer</h1><br>
  <p><li>Organizer Registration: We offer a user-friendly platform for event organizers to register and showcase their events. From conferences and concerts to workshops and community gatherings, we welcome all types of events.</li>

  <br><li>Event Discovery: Visitors to our website can easily discover a diverse range of events happening in their area or areas of interest. With detailed event listings and filtering options, finding the perfect event has never been easier.</li>

<br><li>Participant Registration: Interested individuals can register for events directly through our website, making event participation hassle-free and convenient.</li>

<br><li>Engaging Community: We foster a vibrant community of event enthusiasts, organizers, and participants. Through our platform, users can connect, share experiences, and stay updated on upcoming events.</li></p>
</div>
        <br><br>

<div class="row">
    <br><br><h2 style="text-align:center">Our Team</h2><br><br>
  <div class="column">
    <div class="card">
      <img src="assets/img/abhi.jpg" alt="Jane" style="width:100%; height: 300px;">
      <div class="container">
        <h2>Jane Doe</h2>
        <p class="title">CEO & Founder</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>jane@example.com</p>
        <p><button class="button" onclick="gotoContact()">Contact</button></p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="assets/img/dummy.jpg" alt="Mike" style="width:100%; height: 300px;">
      <div class="container">
        <h2>Mike Ross</h2>
        <p class="title">Art Director</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>mike@example.com</p>
        <p><button class="button" onclick="gotoContact()">Contact</button></p>
      </div>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <img src="assets/img/dummy.jpg" alt="John" style="width:100%; height: 300px;">
      <div class="container">
        <h2>John Doe</h2>
        <p class="title">Designer</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>john@example.com</p>
        <p><button class="button" onclick="gotoContact()">Contact</button></p>
      </div>
    </div>
  </div>
    
  <div class="column">
    <div class="card">
      <img src="assets/img/dummy.jpg" alt="John" style="width:100%; height: 300px;">
      <div class="container">
        <h2>John Doe</h2>
        <p class="title">Designer</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>john@example.com</p>
        <p><button class="button" onclick="gotoContact()">Contact</button></p>
      </div>
    </div>
  </div>
</div>
<div class="about-section">
    <h1>Get in Touch</h1><br>
  <p>Have questions, feedback, or need assistance? We're here to help! Feel free to reach out to us via our <a href="contact.jsp">contact</a> page or connect with us on social media.

Thank you for choosing Festa Vista for all your event needs. Let's create unforgettable experiences together!</p>
  </div>
    
    </div>
    
</main>
    
    <script>
        function gotoContact(){
    window.location.href = "http://localhost:8080/FestaVista/contact.jsp";
}
    </script>
</body>

<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="script.js"></script>
   
</html>

