<%@page import="java.util.Base64"%>
<%@page import="ServersidePackages.DataObject"%>
<%@page import="ServersidePackages.DataObject"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.cj.jdbc.Blob"%>
<%@ page import="java.io.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
        // Display event details if available in request attributes
        String e_name = (String) request.getAttribute("eventName");
        String org_name = (String) request.getAttribute("orgName");
        String e_id = (String) request.getAttribute("eventID");%>
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

        .view_container {
            width: 100%;
            height: 100%;
            margin: 80px auto auto auto;
            padding: 50px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
        }

        .text-section {
            background: linear-gradient(to right bottom, #3231a4, #319da4c9);
            color: #fff;
            height: 700px;
            border-radius: 20px;
            padding: 50px;
            overflow-y: scroll;
            scrollbar-width: none;
            text-align: center;
        }
        
        table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background: linear-gradient(to right bottom, #ff009d, #00fcdb);
    text-align: center;
}

/*tr:nth-child(odd) {
    background: black;
}
tr:nth-child(even) {
    background: blueviolet;
}*/

tr:hover {
    background: linear-gradient(to right bottom, #00fcdb, #ff009d);
}

        @media (max-width: 768px) {
            /* For smaller screens, switch to a single column layout */
            .container {
                grid-template-columns: 1fr;
                height: auto;
            }

            .text-section, .image-section {
                width: 100%;
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
                    <!--<a href="#" class="nav__button-link" onclick="openEditEvent()">View Participant Registrations</a>-->
                    <a href="#" class="nav__button-ghost" onclick="openOrgProfile()"><%= org_name %></a>
                    <form class="postevent" action="Servlet?id=loadOrg" method="post" style="display: none;">
    <input type="hidden" name="username" value="<%= org_name %>">
    <button id="profile_btn" type="submit" class="nav__link"><%= org_name %></button>
</form>
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
    <main> 
   <div class="view_container">
       
<%
        if (e_name != null && e_id != null) {
    %>
   
        <div id="text-section" class="text-section">
            
         
            <h2><%= e_name %></h2>
            
            <h2>Event Participants</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Sr. No.</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
            </tr>
        </thead>
        <tbody>
            <% 
            int serialNo = 1; // Initialize serial number
            List<DataObject> dataList = (List<DataObject>) request.getAttribute("dataList");
            for (DataObject data : dataList) { 
            %>
                <tr>
                    <td><%= serialNo++ %></td>
                    <td><%= data.getName() %></td>
                    <td><%= data.getEmail() %></td>
                    <td><%= data.getMobile() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    </div>

        
            

    
    
    
          <%
        }
    %> 
   </div>
    <div class="view-reg">    
            View Event Registrations
    </div>
    </main>
   
</body>

<script>
    function openOrgProfile(){
        document.getElementById("profile_btn").click();
    }
</script>
   
<script src="assets/js/gsap.min.js"></script>

<!-- MAIN JS -->
<script src="assets/js/main.js"></script>

<script src="assets/js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</html>