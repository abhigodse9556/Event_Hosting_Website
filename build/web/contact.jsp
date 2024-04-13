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
      <link rel="stylesheet" href="assets/css/contactpage.css">

      <title>Event Management Website</title>
      
      <style>
          

        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
          body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right bottom, #ffffff, #02effe);
            color: #fff;
            display: flex;
            min-height: 100vh;
  width: 100%;
  align-items: center;
  justify-content: center;
        }
p{
    font-weight: bolder;
    color: white;
    background: linear-gradient(to right bottom, hsl(258.09deg 76.62% 70.36%), #dcacacba);
    padding: 15px 15px;
    border-radius: 15px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 5);
}

.contact_container{
  max-width: 1120px;
  margin-inline: 1.5rem;

}

.contact_container .contact_content {
  display: flex;
  align-items: center;
  justify-content: space-between;
  z-index: 2;
}
.contact_container .contact_content .left-side {
  width: 25%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin-top: 15px;
  position: relative;
  z-index: 2;
  font-weight: bolder; 
  color: white;
  background: linear-gradient(to right bottom, #3231a4, #319da4c9);
  border-radius: 15px; 
  padding: 20px;
}
.contact_content .left-side::before {
  content: "";
  position: absolute;
  height: 130%;
  width: 3px;
  right: -35px;
  top: 50%;
  transform: translateY(-50%);
  background: linear-gradient(to right bottom, #319da4c9, #3231a4);
  z-index: 2;
}
.contact_content .left-side .details {
  margin: 14px;
  text-align: center;
}
.contact_content .left-side .details i {
  font-size: 30px;
  color: #3e2093;
  margin-bottom: 10px;
  z-index: 2;
}
.content .left-side .details .topic {
  font-size: 18px;
  font-weight: 500;
}
.content .left-side .details .text-one,
.content .left-side .details .text-two {
  font-size: 14px;
  color: white;
  z-index: 2;
  background-color: rgba(245, 148, 39, 0.4);
}

.contact_container .contact_content .right-side {
  width: 75%;
  margin-left: 75px;
  z-index: 2;
  background: linear-gradient(to right bottom, #3231a4, #319da4c9);
  padding: 30px;
  border-radius: 15px; 
}
.contact_content .right-side .topic-text {
  font-size: 30px;
    font-weight: 600;
    color: white;
    z-index: 2;
    align-content: center;
    padding: 15px 15px;
}
.right-side .input-box {
  height: 55px;
  width: 100%;
  margin: 12px 0;
}
.right-side .input-box input,
.right-side .input-box textarea {
  height: 100%;
  width: 100%;
  border: none;
  outline: none;
  font-size: 16px;
  background: #f0f1f8;
  border-radius: 6px;
  padding: 0 15px;
  resize: none;
}
.right-side .message-box {
  min-height: 110px;
}
.right-side .input-box textarea {
  padding-top: 6px;
}
.right-side .button {
  display: inline-block;
  margin-top: 12px;
}
.right-side .button input[type="submit"] {
  color: #fff;
  font-size: 18px;
  outline: none;
  border: none;
  padding: 8px 16px;
  border-radius: 6px;
  background: linear-gradient(to right bottom, #319da4c9, #3231a4);
  cursor: pointer;
  transition: all 0.3s ease;
}
.button input[type="submit"]:hover {
  background: linear-gradient(to right bottom, #3231a4, #319da4c9);
}

@media (max-width: 950px) {
  .contact_container {
    width: 90%;
    padding: 30px 40px 40px 35px;
  }
  .contact_container .contact_content .right-side {
    width: 75%;
    margin-left: 55px;
    z-index: 2;
  }
}
@media (max-width: 820px) {
  .contact_container {
    margin: 40px 0;
    height: 100%;
  }
  .contact_container .contact_content {
    flex-direction: column-reverse;
    z-index: 2;
  }
  .contact_container .contact_content .left-side {
    width: 100%;
    flex-direction: row;
    margin-top: 40px;
    justify-content: center;
    flex-wrap: wrap;
  }
  .contact_container .contact_content .left-side::before {
    display: none;
  }
  .contact_container .contact_content .right-side {
    width: 100%;
    margin-left: 0;
    z-index: 2;
  }
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

                    <li class="nav__item" style="display: none;">
                       <form action="Servlet?id=all_events" method="post">
    <input type="hidden" name="id" value="all_events">
    <button id="event_btn" type="submit" class="nav__link">Events</button>
</form>
                    </li>

                    <li class="nav__item">
                        <a href="#" class="nav__link" onclick="eventNav()">Events</a>
                    </li>

                    <li class="nav__item">
                        <a href="about.jsp" class="nav__link">About</a>
                    </li>

                    <li class="nav__item">
                        <a href="contact.jsp" class="nav__link">Contact</a>
                    </li>
                </ul>
                <div class="nav__buttons">
                    <a href="participant_login.jsp" class="nav__button-ghost">I am an Participant</a>
                    <a href="login.jsp" class="nav__button-ghost">I am an Organizer</a>
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
         
                        <div class="contact_container">
<!--                            <div class="home__images">
            <img src="assets/img/img-44.png" alt="image" class="home__img-4" style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-3.png" alt="image" class="home__img-3" style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-2.png" alt="image" class="home__img-2" style="z-index: -1; filter: blur(3px); position: fixed;">
                    <img src="assets/img/img-11.png" alt="image" class="home__img-1" style="z-index: -1; filter: blur(3px); position: fixed;">
                </div>-->
      <div class="contact_content">
        <div class="left-side">
          <div class="address details">
            <i class="fas fa-map-marker-alt"></i>
            <div class="topic">Address</div>
            <div class="text-one">Lohegaon, Pune</div>
            <div class="text-two">Maharashtra, India</div>
          </div>
          <div class="phone details">
            <i class="fas fa-phone-alt"></i>
            <div class="topic">Phone</div>
            <div class="text-one">+91 9503194613</div>
            <div class="text-two">+91 8012389456</div>
          </div>
          <div class="email details">
            <i class="fas fa-envelope"></i>
            <div class="topic">Email</div>
            <div class="text-one">abhigodse@gmail.com</div>
            <div class="text-two">info.festavista@gmail.com</div>
          </div>
        </div>
        <div class="right-side">
          <div class="topic-text">Send us a message</div>
          <p>If you have any work from us or any types of queries related to our website, you can send us message from here. It's our pleasure to help you.</p>
          <form action="ContactServlet?request_id=sendMessage" method="post">
            <div class="input-box">
              <input type="text" name="sender_name" placeholder="Enter your name" />
            </div>
            <div class="input-box">
              <input type="text" name="sender_email" placeholder="Enter your email" />
            </div>
            <div class="input-box message-box">
              <textarea name="message" placeholder="Enter your message"></textarea>
            </div>
            <div class="button">
              <input class="button" type="submit" value="Send Now" />
            </div>
          </form>
        </div>
      </div>
    </div>
                   
                    
               
               
            
      </main>
      
     <% Boolean messageSendingSuccess = (Boolean) request.getAttribute("messageSendingSuccess"); %>
<% if (messageSendingSuccess != null) { %>
    <script>
        var message = <%= messageSendingSuccess ? "'Message Sent successful!'" : "'Error in sending message. Please try again.'" %>;
        alert(message);
    </script>
<% } %>

<script>
          function eventNav(){
              document.getElementById("event_btn").click();
          }
      </script>

   </body>
   

<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="script.js"></script>
   
</html>