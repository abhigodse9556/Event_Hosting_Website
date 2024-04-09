<%-- 
    Document   : autoredirectpage
    Created on : 09-Apr-2024, 12:29:53 am
    Author     : abhig
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="display: none;">
        
        <form id="login" action="Servlet?id=login" method="post">
        <h3>Login Here</h3>

        <label for="username">Username</label>
        <input type="text" placeholder="Username" id="username" name="username" value="${param.username}">

        <label for="password">Password</label>
        <input type="password" placeholder="Password" id="password" name="password" value="${param.password}">

        <button id="submitButton" type="submit">Log In</button>
        <div class="social">
          <div class="go"><i class="fab fa-google"></i>  Google</div>
          <div class="fb"><i class="fab fa-facebook"></i>  Facebook</div>
        </div>
    </form>
        
        <script>
        var button = document.getElementById('submitButton');
                // Trigger a click event on the button
                button.click();
    </script>
        
        


    </body>
</html>
