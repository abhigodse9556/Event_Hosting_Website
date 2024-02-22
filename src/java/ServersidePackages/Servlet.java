package ServersidePackages;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    // JDBC variables
        String jdbcURL = "jdbc:mysql://localhost:3306/festavista_db";
        String dbUser = "root";
        String dbPassword = "root123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");

        if ("register".equals(id)) {
            handleRegistration(request, response);
        } else if ("login".equals(id)) {
            handleLogin(request, response);
        }
    }

    private void handleRegistration(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String organization = request.getParameter("organizaion");
        String email = request.getParameter("email");
        String mobileNo = request.getParameter("mobileNo");
        String username = request.getParameter("registerUsername");
        String password = request.getParameter("registerPassword");

        

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Prepare SQL query
            try ( // Establish a connection
                    Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
                // Prepare SQL query
                String sql = "INSERT INTO organizers (org_name, org_organization, org_email, org_mobile, org_username, org_password) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, name);
                    statement.setString(2, organization);
                    statement.setString(3, email);
                    statement.setString(4, mobileNo);
                    statement.setString(5, username);
                    statement.setString(6, password);
                    
                    // Execute the query
                    int rowsInserted = statement.executeUpdate();
                    
                    // Check the result of the registration
                    if (rowsInserted > 0) {
                        // Set a response attribute indicating success
                        request.setAttribute("registrationSuccess", true);
                    } else {
                        // Set a response attribute indicating failure
                        request.setAttribute("registrationSuccess", false);
                    }
                    
                    // Forward to the same JSP page
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
                // Close the connection
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
    }



    

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Retrieve form parameters
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            // Prepare SQL query
            String sql = "SELECT * FROM organizers WHERE org_username = ? AND org_password = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                statement.setString(2, password);
                

                // Execute the query
                ResultSet resultSet = statement.executeQuery();
                

                if (resultSet.next()) {
                    // Successful login
                    request.setAttribute("loginSuccess", true);
                    request.setAttribute("loggedInUsername", username);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("organizer.jsp");
                    dispatcher.forward(request, response);
                } else {
                    // Invalid credentials
                    request.setAttribute("loginSuccess", false);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }

                
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions (e.g., log or display an error message)
            e.printStackTrace();
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Fetch profile details from the database (replace with your actual query)
            String loggedInUsername = (String) request.getAttribute("loggedInUsername");
            String sql = "SELECT org_name, org_organization, org_email, org_mobile FROM organizers WHERE org_username = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, loggedInUsername);
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                String name = result.getString("org_name");
                String organization = result.getString("org_organization");
                String email = result.getString("org_email");
                String mobileNo = result.getString("org_mobile");

                // Convert data to JSON and send it to the client
                String jsonData = String.format("{\"org_name\":\"%s\",\"org_organization\":\"%s\",\"org_email\":\"%s\",\"org_mobile\":\"%s\"}", name, organization, email, mobileNo);
                out.println(jsonData);
            } else {
                out.println("No data found");
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
