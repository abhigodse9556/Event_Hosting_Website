<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String loggedInUsername = (String) request.getAttribute("loggedInUsername"); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <!-- Your form with correct action -->
    <form id="login" action="Servlet?id=loadOrg" method="post">
        <label for="username">Username</label>
        <input type="text" placeholder="Username" id="username" name="username" value="<%= loggedInUsername %>">
        <button id="submitButton" type="submit">Log In</button>
    </form>

    <!-- JavaScript section -->
    <script>
        // Function to automatically submit the form
        function autoredirect() {
            var button = document.getElementById('submitButton');
            // Trigger a click event on the button
            button.click();
        }

        // Execute this JavaScript after the page loads
        window.onload = function() {
            <% Boolean loginSuccess = (Boolean) request.getAttribute("loginSuccess"); %>
            <% Boolean eventPostSuccess = (Boolean) request.getAttribute("eventPostSuccess"); %>
            <% Boolean deletionSuccess = (Boolean) request.getAttribute("deletionSuccess"); %>
            <% Boolean updatationSuccess = (Boolean) request.getAttribute("updatationSuccess"); %>
            <% Boolean eventUpdateSuccess = (Boolean) request.getAttribute("eventUpdateSuccess"); %>
            <% Boolean posterUpdateSuccess = (Boolean) request.getAttribute("posterUpdateSuccess"); %>

            // Check if login success message is available
            <% if (loginSuccess != null) { %>
                var message = <%= loginSuccess ? "'Login successful!'" : "'Error in login. Please try again.'" %>;
                alert(message);
                autoredirect();
            <% } else if (eventPostSuccess != null) { %>
                var message = <%= eventPostSuccess ? "'Event posted successfully!'" : "'Error in posting event. Please try again.'" %>;
                alert(message);
                autoredirect();
            <% } else if (deletionSuccess != null) { %>
                var message = <%= deletionSuccess ? "'Event deleted successfully!'" : "'Error in deleting event. Please try again.'" %>;
                alert(message);
                autoredirect();
            <% } else if (updatationSuccess != null) { %>
                var message = <%= updatationSuccess ? "'Profile Updated successfully!'" : "'Error in updating profile. Please try again.'" %>;
                alert(message);
                autoredirect();
            <% } else if (eventUpdateSuccess != null) { %>
                var message = <%= eventUpdateSuccess ? "'Event Updated successfully!'" : "'Error in updating event. Please try again.'" %>;
                alert(message);
                autoredirect();
            <% } else if (posterUpdateSuccess != null) { %>
                var message = <%= posterUpdateSuccess ? "'Event Poster Updated successfully!'" : "'Error in updating poster. Please try again.'" %>;
                alert(message);
                autoredirect();
            <% } %>
        };
    </script>
</body>
</html>
