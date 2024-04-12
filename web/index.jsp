

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

      <title>Event Management Website</title>
   </head>
   
   <!--==================== HEADER ====================-->
      <header class="header" id="header">
        <nav class="nav container">
            <a href="index.jsp" class="nav__logo">
                <img src="assets/img/logo.svg" alt="logo">
            </a>

            <div class="nav__menu" id="nav-menu">
                <ul class="nav__list">
                    <li class="nav__item">
                        <a href="index.jsp" class="nav__link">Home</a>
                    </li>

                    <li class="nav__item">
                       <form action="Servlet?id=all_events" method="post">
    <input type="hidden" name="id" value="all_events">
    <button type="submit" class="nav__link">Events</button>
</form>
                    </li>

                    <li class="nav__item">
                        <a href="about.jsp" class="nav__link">About</a>
                    </li>

                    <li class="nav__item">
                        <a href="contact.jsp" class="nav__link">Contact</a>
                    </li>
                </ul>
                <div class="nav__buttons">
                    <a href="participant_registration.jsp" class="nav__button-ghost">I am a Participant</a>
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
      <!--==================== MAIN ====================-->
      <main class="main">
         <!--==================== HOME ====================-->
         <section class="home">
            <div class="home__container container">
                <div class="home__content">
                    <div class="home__data">
                        <h3 class="home__subtitle">
                            A LIFETIME EXPERIENCE
                        </h3>
                        <h1 class="home__title">
                            Festa Vista <br>
                        </h1>
			<h2 class="home__title2">Elevating events, simplifying solutions</h2>
                        <p class="home__description">
                            Events To Remember
                        </p>
                        <form action="Servlet?id=all_events" method="post">
    <input type="hidden" name="id" value="all_events">
    <button type="submit" class="home__button">Explore Events</button>
</form>
                    </div>
                    <img src="assets/img/bird-1.svg" alt="image" class="home__bird-1">
                    <img src="assets/img/bird-2.svg" alt="image" class="home__bird-2">
                </div>
                <div class="home__images">
                    <img src="assets/img/img-44.png" alt="image" class="home__img-4">
                    <img src="assets/img/img-3.png" alt="image" class="home__img-3">
                    <img src="assets/img/img-2.png" alt="image" class="home__img-2">
                    <img src="assets/img/img-11.png" alt="image" class="home__img-1">
                </div>
            </div>
         </section>
      </main>
      
     
   </body>
   
<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="script.js"></script>
   
</html>
