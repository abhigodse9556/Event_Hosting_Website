/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.85
 * Generated at: 2024-04-08 21:02:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Base64;
import ServersidePackages.DataObject;
import ServersidePackages.DataObject;
import java.util.List;
import com.mysql.cj.jdbc.Blob;
import java.io.*;
import java.sql.*;

public final class organizerdashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.Base64");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.mysql.cj.jdbc.Blob");
    _jspx_imports_classes.add("ServersidePackages.DataObject");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 String loggedInUsername = (String) request.getAttribute("loggedInUsername"); 
      out.write('\n');
 String loggedInPassword = (String) request.getAttribute("loggedInPassword"); 
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("     <head>\n");
      out.write("      <meta charset=\"UTF-8\">\n");
      out.write("      <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("\n");
      out.write("      <!--=============== FAVICON ===============-->\n");
      out.write("      <link rel=\"shortcut icon\" href=\"assets/img/favicon.png\" type=\"image/x-icon\">\n");
      out.write("\n");
      out.write("      <!--=============== REMIXICONS ===============-->\n");
      out.write("      <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.4.0/remixicon.css\" crossorigin=\"\">\n");
      out.write("      \n");
      out.write("      <!--=============== CSS ===============-->\n");
      out.write("      <link rel=\"stylesheet\" href=\"assets/css/styles.css\">\n");
      out.write("      <link rel=\"stylesheet\" href=\"assets/css/organizerpage.css\">\n");
      out.write("\n");
      out.write("      <title>Event Organizer Dashboard</title>\n");
      out.write("      <style>\n");
      out.write("        /* CSS to fix the size of the image */\n");
      out.write("        .poster-image {\n");
      out.write("            width: 200px; /* Adjust width as needed */\n");
      out.write("            height: 200px; /* Auto adjust height to maintain aspect ratio */\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        td{\n");
      out.write("            padding: 10px;\n");
      out.write("            background-color: #9341411c;\n");
      out.write("    border-radius: 15px;\n");
      out.write("    box-shadow: 0 4px 10px rgba(0, 0, 0, 5);\n");
      out.write("    color: #cb1414;\n");
      out.write("    cursor: pointer;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        body {\n");
      out.write("            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            background: linear-gradient(to right bottom, #1d4350, #a43931);\n");
      out.write("            color: #fff;\n");
      out.write("            display: block;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        \n");
      out.write("        .org_container {\n");
      out.write("            max-width: 1200px;\n");
      out.write("            margin: 100px auto;\n");
      out.write("            padding: 20px;\n");
      out.write("            display: grid;\n");
      out.write("            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));\n");
      out.write("            gap: 20px;\n");
      out.write("        }\n");
      out.write("        .section {\n");
      out.write("            border-radius: 20px;\n");
      out.write("            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);\n");
      out.write("            overflow: hidden;\n");
      out.write("        }\n");
      out.write("        h2 {\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 20px;\n");
      out.write("            background-color: rgba(0, 0, 0, 0.6);\n");
      out.write("            text-align: center;\n");
      out.write("            font-weight: bold;\n");
      out.write("            font-size: 24px;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        \n");
      out.write("            \n");
      out.write("            form{\n");
      out.write("                margin-top: 20px;\n");
      out.write("                box-shadow: 0 0 0px 0 #ffffff;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        /* Profile Section */\n");
      out.write("        .profile {\n");
      out.write("            background-color: rgba(0, 0, 0, 0.8);\n");
      out.write("            display: flex;\n");
      out.write("            flex-direction: column;\n");
      out.write("            align-items: center;\n");
      out.write("            justify-content: center;\n");
      out.write("            padding: 40px;\n");
      out.write("            height: 700px;\n");
      out.write("            \n");
      out.write("            h2{\n");
      out.write("                background-color: rgba(255, 255, 255, 0.1);\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        .profile p {\n");
      out.write("            margin: 10px 0;\n");
      out.write("            font-size: 18px;\n");
      out.write("        }\n");
      out.write("        .profile button {\n");
      out.write("            background-color: #a82877;\n");
      out.write("            color: #fff;\n");
      out.write("            border: none;\n");
      out.write("            padding: 10px 20px;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            transition: background-color 0.3s;\n");
      out.write("            font-size: 16px;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("        .profile button:hover {\n");
      out.write("            background-color: black;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .edit{\n");
      out.write("            display: none;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("            .cancel-button{\n");
      out.write("                background-color: #a82877;\n");
      out.write("                color: #fff;\n");
      out.write("                padding-top: 5px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                padding-bottom: 7px;\n");
      out.write("                padding-left: 15px;\n");
      out.write("                padding-right: 15px;\n");
      out.write("                margin-left: 5px;\n");
      out.write("            }\n");
      out.write("            .cancel-button:hover{\n");
      out.write("                background-color: black;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("\n");
      out.write("        /* Events Section */\n");
      out.write("        .events {\n");
      out.write("            background-color: rgba(0, 0, 0, 0.8);\n");
      out.write("            display: grid;\n");
      out.write("            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));\n");
      out.write("            gap: 20px;\n");
      out.write("            padding: 20px;\n");
      out.write("            height: 700px;\n");
      out.write("            overflow-y: scroll;\n");
      out.write("            scrollbar-width: none;\n");
      out.write("        }\n");
      out.write("        .event {\n");
      out.write("            background-color: rgba(255, 255, 255, 0.1);\n");
      out.write("            padding: 20px;\n");
      out.write("            border-radius: 10px;\n");
      out.write("            transition: transform 0.3s;\n");
      out.write("            cursor: pointer;\n");
      out.write("            position: relative;\n");
      out.write("        }\n");
      out.write("        .event:hover {\n");
      out.write("            transform: translateY(-5px);\n");
      out.write("        }\n");
      out.write("        .event h3 {\n");
      out.write("            margin: 0 0 10px;\n");
      out.write("            font-size: 20px;\n");
      out.write("        }\n");
      out.write("        .event p {\n");
      out.write("            margin: 5px 0;\n");
      out.write("            font-size: 16px;\n");
      out.write("        }\n");
      out.write("        .event-info {\n");
      out.write("            color: rgba(255, 255, 255, 0.7);\n");
      out.write("        }\n");
      out.write("        .event-actions {\n");
      out.write("            text-align: right;\n");
      out.write("            position: absolute;\n");
      out.write("            top: 10px;\n");
      out.write("            right: 10px;\n");
      out.write("            opacity: 0;\n");
      out.write("            transition: opacity 0.3s;\n");
      out.write("        }\n");
      out.write("        .event:hover .event-actions {\n");
      out.write("            opacity: 1;\n");
      out.write("        }\n");
      out.write("        .event-actions button {\n");
      out.write("            background-color: rgba(0, 0, 0, 0.5);\n");
      out.write("            color: #fff;\n");
      out.write("            border: none;\n");
      out.write("            padding: 5px 10px;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            transition: background-color 0.3s;\n");
      out.write("            font-size: 14px;\n");
      out.write("        }\n");
      out.write("        .event-actions button:hover {\n");
      out.write("            background-color: rgba(0, 0, 0, 0.7);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("    </style>\n");
      out.write("   </head>\n");
      out.write("   \n");
      out.write("   <!--==================== HEADER ====================-->\n");
      out.write("      <header class=\"header\" id=\"header\">\n");
      out.write("        <nav class=\"nav container\">\n");
      out.write("            <a href=\"#\" class=\"nav__logo\">\n");
      out.write("                <img src=\"assets/img/logo.svg\" alt=\"logo\">\n");
      out.write("            </a>\n");
      out.write("\n");
      out.write("            <div class=\"nav__menu\" id=\"nav-menu\">\n");
      out.write("                <ul class=\"nav__list\">\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a href=\"index.jsp\" class=\"nav__link\">Home</a>\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a href=\"#\" class=\"nav__link\">Events</a>\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a href=\"about.jsp\" class=\"nav__link\">About</a>\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a href=\"contact.jsp\" class=\"nav__link\">Contact</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("                <div class=\"nav__buttons\">\n");
      out.write("                    <a href=\"login.jsp\" class=\"nav__button-link\">Update Profile</a>\n");
      out.write("                    <form action=\"postevent.jsp\" method=\"post\">\n");
      out.write("    <input type=\"hidden\" name=\"loggedinuser\" value=\"");
      out.print( loggedInUsername );
      out.write("\">\n");
      out.write("    <input type=\"hidden\" name=\"loggedinpass\" value=\"");
      out.print( loggedInPassword );
      out.write("\">\n");
      out.write("    <button type=\"submit\" class=\"nav__link\">Post an Event</button>\n");
      out.write("</form>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <!--close button-->\n");
      out.write("                <div class=\"nav__close\" id=\"nav-close\">\n");
      out.write("                    <i class=\"ri-close-line\"></i>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!--toggle button-->\n");
      out.write("            <div class=\"nav__toggle\" id=\"nav-toggle\">\n");
      out.write("                <i class=\"ri-menu-line\"></i>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("         \n");
      out.write("      </header>\n");
      out.write("    \n");
      out.write("   <div class=\"org_container\">\n");
      out.write("        <!-- Profile Section -->\n");
      out.write("        <div id=\"profile\" class=\"section profile\">\n");
      out.write("            <h3>Welcome, ");
      out.print( loggedInUsername );
      out.write("!</h3><br>\n");
      out.write("            ");

        // Display organizer details if available in request attributes
        String organizerName = (String) request.getAttribute("organizerName");
        String organizerOrg = (String) request.getAttribute("organizerOrg");
        String organizerEmail = (String) request.getAttribute("organizerEmail");
        String organizerMobile = (String) request.getAttribute("organizerMobile");

        if (organizerName != null && organizerEmail != null) {
    
      out.write("\n");
      out.write("            <h2>Organizer Profile</h2>\n");
      out.write("            <p><strong>Name:</strong> ");
      out.print( organizerName);
      out.write("</p>\n");
      out.write("            <p><strong>Organization:</strong> ");
      out.print( organizerOrg);
      out.write("</p>\n");
      out.write("            <p><strong>Email:</strong> ");
      out.print( organizerEmail);
      out.write("</p>\n");
      out.write("            <p><strong>Mobile:</strong> ");
      out.print( organizerMobile);
      out.write("</p>\n");
      out.write("            ");

        }
    
      out.write("\n");
      out.write("    <button onclick=\"openEditProfile()\">Edit Profile</button>\n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("            <div id=\"edit_profile\" class=\"section profile edit\">\n");
      out.write("                <h2>Edit Profile</h2>\n");
      out.write("                <form >\n");
      out.write("                    <p><strong>Username:</strong> <input type=\"text\" name=\"org_user\" placeholder=\"");
      out.print( loggedInUsername);
      out.write("\" readonly></p>\n");
      out.write("                    <p><strong>Name:</strong> <input type=\"text\" name=\"org_name\" placeholder=\"");
      out.print( organizerName);
      out.write("\"></p>\n");
      out.write("                    <p><strong>Organization:</strong> <input type=\"text\" name=\"org_organization\" placeholder=\"");
      out.print( organizerOrg);
      out.write("\"></p>\n");
      out.write("                    <p><strong>Email:</strong> <input type=\"text\" name=\"org_email\" placeholder=\"");
      out.print( organizerEmail);
      out.write("\"></p>\n");
      out.write("                    <p><strong>Mobile:</strong> <input type=\"text\" name=\"org_mobile\" placeholder=\"");
      out.print( organizerMobile);
      out.write("\"></p>\n");
      out.write("                    <button type=\"submit\">Save Changes</button>\n");
      out.write("                    <a class=\"cancel-button\" href=\"#\" onclick=\"cancelEditProfile()\">Cancel</a>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        <!-- Events Section -->\n");
      out.write("        <div class=\"section events\">\n");
      out.write("            <h2>Event History</h2>\n");
      out.write("            ");

            List<DataObject> dataList = (List<DataObject>) request.getAttribute("dataList");
            for (DataObject data : dataList) {
        
      out.write("\n");
      out.write("            <div class=\"event\">\n");
      out.write("                \n");
      out.write("                <h3>");
      out.print( data.getName() );
      out.write("</h3>\n");
      out.write("                <p class=\"event-info\"><strong>Date:</strong> ");
      out.print( data.getDate() );
      out.write("</p>\n");
      out.write("                <p class=\"event-info\"><strong>ID:</strong> ");
      out.print( data.getId() );
      out.write("</p>\n");
      out.write("                 <form id=\"deleteEvent_");
      out.print( data.getId() );
      out.write("\" action=\"Servlet?id=deleteEvent\" method=\"post\" style=\"display:none;\">\n");
      out.write("                    <input type=\"hidden\" name=\"eventID\" value=\"");
      out.print( data.getId() );
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"eventOrg\" value=\"");
      out.print( loggedInUsername );
      out.write("\">\n");
      out.write("                    <input type=\"hidden\" name=\"eventOrgPass\" value=\"");
      out.print( loggedInPassword );
      out.write("\">\n");
      out.write("                    <button id=\"deleteButton_");
      out.print( data.getId() );
      out.write("\" type=\"submit\">Delete</button>\n");
      out.write("                </form>\n");
      out.write("                <div class=\"event-actions\">\n");
      out.write("                    <button>Edit</button>\n");
      out.write("                    <button onclick=\"showConfirmation(");
      out.print( data.getId() );
      out.write(")\">Delete</button>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("                ");

            }
        
      out.write("\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("   \n");
      out.write("</body>\n");
      out.write("\n");
 Boolean loginSuccess = (Boolean) request.getAttribute("loginSuccess"); 
      out.write('\n');
 Boolean eventPostSuccess = (Boolean) request.getAttribute("eventPostSuccess"); 
      out.write('\n');
 Boolean deletionSuccess = (Boolean) request.getAttribute("eventPostSuccess"); 
      out.write('\n');
 if (loginSuccess != null) { 
      out.write("\n");
      out.write("    <script>\n");
      out.write("        var message = ");
      out.print( loginSuccess ? "'Login successful!'" : "'Error in login. Please try again.'" );
      out.write(";\n");
      out.write("        alert(message);\n");
      out.write("    </script>\n");
 } 
      out.write('\n');
      out.write('\n');
 if (eventPostSuccess != null) { 
      out.write("\n");
      out.write("    <script>\n");
      out.write("        var message = ");
      out.print( eventPostSuccess ? "'Event posted successfully!'" : "'Error in posting. Please try again.'" );
      out.write(";\n");
      out.write("        alert(message);\n");
      out.write("    </script>\n");
 } 
      out.write('\n');
 if (deletionSuccess != null) { 
      out.write("\n");
      out.write("    <script>\n");
      out.write("        var message = ");
      out.print( deletionSuccess ? "'Event deleted successfully!'" : "'Error in deleting. Please try again.'" );
      out.write(";\n");
      out.write("        alert(message);\n");
      out.write("    </script>\n");
 } 
      out.write("\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    function openEditProfile(){\n");
      out.write("        document.getElementById(\"edit_profile\").style.display = \"flex\";\n");
      out.write("        document.getElementById(\"profile\").style.display = \"none\";\n");
      out.write("    }\n");
      out.write("    function cancelEditProfile(){\n");
      out.write("        document.getElementById(\"edit_profile\").style.display = \"none\";\n");
      out.write("        document.getElementById(\"profile\").style.display = \"flex\";\n");
      out.write("    }\n");
      out.write("    function showConfirmation(eventID) {\n");
      out.write("                // Display a confirmation message box\n");
      out.write("                var confirmed = confirm(\"Are you sure you want to delete event?\");\n");
      out.write("                // If the user confirms, submit the form\n");
      out.write("                if (confirmed) {\n");
      out.write("                    document.getElementById(\"deleteButton_\" + eventID).click();\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("   \n");
      out.write("<script src=\"assets/js/gsap.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- MAIN JS -->\n");
      out.write("<script src=\"assets/js/main.js\"></script>\n");
      out.write("\n");
      out.write("<script src=\"assets/js/script.js\"></script>\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.4.min.js\"></script>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
