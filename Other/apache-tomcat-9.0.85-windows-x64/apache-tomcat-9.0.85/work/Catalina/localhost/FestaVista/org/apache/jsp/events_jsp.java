/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.85
 * Generated at: 2024-04-06 05:39:40 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ServersidePackages.SportObject;
import java.util.Base64;
import ServersidePackages.DataObject;
import ServersidePackages.DataObject;
import java.util.List;
import com.mysql.cj.jdbc.Blob;
import java.io.*;
import java.sql.*;

public final class events_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("ServersidePackages.SportObject");
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
      out.write("\n");
      out.write("      <title>Event Management Website</title>\n");
      out.write("      <style>\n");
      out.write("          th{\n");
      out.write("              color: red;\n");
      out.write("              background-color: rgba(0,0,0,0.5);\n");
      out.write("          }\n");
      out.write("              \n");
      out.write("          .name, \n");
      out.write("          .date{\n");
      out.write("              width: 200px;\n");
      out.write("              text-align: center;\n");
      out.write("              padding: 20px auto;\n");
      out.write("          }\n");
      out.write("          \n");
      out.write("          td{\n");
      out.write("              font-size: large;\n");
      out.write("              font-weight: 900;\n");
      out.write("              text-align: center;\n");
      out.write("              padding: 20px;\n");
      out.write("          }\n");
      out.write("          \n");
      out.write("          .poster-image{\n");
      out.write("              width: 200px;\n");
      out.write("              height: 300px;\n");
      out.write("          }\n");
      out.write("          \n");
      out.write("          .all_events{\n");
      out.write("              display: none;\n");
      out.write("              flex-wrap: wrap;\n");
      out.write("              justify-content: space-between;\n");
      out.write("              \n");
      out.write("              h2{\n");
      out.write("                  position: fixed;\n");
      out.write("              }\n");
      out.write("          }\n");
      out.write("          \n");
      out.write("          .slider {\n");
      out.write("              overflow: hidden;\n");
      out.write("              white-space: nowrap;\n");
      out.write("          }\n");
      out.write("          \n");
      out.write("          .slider .events-box{\n");
      out.write("              display: inline-block;\n");
      out.write("              vertical-align: top;\n");
      out.write("              width: calc(25% - 20px);\n");
      out.write("              margin-right: 20px;\n");
      out.write("              margin-top: 40px;\n");
      out.write("          }\n");
      out.write("\n");
      out.write("        .prev, .next {\n");
      out.write("            cursor: pointer;\n");
      out.write("            position: absolute;\n");
      out.write("            top: 50%;\n");
      out.write("            transform: translateY(-50%);\n");
      out.write("            background-color: #333;\n");
      out.write("            color: white;\n");
      out.write("            border: none;\n");
      out.write("            padding: 10px;\n");
      out.write("            z-index: 1000;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .prev {\n");
      out.write("            left: 0;\n");
      out.write("            margin-left: 100px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .next {\n");
      out.write("            right: 0;\n");
      out.write("            margin-right: 100px;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .event_slider{\n");
      out.write("            margin-left: 20px;\n");
      out.write("            margin-right: 20px;\n");
      out.write("        }\n");
      out.write("      </style>\n");
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
      out.write("                        <a href=\"events.jsp\" class=\"nav__link\">Events</a>\n");
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
      out.write("    <body>\n");
      out.write("      <!--==================== MAIN ====================-->\n");
      out.write("      <main class=\"main\">\n");
      out.write("         <!--==================== HOME ====================-->\n");
      out.write("         <section class=\"home\">\n");
      out.write("            <div class=\"event__container container\" style=\"margin-top: 100px\">\n");
      out.write("                \n");
      out.write("<div class=\"all_events\">\n");
      out.write("    \n");
      out.write("    ");
 
    List<DataObject> dataList = (List<DataObject>) request.getAttribute("dataList");
    for (DataObject data : dataList) {
    
      out.write("\n");
      out.write("    <div class=\"events-box\">\n");
      out.write("        <h1>");
      out.print( data.getId() );
      out.write("</h1>\n");
      out.write("        ");
 
        Blob posterBlob1 = data.getPoster();
        if (posterBlob1 != null) {
            try (InputStream inputStream = posterBlob1.getBinaryStream()) {
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                out.println("<img src=\"data:image/jpeg;base64," + base64Image + "\" class=\"poster-image\">");
            } catch (SQLException | IOException e) {
                e.printStackTrace();
            }
        }
        
      out.write("\n");
      out.write("        ");
      out.print( data.getName() );
      out.write("<br>\n");
      out.write("        ");
      out.print( data.getDate() );
      out.write("\n");
      out.write("    </div>\n");
      out.write("    ");
 
    }
    
      out.write("\n");
      out.write("</div>\n");
      out.write("<div class=\"event_slider\">\n");
      out.write("<h2>All Events</h2>\n");
      out.write("<div id=\"all_event_slider\" class=\"slider\">\n");
      out.write("    <!-- Slider content will be dynamically generated here -->\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<button id=\"prevBtn\" class=\"prev\" onclick=\"moveSlider(-1)\">&#10094;</button>\n");
      out.write("<button id=\"nextBtn\" class=\"next\" onclick=\"moveSlider(1)\">&#10095;</button>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("<div class=\"all_events\">\n");
      out.write("    \n");
      out.write("    ");
 
    List<SportObject> sportList = (List<SportObject>) request.getAttribute("sportList");
    for (SportObject data : sportList) {
    
      out.write("\n");
      out.write("    <div class=\"sport-events-box\">\n");
      out.write("        <h1>");
      out.print( data.getId() );
      out.write("</h1>\n");
      out.write("        ");
 
        Blob posterBlob1 = data.getPoster();
        if (posterBlob1 != null) {
            try (InputStream inputStream = posterBlob1.getBinaryStream()) {
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                out.println("<img src=\"data:image/jpeg;base64," + base64Image + "\" class=\"poster-image\">");
            } catch (SQLException | IOException e) {
                e.printStackTrace();
            }
        }
        
      out.write("\n");
      out.write("        ");
      out.print( data.getName() );
      out.write("<br>\n");
      out.write("        ");
      out.print( data.getDate() );
      out.write("\n");
      out.write("    </div>\n");
      out.write("    ");
 
    }
    
      out.write("\n");
      out.write("</div>\n");
      out.write("<div class=\"sport_event_slider\">\n");
      out.write("<h2>Sport Events</h2>\n");
      out.write("<div id=\"sport_event_slider\" class=\"sportslider\">\n");
      out.write("    <!-- Slider content will be dynamically generated here -->\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<button id=\"prevBtn1\" class=\"prev1\" onclick=\"moveSlider1(-1)\">&#10094;</button>\n");
      out.write("<button id=\"nextBtn1\" class=\"next1\" onclick=\"moveSlider1(1)\">&#10095;</button>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    \n");
      out.write("  \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("                   \n");
      out.write("                \n");
      out.write("                <div class=\"home__images\">\n");
      out.write("                    <img src=\"assets/img/img-44.png\" alt=\"image\" class=\"home__img-4\"  style=\"z-index: -1; filter: blur(3px); position: fixed;\">\n");
      out.write("                    <img src=\"assets/img/img-3.png\" alt=\"image\" class=\"home__img-3\"  style=\"z-index: -1; filter: blur(3px); position: fixed;\">\n");
      out.write("                    <img src=\"assets/img/img-2.png\" alt=\"image\" class=\"home__img-2\"  style=\"z-index: -1; filter: blur(3px); position: fixed;\">\n");
      out.write("                    <img src=\"assets/img/img-11.png\" alt=\"image\" class=\"home__img-1\"  style=\"z-index: -1; filter: blur(3px); position: fixed;\">\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("         </section>\n");
      out.write("      </main>\n");
      out.write("      \n");
      out.write("     \n");
      out.write("   </body>\n");
      out.write("   \n");
      out.write("   <script>\n");
      out.write("let slideIndex = 0;\n");
      out.write("const slider = document.getElementById(\"all_event_slider\");\n");
      out.write("const prevBtn = document.getElementById(\"prevBtn\");\n");
      out.write("const nextBtn = document.getElementById(\"nextBtn\");\n");
      out.write("\n");
      out.write("// Function to move the slider\n");
      out.write("function moveSlider(n) {\n");
      out.write("    const eventTables = document.querySelectorAll(\".events-box\");\n");
      out.write("    const slidesPerPage = 4;\n");
      out.write("    const totalSlides = eventTables.length;\n");
      out.write("    const maxSlides = Math.ceil(totalSlides / slidesPerPage);\n");
      out.write("    \n");
      out.write("    slideIndex += n;\n");
      out.write("    if (slideIndex < 0) {\n");
      out.write("        slideIndex = maxSlides - 1;\n");
      out.write("    }\n");
      out.write("    if (slideIndex >= maxSlides) {\n");
      out.write("        slideIndex = 0;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    const startIndex = slideIndex * slidesPerPage;\n");
      out.write("    const endIndex = Math.min(startIndex + slidesPerPage, totalSlides);\n");
      out.write("\n");
      out.write("    slider.innerHTML = \"\";\n");
      out.write("    for (let i = startIndex; i < endIndex; i++) {\n");
      out.write("        slider.appendChild(eventTables[i].cloneNode(true));\n");
      out.write("    }\n");
      out.write("}\n");
      out.write("\n");
      out.write("let slideIndex1 = 0;\n");
      out.write("const slider1 = document.getElementById(\"sport_event_slider\");\n");
      out.write("const prevBtn1 = document.getElementById(\"prevBtn1\");\n");
      out.write("const nextBtn1 = document.getElementById(\"nextBtn1\");\n");
      out.write("\n");
      out.write("// Function to move the slider\n");
      out.write("function moveSlider1(n) {\n");
      out.write("    const eventTables1 = document.querySelectorAll(\".sport-events-box\");\n");
      out.write("    const slidesPerPage1 = 4;\n");
      out.write("    const totalSlides1 = eventTables1.length;\n");
      out.write("    const maxSlides1 = Math.ceil(totalSlides1 / slidesPerPage1);\n");
      out.write("    \n");
      out.write("    slideIndex1 += n;\n");
      out.write("    if (slideIndex1 < 0) {\n");
      out.write("        slideIndex1 = maxSlides1 - 1;\n");
      out.write("    }\n");
      out.write("    if (slideIndex1 >= maxSlides1) {\n");
      out.write("        slideIndex1 = 0;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    const startIndex1 = slideIndex1 * slidesPerPage1;\n");
      out.write("    const endIndex1 = Math.min(startIndex1 + slidesPerPage1, totalSlides1);\n");
      out.write("\n");
      out.write("    slider1.innerHTML = \"\";\n");
      out.write("    for (let i = startIndex1; i < endIndex1; i++) {\n");
      out.write("        slider1.appendChild(eventTables1[i].cloneNode(true));\n");
      out.write("    }\n");
      out.write("}\n");
      out.write("\n");
      out.write("// Initial slider setup\n");
      out.write("window.addEventListener(\"load\", function() {\n");
      out.write("    moveSlider(0);\n");
      out.write("    moveSlider1(0);\n");
      out.write("});\n");
      out.write("\n");
      out.write("   </script>\n");
      out.write("   \n");
      out.write("<script src=\"assets/js/gsap.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- MAIN JS -->\n");
      out.write("<script src=\"assets/js/main.js\"></script>\n");
      out.write("\n");
      out.write("<script src=\"script.js\"></script>\n");
      out.write("   \n");
      out.write("</html>\n");
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
