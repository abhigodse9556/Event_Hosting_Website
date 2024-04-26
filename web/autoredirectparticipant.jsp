<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String loggedInUsername = (String) request.getAttribute("loggedInUsername"); 
%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="display: none;">
        
        <form id="login" action="ParticipantServlet?id=loadParticipant" method="post">

        <label for="username">Username</label>
        <input type="text" placeholder="Username" id="username" name="username" value="<%= loggedInUsername %>">

        <button id="submitButton" type="submit">Log In</button>
        
<script>
function autoredirect(){
        var button = document.getElementById('submitButton');
                // Trigger a click event on the button
                button.click();
}
    </script>
        
<% Boolean loginSuccess = (Boolean) request.getAttribute("loginSuccess"); %>
<% Boolean eventRegistrationSuccess = (Boolean) request.getAttribute("eventRegistrationSuccess"); %>
<% Boolean cancelationSuccess = (Boolean) request.getAttribute("cancelationSuccess"); %>
<% Boolean updatationSuccess = (Boolean) request.getAttribute("updatationSuccess"); %>
<% Boolean eventUpdateSuccess = (Boolean) request.getAttribute("eventUpdateSuccess"); %>
<% Boolean posterUpdateSuccess = (Boolean) request.getAttribute("posterUpdateSuccess"); %>
<% if (loginSuccess != null) { %>
    <script>
        var message = <%= loginSuccess ? "'Login successful!'" : "'Error in login. Please try again.'" %>;
        alert(message);
        autoredirect();
    </script>
<% } %>

<% if (eventRegistrationSuccess != null) { %>
    <script>
        var message = <%= eventRegistrationSuccess ? "'Event registered successfully!'" : "'Error in registration of event. Please try again.'" %>;
        alert(message);
        autoredirect();
    </script>
    
<% } %>

<% if (cancelationSuccess != null) { %>
    <script>
        var message = <%= cancelationSuccess ? "'Event Registration Canceled successfully!'" : "'Error in canceling registration of event. Please try again.'" %>;
        alert(message);
        autoredirect();
    </script>
<% } %>  
<% if (updatationSuccess != null) { %>
    <script>
        var message = <%= updatationSuccess ? "'Profile Updated successfully!'" : "'Error in updating profile. Please try again.'" %>;
        alert(message);
        autoredirect();
    </script>
<% } %>  
<% if (eventUpdateSuccess != null) { %>
    <script>
        var message = <%= eventUpdateSuccess ? "'Event Updated successfully!'" : "'Error in updating event. Please try again.'" %>;
        alert(message);
        autoredirect();
    </script>
<% } %>  
<% if (posterUpdateSuccess != null) { %>
    <script>
        var message = <%= posterUpdateSuccess ? "'Event Poster Updated successfully!'" : "'Error in updating poster. Please try again.'" %>;
        alert(message);
        autoredirect();
    </script>
<% } %>  


    </body>
</html>
