package ServersidePackages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String request_id = request.getParameter("request_id");

        if (null != request_id) switch (request_id) {
            case "sendMessage" : handleMessageStoring(request, response);
            break;
            default : {
            }
        }
    }

    private void handleMessageStoring(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String senderName = request.getParameter("sender_name");
        String senderEmail = request.getParameter("sender_email");
        String message = request.getParameter("message");
        LocalDateTime dateTime = LocalDateTime.now(); // Current date and time

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/festavista_db";
        String username = "root";
        String password = "root123";

        // SQL query to insert data into the database
        String sql = "INSERT INTO messages (sender_name, sender_email, message, date_time) VALUES (?, ?, ?, ?)";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish database connection
            Connection conn = DriverManager.getConnection(url, username, password);
            
            // Create a statement for the SQL query
            PreparedStatement statement = conn.prepareStatement(sql);

            // Set parameters for the query
            statement.setString(1, senderName);
            statement.setString(2, senderEmail);
            statement.setString(3, message);
            statement.setObject(4, dateTime);

            // Execute the query
            int rowsInserted = statement.executeUpdate();

            // Forward the request to the JSP page
            if (rowsInserted > 0) {
                // Data inserted successfully
                request.setAttribute("messageSendingSuccess", true);
            } else {
                // Data insertion failed
                request.setAttribute("messageSendingSuccess", false);
            }
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            // Handle any database errors
            e.printStackTrace();
            request.setAttribute("messageSendingSuccess", false);
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        }
    }
}
