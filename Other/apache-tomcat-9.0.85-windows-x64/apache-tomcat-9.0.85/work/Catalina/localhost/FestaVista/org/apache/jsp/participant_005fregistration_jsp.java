/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.85
 * Generated at: 2024-05-19 10:50:07 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class participant_005fregistration_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
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
      out.write("      <link rel=\"stylesheet\" href=\"assets/css/register.css\">\n");
      out.write("\n");
      out.write("      <title>Event Management Website</title>\n");
      out.write("      \n");
      out.write("      <style>\n");
      out.write("          .register{\n");
      out.write("              background: linear-gradient(to right bottom, #ffffff, #02effe);\n");
      out.write("          }\n");
      out.write("          \n");
      out.write("          .reg-form {\n");
      out.write("              background: linear-gradient(to right bottom, #ff00c8, #0013c4);\n");
      out.write("              width: 400px;\n");
      out.write("              color: #ffffff;\n");
      out.write("              margin: 3px auto;\n");
      out.write("              padding: 30px;\n");
      out.write("              border-radius: 15px;\n");
      out.write("              box-shadow: 0 4px 10px rgba(0, 0, 0, 5);\n");
      out.write("          }\n");
      out.write("          \n");
      out.write("          .column li {\n");
      out.write("    color: #401fcc;\n");
      out.write("    background-color: rgb(27 239 11 / 0%);\n");
      out.write("    text-align: justify;\n");
      out.write("    text-justify: inter-word;\n");
      out.write("    border-radius: 15px;\n");
      out.write("    box-shadow: 0 4px 10px rgba(0, 0, 0, 5);\n");
      out.write("    padding: 10px 5px;\n");
      out.write("    margin: 10px 5px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".column p {\n");
      out.write("    color: #00d9ff;\n");
      out.write("    background-color: rgba(275, 0, 0, 0);\n");
      out.write("    text-align: justify;\n");
      out.write("    text-justify: inter-word;\n");
      out.write("    border-radius: 15px;\n");
      out.write("    box-shadow: 0 4px 10px rgba(0, 0, 0, 5);\n");
      out.write("    padding: 10px 5px;\n");
      out.write("    margin: 10px 5px;\n");
      out.write("}\n");
      out.write("      </style>\n");
      out.write("      \n");
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
      out.write("                    <a href=\"login.jsp\" class=\"nav__button-ghost\">I am a Participant</a>\n");
      out.write("                    <a href=\"register.jsp\" class=\"nav__button-ghost\">I am an Organizer</a>\n");
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
      out.write("   \n");
      out.write("<body>\n");
      out.write("     <main class=\"main\">\n");
      out.write("         \n");
      out.write("         <section class=\"register\">\n");
      out.write("             <div class=\"column\">\n");
      out.write("                 <h2 class=\"headings\">Why Register as a Participant?</h2>\n");
      out.write("                 <p style=\"text-align: center;\">Welcome to Festa Vista! Here are some benefits of Participant Registration</p>\n");
      out.write("                 \n");
      out.write("                 <li>\n");
      out.write("                     <b>Event Discovery: </b>\n");
      out.write("Participants can easily browse through a wide range of events across various categories and locations.\n");
      out.write("                 </li>\n");
      out.write("                 <li>\n");
      out.write("                     <b>Detailed Event Information:</b>\n");
      out.write(" Provide comprehensive details about each event including date, time, location, agenda, speakers, sponsors, and any other relevant information.\n");
      out.write("                 </li>\n");
      out.write("                 <li>\n");
      out.write("                     <b>Registration: </b>\n");
      out.write("Allow participants to register for events directly through your website, streamlining the process and eliminating the need for manual registration.\n");
      out.write("                 </li>\n");
      out.write("                 <li>\n");
      out.write("                     <b>Customizable Profiles: </b>\n");
      out.write("Enable participants to create personalized profiles where they can manage their event registrations, preferences, and other relevant information.\n");
      out.write("                 </li>\n");
      out.write("                 <li>\n");
      out.write("                     <b>Exclusive Offer:</b>\n");
      out.write(" Flat 10% discount on entry fees on registering through our website!\n");
      out.write("                 </li>\n");
      out.write("               </div>\n");
      out.write("             <div class=\"column\">\n");
      out.write("        <form class=\"reg-form\" id=\"register\" onsubmit=\"return validateRegisterForm()\" method=\"post\" action=\"ParticipantServlet?id=register\">\n");
      out.write("            <h4 class=\"headings\">Already Registered!</h4><br>\n");
      out.write("            <a class=\"bottom-line\" href=\"participant_login.jsp\" style=\"margin-left: 95px;\"> Go to login page</a><br><br>\n");
      out.write("            <h2 class=\"headings\">Participant Registration</h2><br>\n");
      out.write("        <label for=\"name\">Name:</label>\n");
      out.write("        <input type=\"text\" id=\"name\" name=\"name\" required><br>\n");
      out.write("\n");
      out.write("        <label for=\"email\">Email:</label>\n");
      out.write("        <input type=\"email\" id=\"email\" name=\"email\" oninput=\"autofillUsername()\" required><br>\n");
      out.write("\n");
      out.write("        <label for=\"mobileNo\">Mobile No:</label>\n");
      out.write("        <input type=\"text\" id=\"mobileNo\" name=\"mobileNo\" required><br>\n");
      out.write("\n");
      out.write("        <label for=\"registerUsername\">Username:</label>\n");
      out.write("        <input type=\"text\" id=\"registerUsername\" name=\"registerUsername\" readonly><br>\n");
      out.write("\n");
      out.write("        <label for=\"registerPassword\">Password:</label>\n");
      out.write("        <input type=\"password\" id=\"registerPassword\" name=\"registerPassword\" required><br>\n");
      out.write("\n");
      out.write("        <div class=\"submitbuttons\">\n");
      out.write("            <input type=\"submit\" value=\"Submit\">\n");
      out.write("            <br><br>\n");
      out.write("            <a class=\"bottom-line\" href=\"index.jsp\"  style=\"margin-left: 160px;\">Cancel Registration</a>\n");
      out.write("        </div>\n");
      out.write("    \n");
      out.write("    </form>\n");
      out.write("    \n");
      out.write("            </div>\n");
      out.write("             \n");
      out.write("             <h2 class=\"headings\">Get Started Today!</h2><p class=\"bottom\">\n");
      out.write("Don't miss out on the opportunity to showcase your event to a broader audience and streamline your event management process. Register as an organizer today and unlock a world of possibilities for your event!</p>\n");
      out.write("             <h2 class=\"headings\">Get in Touch</h2>\n");
      out.write("  <p  class=\"bottom\">Want to know more about us visit our <a href=\"about.jsp\">about</a> page or Have questions, feedback, or need assistance? We're here to help! Feel free to reach out to us via our <a href=\"contact.jsp\">contact</a> page or connect with us on social media.\n");
      out.write("\n");
      out.write("Thank you for choosing Festa Vista for all your event needs. Let's create unforgettable experiences together!</p>\n");
      out.write("             \n");
      out.write("         </section>\n");
      out.write("        \n");
      out.write("      </main>\n");
      out.write("    \n");
      out.write("    <script>\n");
      out.write("        function autofillUsername() {\n");
      out.write("    // Get the value of the email field\n");
      out.write("    var emailInput = document.getElementById('email');\n");
      out.write("    var emailValue = emailInput.value;\n");
      out.write("\n");
      out.write("    // Extract the part before the '@' symbol\n");
      out.write("    var username = emailValue.split('@')[0];\n");
      out.write("\n");
      out.write("    // Autofill the registerUsername field\n");
      out.write("    var usernameInput = document.getElementById('registerUsername');\n");
      out.write("    usernameInput.value = username;\n");
      out.write("}\n");
      out.write("    </script>\n");
      out.write("    \n");
      out.write("</body>\n");
 Boolean registrationSuccess = (Boolean) request.getAttribute("registrationSuccess"); 
      out.write('\n');
 if (registrationSuccess != null) { 
      out.write("\n");
      out.write("    <script>\n");
      out.write("        var message = ");
      out.print( registrationSuccess ? "'Registration successful!'" : "'Error in registration. Please try again.'" );
      out.write(";\n");
      out.write("        alert(message);\n");
      out.write("    </script>\n");
 } 
      out.write("\n");
      out.write("\n");
      out.write("   \n");
      out.write("<script src=\"assets/js/gsap.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- MAIN JS -->\n");
      out.write("<script src=\"assets/js/main.js\"></script>\n");
      out.write("\n");
      out.write("<script src=\"script.js\"></script>\n");
      out.write("   \n");
      out.write("</html>\n");
      out.write("\n");
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
