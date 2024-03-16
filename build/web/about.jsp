<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="head.jsp" %>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/about.css" />
</head>
<body>
<main class="main">
    <div class="home_container container">
<div class="about-section">
  <h1>Welcome to Festa Vista</h1>
  <p>At Festa Vista, we're passionate about connecting organizers with their audience and creating memorable experiences. Whether you're an event organizer looking to showcase your event or an enthusiast seeking exciting experiences, we're here to make it happen.</p>
  <h1>Our Mission</h1>
  <p>Our mission is to bridge the gap between event organizers and attendees, providing a platform where events of all kinds can flourish. We strive to make event planning and participation seamless, enjoyable, and rewarding for everyone involved.</p>
  <h1>What we offer</h1>
  <p><li>Organizer Registration: We offer a user-friendly platform for event organizers to register and showcase their events. From conferences and concerts to workshops and community gatherings, we welcome all types of events.</li>

  <li>Event Discovery: Visitors to our website can easily discover a diverse range of events happening in their area or areas of interest. With detailed event listings and filtering options, finding the perfect event has never been easier.</li>

<li>Participant Registration: Interested individuals can register for events directly through our website, making event participation hassle-free and convenient.</li>

<li>Engaging Community: We foster a vibrant community of event enthusiasts, organizers, and participants. Through our platform, users can connect, share experiences, and stay updated on upcoming events.</li></p>
</div>

<h2 style="text-align:center">Our Team</h2>
<div class="row">
  <div class="column">
    <div class="card">
      <img src="/w3images/team1.jpg" alt="Jane" style="width:100%; height: 300px;">
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
      <img src="/w3images/team2.jpg" alt="Mike" style="width:100%; height: 300px;">
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
      <img src="/w3images/team3.jpg" alt="John" style="width:100%; height: 300px;">
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
      <img src="/w3images/team3.jpg" alt="John" style="width:100%; height: 300px;">
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
  <h1>Get in Touch</h1>
  <p>Have questions, feedback, or need assistance? We're here to help! Feel free to reach out to us via our <a href="contact.jsp">contact</a> page or connect with us on social media.

Thank you for choosing Festa Vista for all your event needs. Let's create unforgettable experiences together!</p>
  </div>
    <div class="home__images">
        <img src="assets/img/img-44.png" alt="image" class="home__img-4" style="z-index: -1; position: fixed;">
        <img src="assets/img/img-3.png" alt="image" class="home__img-3" style="z-index: -1; position: fixed;">
        <img src="assets/img/img-2.png" alt="image" class="home__img-2" style="z-index: -1; position: fixed;">
        <img src="assets/img/img-11.png" alt="image" class="home__img-1" style="z-index: -1; position: fixed;">
    </div>
    </div>
    
</main>
    
    <script>
        function gotoContact(){
    window.location.href = "http://localhost:8080/FestaVista/contact.jsp";
}
    </script>
</body>

<%@ include file="footer.jsp" %>

