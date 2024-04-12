package ServersidePackages;

import com.mysql.cj.jdbc.Blob;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ParticipantServlet")
@MultipartConfig
public class ParticipantServlet extends HttpServlet {
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
            case "update_event-poster" : handlePosterUpdate(request, response);
            break;
            case "update_event" : handleEventUpdate(request, response);
            break;
            case "postevent" : handleEventPost(request, response);
            break;
            case "register" : handleRegistration(request, response);
            break;
            case "login" : handleLogin(request, response);
            break;
            case "loadOrg" : fetchParticipantData(request, response);
            break;
            case "all_events" : displayAllEvents(request, response);
            break;
            case "event_details" : displayEventsDetails(request, response);
            break;
            case "deleteEvent" : deleteAnEvent(request, response);
            break;
            case "updateParticipantProfile" : updateProfile(request, response);
            break;
            default : {
            }
        }
    }

    private void handleRegistration(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
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
                String sql = "INSERT INTO participants (p_name, p_email, p_mobile, p_username, p_password) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, name);
                    statement.setString(2, email);
                    statement.setString(3, mobileNo);
                    statement.setString(4, username);
                    statement.setString(5, password);
                    
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
        } catch (ClassNotFoundException | SQLException e) {e.printStackTrace();}
    }
    
    private void updateProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("p_name");
        String email = request.getParameter("p_email");
        String mobileNo = request.getParameter("p_mobile");
        String username = request.getParameter("p_user");

        

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Prepare SQL query
            try ( // Establish a connection
                    Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
                // Prepare SQL query
                String sql = "UPDATE participants SET p_name = ?, p_email = ?, p_mobile = ? WHERE p_username = ?";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, name);
                    statement.setString(2, email);
                    statement.setString(3, mobileNo);
                    statement.setString(4, username);
                    
                    // Execute the query
                    int rowsUpdated = statement.executeUpdate();
                    
                    // Check the result of the registration
                    if (rowsUpdated > 0) {
                        // Set a response attribute indicating success
                        request.setAttribute("updatationSuccess", true);
                    } else {
                        // Set a response attribute indicating failure
                        request.setAttribute("updatationSuccess", false);
                    }
                    
                    // Forward to the same JSP page
                    request.setAttribute("loggedInUsername", username);
                    request.getRequestDispatcher("autoredirectparticipant.jsp").forward(request, response);
                }
                // Close the connection
            }
        } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
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
            String sql = "SELECT * FROM participants WHERE p_username = ? AND p_password = ?";
            
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                statement.setString(2, password);
                

                // Execute the query
                ResultSet resultSet = statement.executeQuery();
                

                if (resultSet.next()) {
                    // Successful login
                    request.setAttribute("loggedInUsername", username);
                    request.setAttribute("loginSuccess", true);
                    
                    RequestDispatcher dispatcher = request.getRequestDispatcher("autoredirectparticipant.jsp");
                    dispatcher.forward(request, response);  
                    
                } else {
                    // Invalid credentials
                    request.setAttribute("loginSuccess", false);
                    request.getRequestDispatcher("participant_login.jsp").forward(request, response);
                }

                
            }
            
            
            
        }
    } catch (ClassNotFoundException | SQLException e) {
        // Handle exceptions (e.g., log or display an error message)
        e.printStackTrace();
    }
      
}
    
    

    private void fetchParticipantData(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Retrieve form parameters
    String username = request.getParameter("username");
    user = username;

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            // Prepare SQL query
            String sql = "SELECT * FROM participants WHERE p_username = ?";
            
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                

                // Execute the query
                ResultSet resultSet = statement.executeQuery();
                

                if (resultSet.next()) {
                    // Successful login
                    
                    String name = resultSet.getString("p_name");
                    String mobile = resultSet.getString("p_mobile");
                    String email = resultSet.getString("p_email");
                    
                    
                    request.setAttribute("loggedInUsername", username);
                    request.setAttribute("participantName", name);
                    request.setAttribute("participantEmail", email);
                    request.setAttribute("participantMobile", mobile);
                    
                    
            
            List<DataObject> dataList = new ArrayList<>();

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to the MySQL database
            Connection connection1 = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            
                        // Process the result set and store data in a list of DataObject
                        try ( // Execute a query to fetch multiple records
                                PreparedStatement statement2 = connection1.prepareStatement("SELECT event_id, event_name, event_date, poster FROM events WHERE org_username='"+user+"' order by event_id desc;");
                                ResultSet resultSet1 = statement2.executeQuery()) {
                            // Process the result set and store data in a list of DataObject
                            while (resultSet1.next()) {
                                int id = resultSet1.getInt(1);
                                String name1 = resultSet1.getString(2);
                                String date = resultSet1.getString(3);
                                Blob event_poster_blob = (Blob) resultSet1.getBlob(4);
                                DataObject data = new DataObject(id, name1, date,event_poster_blob);
                                dataList.add(data);
                            }
                            // Close the result set, statement, and connection
                        }
            statement.close();
            connection.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the data list in request attribute
        request.setAttribute("dataList", dataList);
                    
                    RequestDispatcher dispatcher = request.getRequestDispatcher("participantdashboard.jsp");
                    dispatcher.forward(request, response);  
                    
                } else {
                    // Invalid credentials
                    request.setAttribute("loginSuccess", false);
                    request.getRequestDispatcher("participant_login.jsp").forward(request, response);
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
        String eventorgName = request.getParameter("eventorganizerusername");
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
        String entry_fees = request.getParameter("entry_fees");
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
                                        "venue_address2, city, state, postal_code, country, entry_fees, " +
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
                    eventStatement.setString(16, entry_fees);
                    eventStatement.setString(17, contactFirstName);
                    eventStatement.setString(18, contactLastName);
                    eventStatement.setString(19, contactEmail);
                    eventStatement.setString(20, contactNumber);
                    eventStatement.setString(21, recorded);
                    eventStatement.setString(22, eventorgName);
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
                    request.setAttribute("loggedInUsername", eventorgName);
                    request.getRequestDispatcher("autoredirectpage.jsp?").forward(request, response);
                    
                    

                    
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions (e.g., log or display an error message)
            e.printStackTrace();
            request.setAttribute("eventPostSuccess", true);
            request.getRequestDispatcher("autoredirectpage.jsp").forward(request, response);
        }
        
        
        
    }
   
    
    private void handleEventUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        int eventID = Integer.parseInt(request.getParameter("eventID"));
        String eventorgName = request.getParameter("eventorganizerusername");
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
        String entry_fees = request.getParameter("entry_fees");
        String contactFirstName = request.getParameter("firstname");
        String contactLastName = request.getParameter("lastname");
        String contactEmail = request.getParameter("email");
        String contactNumber = request.getParameter("con_num");
        String recorded = request.getParameter("recorded");
        
        //String organizer_username = request.getParameter("loggedInUsername");

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
                // Prepare SQL query for event insertion
                String eventInsertSql = "UPDATE events SET event_name = ?, event_type = ?, event_date = ?, event_time = ?, set_time = ?, " +
                                        "special_attraction = ?, event_description = ?, promoter_name = ?, venue_name = ?, venue_address1 = ?, " +
                                        "venue_address2 = ?, city = ?, state = ?, postal_code = ?, country = ?, entry_fees = ?, " +
                                        "contact_first_name = ?, contact_last_name = ?, contact_email = ?, contact_number = ?, recorded = ?, org_username = ?" +
                                        "WHERE event_id = ?";
                
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
                    eventStatement.setString(16, entry_fees);
                    eventStatement.setString(17, contactFirstName);
                    eventStatement.setString(18, contactLastName);
                    eventStatement.setString(19, contactEmail);
                    eventStatement.setString(20, contactNumber);
                    eventStatement.setString(21, recorded);
                    eventStatement.setString(22, eventorgName);
                    eventStatement.setInt(23, eventID);
                   

                    // Execute the event insertion query
                    int rowsInsertedEvent = eventStatement.executeUpdate();

                    // Check the result of the event insertion
                    if (rowsInsertedEvent > 0) {
                        // Set a response attribute indicating success
                        request.setAttribute("eventUpdateSuccess", true);
                        
                        
                    } else {
                        // Set a response attribute indicating failure
                        request.setAttribute("eventUpdateSuccess", false);
                        
                    }
                    request.setAttribute("loggedInUsername", eventorgName);
                    request.getRequestDispatcher("autoredirectpage.jsp?").forward(request, response);
                    
                    

                    
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions (e.g., log or display an error message)
            e.printStackTrace();
            request.setAttribute("loggedInUsername", eventorgName);
            request.setAttribute("eventUpdateSuccess", false);
            request.getRequestDispatcher("autoredirectpage.jsp").forward(request, response);
        }
        
        
        
    }
   
    private void handlePosterUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String eventorgName = request.getParameter("eventorganizerusername");
        int eventID = Integer.parseInt(request.getParameter("eventID"));
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
                String eventInsertSql = "UPDATE events SET poster = ? WHERE event_id = ?";
                
                try (PreparedStatement eventStatement = connection.prepareStatement(eventInsertSql)) {
                    // Set parameters for the event insertion
                    if (filePart == null) {
                        eventStatement.setNull(1, java.sql.Types.BLOB);
                    } else {
                        eventStatement.setBlob(1, filePart.getInputStream());
                    }
                    eventStatement.setInt(2, eventID);
                   

                    // Execute the event insertion query
                    int rowsInsertedEvent = eventStatement.executeUpdate();

                    // Check the result of the event insertion
                    if (rowsInsertedEvent > 0) {
                        // Set a response attribute indicating success
                        request.setAttribute("posterUpdateSuccess", true);
                        
                        
                    } else {
                        // Set a response attribute indicating failure
                        request.setAttribute("posterUpdateSuccess", false);
                        
                    }
                    request.setAttribute("loggedInUsername", eventorgName);
                    request.getRequestDispatcher("autoredirectpage.jsp?").forward(request, response);
                    
                    

                    
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions (e.g., log or display an error message)
            e.printStackTrace();
            request.setAttribute("loggedInUsername", eventorgName);
            request.setAttribute("posterUpdateSuccess", false);
            request.getRequestDispatcher("autoredirectpage.jsp").forward(request, response);
        }
        
        
        
    }
   
    
        private void displayAllEvents(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
            String loggedInUsername = request.getParameter("loggedinuser");
            List<DataObject> dataList = new ArrayList<>();

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to the MySQL database
            Connection connection1 = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            
                        // Process the result set and store data in a list of DataObject
                        try ( // Execute a query to fetch multiple records
                                PreparedStatement statement2 = connection1.prepareStatement("SELECT event_id, event_name, event_date, poster FROM events order by event_id desc;");
                                ResultSet resultSet1 = statement2.executeQuery()) {
                            // Process the result set and store data in a list of DataObject
                            while (resultSet1.next()) {
                                int id = resultSet1.getInt(1);
                                String name1 = resultSet1.getString(2);
                                String date = resultSet1.getString(3);
                                Blob event_poster_blob = (Blob) resultSet1.getBlob(4);
                                DataObject data = new DataObject(id, name1, date,event_poster_blob);
                                dataList.add(data);
                            }
                            // Close the result set, statement, and connection
                        }
           
                     
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the data list in request attribute
        
 
        List<SportObject> sportList = new ArrayList<>();

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to the MySQL database
            Connection connection1 = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            
                        // Process the result set and store data in a list of DataObject
                        try ( // Execute a query to fetch multiple records
                                PreparedStatement statement2 = connection1.prepareStatement("SELECT event_id, event_name, event_date, poster FROM events where event_type = 'Sports' order by event_id desc;");
                                ResultSet resultSet1 = statement2.executeQuery()) {
                            // Process the result set and store data in a list of DataObject
                            while (resultSet1.next()) {
                                int id = resultSet1.getInt(1);
                                String name1 = resultSet1.getString(2);
                                String date = resultSet1.getString(3);
                                Blob event_poster_blob = (Blob) resultSet1.getBlob(4);
                                SportObject data = new SportObject(id, name1, date, event_poster_blob);
                                sportList.add(data);
                            }
                            // Close the result set, statement, and connection
                        }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        
                    
        List<MusicObject> musicList = new ArrayList<>();

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to the MySQL database
            Connection connection1 = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            
                        // Process the result set and store data in a list of DataObject
                        try ( // Execute a query to fetch multiple records
                                PreparedStatement statement2 = connection1.prepareStatement("SELECT event_id, event_name, event_date, poster FROM events where event_type = 'Musical / DJ' order by event_id desc;");
                                ResultSet resultSet1 = statement2.executeQuery()) {
                            // Process the result set and store data in a list of DataObject
                            while (resultSet1.next()) {
                                int id = resultSet1.getInt(1);
                                String name1 = resultSet1.getString(2);
                                String date = resultSet1.getString(3);
                                Blob event_poster_blob = (Blob) resultSet1.getBlob(4);
                                MusicObject data = new MusicObject(id, name1, date, event_poster_blob);
                                musicList.add(data);
                            }
                            // Close the result set, statement, and connection
                        }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        List<TrekkObject> trekkList = new ArrayList<>();

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to the MySQL database
            Connection connection1 = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            
                        // Process the result set and store data in a list of DataObject
                        try ( // Execute a query to fetch multiple records
                                PreparedStatement statement2 = connection1.prepareStatement("SELECT event_id, event_name, event_date, poster FROM events where event_type = 'Trekking / Adventures' order by event_id desc;");
                                ResultSet resultSet1 = statement2.executeQuery()) {
                            // Process the result set and store data in a list of DataObject
                            while (resultSet1.next()) {
                                int id = resultSet1.getInt(1);
                                String name1 = resultSet1.getString(2);
                                String date = resultSet1.getString(3);
                                Blob event_poster_blob = (Blob) resultSet1.getBlob(4);
                                TrekkObject data = new TrekkObject(id, name1, date, event_poster_blob);
                                trekkList.add(data);
                            }
                            // Close the result set, statement, and connection
                        }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<CulturalObject> culturalList = new ArrayList<>();

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to the MySQL database
            Connection connection1 = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            
                        // Process the result set and store data in a list of DataObject
                        try ( // Execute a query to fetch multiple records
                                PreparedStatement statement2 = connection1.prepareStatement("SELECT event_id, event_name, event_date, poster FROM events where event_type = 'Cultural' order by event_id desc;");
                                ResultSet resultSet1 = statement2.executeQuery()) {
                            // Process the result set and store data in a list of DataObject
                            while (resultSet1.next()) {
                                int id = resultSet1.getInt(1);
                                String name1 = resultSet1.getString(2);
                                String date = resultSet1.getString(3);
                                Blob event_poster_blob = (Blob) resultSet1.getBlob(4);
                                CulturalObject data = new CulturalObject(id, name1, date, event_poster_blob);
                                culturalList.add(data);
                            }
                            // Close the result set, statement, and connection
                        }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
               
        
        List<BusinessObject> businessList = new ArrayList<>();

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to the MySQL database
            Connection connection1 = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            
                        // Process the result set and store data in a list of DataObject
                        try ( // Execute a query to fetch multiple records
                                PreparedStatement statement2 = connection1.prepareStatement("SELECT event_id, event_name, event_date, poster FROM events where event_type = 'Business' order by event_id desc;");
                                ResultSet resultSet1 = statement2.executeQuery()) {
                            // Process the result set and store data in a list of DataObject
                            while (resultSet1.next()) {
                                int id = resultSet1.getInt(1);
                                String name1 = resultSet1.getString(2);
                                String date = resultSet1.getString(3);
                                Blob event_poster_blob = (Blob) resultSet1.getBlob(4);
                                BusinessObject data = new BusinessObject(id, name1, date, event_poster_blob);
                                businessList.add(data);
                            }
                            // Close the result set, statement, and connection
                        }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        List<EduObject> eduList = new ArrayList<>();

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to the MySQL database
            Connection connection1 = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            
                        // Process the result set and store data in a list of DataObject
                        try ( // Execute a query to fetch multiple records
                                PreparedStatement statement2 = connection1.prepareStatement("SELECT event_id, event_name, event_date, poster FROM events where event_type = 'Educational' order by event_id desc;");
                                ResultSet resultSet1 = statement2.executeQuery()) {
                            // Process the result set and store data in a list of DataObject
                            while (resultSet1.next()) {
                                int id = resultSet1.getInt(1);
                                String name1 = resultSet1.getString(2);
                                String date = resultSet1.getString(3);
                                Blob event_poster_blob = (Blob) resultSet1.getBlob(4);
                                EduObject data = new EduObject(id, name1, date, event_poster_blob);
                                eduList.add(data);
                            }
                            // Close the result set, statement, and connection
                        }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        List<PromosObject> promoList = new ArrayList<>();

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to the MySQL database
            Connection connection1 = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            
            
                        // Process the result set and store data in a list of DataObject
                        try ( // Execute a query to fetch multiple records
                                PreparedStatement statement2 = connection1.prepareStatement("SELECT event_id, event_name, event_date, poster FROM events where event_type = 'Promos / Expos' order by event_id desc;");
                                ResultSet resultSet1 = statement2.executeQuery()) {
                            // Process the result set and store data in a list of DataObject
                            while (resultSet1.next()) {
                                int id = resultSet1.getInt(1);
                                String name1 = resultSet1.getString(2);
                                String date = resultSet1.getString(3);
                                Blob event_poster_blob = (Blob) resultSet1.getBlob(4);
                                PromosObject data = new PromosObject(id, name1, date, event_poster_blob);
                                promoList.add(data);
                            }
                            // Close the result set, statement, and connection
                        }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
           // Set the data list in request attribute
           request.setAttribute("dataList", dataList);
           request.setAttribute("sportList", sportList); 
           request.setAttribute("musicList", musicList); 
           request.setAttribute("trekkList", trekkList); 
           request.setAttribute("culturalList", culturalList); 
           request.setAttribute("businessList", businessList); 
           request.setAttribute("eduList", eduList); 
           request.setAttribute("promoList", promoList); 
           request.setAttribute("loggedInUsername", loggedInUsername); 
           RequestDispatcher dispatcher = request.getRequestDispatcher("events.jsp");
                    dispatcher.forward(request, response);      
    
    
    
    
    
    }
        
        
        private void displayEventsDetails(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
  // Retrieve form parameters
    String e_id = request.getParameter("event-id");
    String viewer = request.getParameter("viewer");

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            // Prepare SQL query
            String sql = "SELECT * FROM events WHERE event_id = ?";
            
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, e_id);
                

                // Execute the query
                ResultSet resultSet = statement.executeQuery();
                

                if (resultSet.next()) {
                    // Successful login
                    
                    String e_name = resultSet.getString(2);
        String e_type = resultSet.getString(3);
        String e_date = resultSet.getString(4);
        String e_time = resultSet.getString(5);
        String e_duration = resultSet.getString(6);
        String e_specialattraction = resultSet.getString(7);
        String e_description = resultSet.getString(8);
        String e_promoter = resultSet.getString(9);
        String e_venue = resultSet.getString(10);
        String e_addline1 = resultSet.getString(11);
        String e_addline2 = resultSet.getString(12);
        String e_city = resultSet.getString(13);
        String e_state = resultSet.getString(14);
        String e_post = resultSet.getString(15);
        String e_country = resultSet.getString(16);
        String e_tickets = resultSet.getString(17);
        String e_contactpersonfirst = resultSet.getString(18);
        String e_conatactpersonlast = resultSet.getString(19);
        String e_contactemail = resultSet.getString(20);
        String e_contactnumber = resultSet.getString(21);
        String e_isrecord = resultSet.getString(22);
        String e_organizer = resultSet.getString(23);
        Blob e_poster = (Blob) resultSet.getBlob(24);           
                    request.setAttribute("e_name", e_name);
        request.setAttribute("e_type", e_type);
        request.setAttribute("e_date", e_date);
        request.setAttribute("e_time", e_time);
        request.setAttribute("e_duration", e_duration);
        request.setAttribute("e_specialattraction", e_specialattraction);
        request.setAttribute("e_description", e_description);
        request.setAttribute("e_promoter", e_promoter);
        request.setAttribute("e_venue", e_venue);
        request.setAttribute("e_addline1", e_addline1);
        request.setAttribute("e_addline2", e_addline2);
        request.setAttribute("e_city", e_city);
        request.setAttribute("e_state", e_state);
        request.setAttribute("e_post", e_post);
        request.setAttribute("e_country", e_country);
        request.setAttribute("e_tickets", e_tickets);
        request.setAttribute("e_contactpersonfirst", e_contactpersonfirst);
        request.setAttribute("e_conatactpersonlast", e_conatactpersonlast);
        request.setAttribute("e_contactemail", e_contactemail);
        request.setAttribute("e_contactnumber", e_contactnumber);
        request.setAttribute("e_isrecord", e_isrecord);
        request.setAttribute("e_organizer", e_organizer);
        request.setAttribute("e_poster", e_poster);                  
        
                    if("organizer".equals(viewer)){
                        RequestDispatcher dispatcher = request.getRequestDispatcher("viewevent.jsp");
                        dispatcher.forward(request, response);
                    }
                    else{
                        RequestDispatcher dispatcher = request.getRequestDispatcher("eventdetails.jsp");
                        dispatcher.forward(request, response);  
                    }
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
        
private void deleteAnEvent(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Extract event ID from request parameter
    int eID = Integer.parseInt(request.getParameter("eventID"));
    String username = request.getParameter("eventOrg");

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            // Prepare SQL query
            String sql = "DELETE FROM events WHERE event_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                // Set event ID parameter
                statement.setInt(1, eID);

                // Execute query
                int rowsDeleted = statement.executeUpdate();

                // Check result of deletion
                if (rowsDeleted > 0) {
                    // Set success attribute
                    request.setAttribute("deletionSuccess", true);
                } else {
                    // Set failure attribute
                    request.setAttribute("deletionSuccess", false);
                }

                // Forward to the same JSP page
                request.setAttribute("loggedInUsername", username);
                request.getRequestDispatcher("autoredirectpage.jsp").forward(request, response);
            }
        }
    } catch (ClassNotFoundException | SQLException | NumberFormatException e) {
        // Handle exceptions
        e.printStackTrace();
    }
}

    
}
