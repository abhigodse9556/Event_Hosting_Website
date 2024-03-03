package ServersidePackages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Servlet")
@MultipartConfig
public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    // JDBC variables
        String jdbcURL = "jdbc:mysql://localhost:3306/festavista_db";
        String dbUser = "root";
        String dbPassword = "root123";
        String user;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");

        if (null != id) switch (id) {
            case "postevent" : handleEventPost(request, response);
            break;
            case "register" : handleRegistration(request, response);
            break;
            case "login" : handleLogin(request, response);
            break;
            default : {
            }
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
    user = username;

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
                    
                    String name = resultSet.getString("org_name");
                    String org = resultSet.getString("org_organization");
                    String mobile = resultSet.getString("org_mobile");
                    String email = resultSet.getString("org_email");
                    
                    request.setAttribute("loginSuccess", true);
                    request.setAttribute("loggedInUsername", username);
                    request.setAttribute("organizerName", name);
                    request.setAttribute("organizerEmail", email);
                    request.setAttribute("organizerOrg", org);
                    request.setAttribute("organizerMobile", mobile);
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
    
    private void handleEventPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String eventName = request.getParameter("eventname");
        String eventType = request.getParameter("event_type");
        String eventDate = request.getParameter("bdate");
        String eventTime = request.getParameter("event_time");
        String setTime = request.getParameter("duration");
        String specialAttraction = request.getParameter("specialAttraction");
        String eventDescription = request.getParameter("description");
        String promoterName = request.getParameter("promoter");
        String venueName = request.getParameter("venue_name");
        String venueAddress1 = request.getParameter("add1");
        String venueAddress2 = request.getParameter("add2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postalCode = request.getParameter("pin");
        String country = request.getParameter("country");
        String availableTickets = request.getParameter("ticket_count");
        String contactFirstName = request.getParameter("firstname");
        String contactLastName = request.getParameter("lastname");
        String contactEmail = request.getParameter("email");
        String contactNumber = request.getParameter("con_num");
        String recorded = request.getParameter("recorded");
        Part filePart = null;
        if (request.getContentType() != null && request.getContentType().toLowerCase().startsWith("multipart/")) {
            filePart = request.getPart("poster");
        }
        //String organizer_username = request.getParameter("loggedInUsername");

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
                // Prepare SQL query for event insertion
                String eventInsertSql = "INSERT INTO events (event_name, event_type, event_date, event_time, set_time, " +
                                        "special_attraction, event_description, promoter_name, venue_name, venue_address1, " +
                                        "venue_address2, city, state, postal_code, country, available_tickets, " +
                                        "contact_first_name, contact_last_name, contact_email, contact_number, recorded, org_username, poster) " +
                                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                
                try (PreparedStatement eventStatement = connection.prepareStatement(eventInsertSql)) {
                    // Set parameters for the event insertion
                    eventStatement.setString(1, eventName);
                    eventStatement.setString(2, eventType);
                    eventStatement.setString(3, eventDate);
                    eventStatement.setString(4, eventTime);
                    eventStatement.setString(5, setTime);
                    eventStatement.setString(6, specialAttraction);
                    eventStatement.setString(7, eventDescription);
                    eventStatement.setString(8, promoterName);
                    eventStatement.setString(9, venueName);
                    eventStatement.setString(10, venueAddress1);
                    eventStatement.setString(11, venueAddress2);
                    eventStatement.setString(12, city);
                    eventStatement.setString(13, state);
                    eventStatement.setString(14, postalCode);
                    eventStatement.setString(15, country);
                    eventStatement.setString(16, availableTickets);
                    eventStatement.setString(17, contactFirstName);
                    eventStatement.setString(18, contactLastName);
                    eventStatement.setString(19, contactEmail);
                    eventStatement.setString(20, contactNumber);
                    eventStatement.setString(21, recorded);
                    eventStatement.setString(22, user);
                    if (filePart == null) {
                        eventStatement.setNull(23, java.sql.Types.BLOB);
                    } else {
                        eventStatement.setBlob(23, filePart.getInputStream());
                    }

                    // Execute the event insertion query
                    int rowsInsertedEvent = eventStatement.executeUpdate();

                    // Check the result of the event insertion
                    if (rowsInsertedEvent > 0) {
                        // Set a response attribute indicating success
                        request.setAttribute("eventPostSuccess", true);
                    } else {
                        // Set a response attribute indicating failure
                        request.setAttribute("eventPostSuccess", false);
                    }

                    // Forward to the same JSP page or a confirmation page
                    //request.getRequestDispatcher("Servlet?id=login").forward(request, response);
                    
                    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection
        try{
            // Prepare SQL query
            String sql = "SELECT * FROM organizers WHERE org_username = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, user);
                

                // Execute the query
                ResultSet resultSet = statement.executeQuery();
                

                if (resultSet.next()) {
                    // Successful login
                    
                    String name = resultSet.getString("org_name");
                    String org = resultSet.getString("org_organization");
                    String mobile = resultSet.getString("org_mobile");
                    String email = resultSet.getString("org_email");
                    
                    request.setAttribute("loginSuccess", null);
                    request.setAttribute("loggedInUsername", user);
                    request.setAttribute("organizerName", name);
                    request.setAttribute("organizerEmail", email);
                    request.setAttribute("organizerOrg", org);
                    request.setAttribute("organizerMobile", mobile);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("organizer.jsp");
                    dispatcher.forward(request, response);
                    
                   
                    
                } else {
                    // Invalid credentials
                    request.setAttribute("loginSuccess", false);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }

                
            }
        }catch (SQLException e) {
        // Handle exceptions (e.g., log or display an error message)
        e.printStackTrace();
    }
    } catch (ClassNotFoundException e) {
        // Handle exceptions (e.g., log or display an error message)
        e.printStackTrace();
    }
                    
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions (e.g., log or display an error message)
            e.printStackTrace();
        }
    }
   
}
