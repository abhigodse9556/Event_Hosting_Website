<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="head.jsp" %>
<head>
    <meta charset="UTF-8" />
    <title>Contact Us Form</title>
    <link rel="stylesheet" href="assets/css/contact.css" />
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  </head>
<body>
      <!--==================== MAIN ====================-->
      <main class="main">
         <!--==================== HOME ====================-->
         
                        <div class="home_container container">
      <div class="content">
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
          <form action="#">
            <div class="input-box">
              <input type="text" placeholder="Enter your name" />
            </div>
            <div class="input-box">
              <input type="text" placeholder="Enter your email" />
            </div>
            <div class="input-box message-box">
              <textarea placeholder="Enter your message"></textarea>
            </div>
            <div class="button">
              <input type="button" value="Send Now" />
            </div>
          </form>
        </div>
      </div>
    </div>
                   
                    
               
                <div class="home__images">
                    <img src="assets/img/img-44.png" alt="image" class="home__img-4" style="position: fixed;">
                    <img src="assets/img/img-3.png" alt="image" class="home__img-3" style="position: fixed;">
                    <img src="assets/img/img-2.png" alt="image" class="home__img-2" style="position: fixed;">
                    <img src="assets/img/img-11.png" alt="image" class="home__img-1" style="position: fixed;">
                </div>
            
      </main>
      
     
   </body>
   
   <%@ include file="footer.jsp" %>