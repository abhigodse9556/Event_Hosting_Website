<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="head.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/org_reg_form.css"> 
    <script src="assets/js/script.js"></script>
    <title>Organizer Registration</title>
</head>
<body>
    
     <main class="main">
         <!--==================== HOME ====================-->
         <section class="">
             <div class=""><br><br><br>
                
        
        <form class="reg-form" id="register" onsubmit="return validateRegisterForm()" method="post" action="Servlet?id=register">
            <h2>Organizer Registration</h2><br>
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
            <a href="index.jsp">Cancel Registration</a>
        </div>
    
    </form>
    
            </div>
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
<%@ include file="footer.jsp" %>

