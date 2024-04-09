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

@WebServlet("/Servlet")
@MultipartConfig
public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    // JDBC variables
        String jdbcURL = "jdbc:mysql://localhost:3306/festavista_db";
        String dbUser = "root";
        String dbPassword = "root123";
        String user;
        Boolean eventPostSuccess = null;
        Boolean eventDeleteSuccess = null;

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
            case "all_events" : displayAllEvents(request, response);
            break;
            case "event_details" : displayEventsDetails(request, response);
            break;
            case "deleteEvent" : deleteAnEvent(request, response);
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
        } catch (ClassNotFoundException | SQLException e) {}
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
                    
                    
                    request.setAttribute("loggedInUsername", username);
                    request.setAttribute("loggedInPassword", password);
                    request.setAttribute("organizerName", name);
                    request.setAttribute("organizerEmail", email);
                    request.setAttribute("organizerOrg", org);
                    request.setAttribute("organizerMobile", mobile);
                    
                    if(null==eventPostSuccess){
                       request.setAttribute("loginSuccess", true);
                    }
                    else if(eventPostSuccess==true){
                       request.setAttribute("loginSuccess", null);
                       request.setAttribute("eventPostSuccess", true);
                    }
                    else if(eventPostSuccess==false){
                       request.setAttribute("loginSuccess", null);
                       request.setAttribute("eventPostSuccess", false);
                    }
                    
                    if(null==eventDeleteSuccess){
                       request.setAttribute("loginSuccess", true);
                    }
                    else if(eventDeleteSuccess==true){
                       request.setAttribute("loginSuccess", null);
                       request.setAttribute("deletionSuccess", true);
                    }
                    else if(eventDeleteSuccess==false){
                       request.setAttribute("loginSuccess", null);
                       request.setAttribute("deletionSuccess", false);
                    }
            
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
                    
                    RequestDispatcher dispatcher = request.getRequestDispatcher("organizerdashboard.jsp");
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
        String eventorgName = request.getParameter("eventorganizerusername");
        String eventorgPass = request.getParameter("eventorganizerpassword");
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
                        eventPostSuccess = true;
                        
                        
                    } else {
                        // Set a response attribute indicating failure
                        request.setAttribute("eventPostSuccess", false);
                        eventPostSuccess = false;
                    }
                    request.getRequestDispatcher("autoredirectpage.jsp?username="+eventorgName+"&password="+eventorgPass).forward(request, response);
                    
                    

                    
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions (e.g., log or display an error message)
            e.printStackTrace();
            eventPostSuccess = false;
            request.getRequestDispatcher("autoredirectpage.jsp?username="+eventorgName+"&password="+eventorgPass).forward(request, response);
        }
        
        
        
    }
   
    
        private void displayAllEvents(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
            
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
           RequestDispatcher dispatcher = request.getRequestDispatcher("allevents.jsp");
                    dispatcher.forward(request, response);      
    
    
    
    
    
    }
        
        
        private void displayEventsDetails(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
  // Retrieve form parameters
    String e_id = request.getParameter("event-id");

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
        int e_tickets = resultSet.getInt(17);
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
        
                    
                    RequestDispatcher dispatcher = request.getRequestDispatcher("eventdetails.jsp");
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
        
private void deleteAnEvent(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Extract event ID from request parameter
    int eID = Integer.parseInt(request.getParameter("eventID"));
    String username = request.getParameter("eventOrg");
    String password = request.getParameter("eventOrgPass");

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
                    eventDeleteSuccess = true;
                } else {
                    // Set failure attribute
                    request.setAttribute("deletionSuccess", false);
                    eventDeleteSuccess = false;
                }

                // Forward to the same JSP page
                request.getRequestDispatcher("autoredirectpage.jsp?username="+username+"&password="+password).forward(request, response);
            }
        }
    } catch (ClassNotFoundException | SQLException | NumberFormatException e) {
        // Handle exceptions
        e.printStackTrace();
        eventDeleteSuccess = false;
    }
}

    
}
