<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String loggedInUsername = (String) request.getAttribute("loggedInUsername"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="display: none;">
        
        <form id="login" action="ParticipantServlet?id=loadOrg" method="post">

        <label for="username">Username</label>
        <input type="text" placeholder="Username" id="username" name="username" value="<%= loggedInUsername %>">

<!--        <label for="password">Password</label>
        <input type="password" placeholder="Password" id="password" name="password" value="${param.password}">-->

        <button id="submitButton" type="submit">Log In</button>
    </form>
        
<script>
function autoredirect(){
        var button = document.getElementById('submitButton');
                // Trigger a click event on the button
                button.click();
}
    </script>
        
<% Boolean loginSuccess = (Boolean) request.getAttribute("loginSuccess"); %>
<% Boolean eventRegistrationSuccess = (Boolean) request.getAttribute("eventRegistrationSuccess"); %>
<% Boolean deletionSuccess = (Boolean) request.getAttribute("eventPostSuccess"); %>
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
<% if (deletionSuccess != null) { %>
    <script>
        var message = <%= deletionSuccess ? "'Event deleted successfully!'" : "'Error in deleting event. Please try again.'" %>;
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
