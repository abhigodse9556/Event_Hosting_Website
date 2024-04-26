/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.85
 * Generated at: 2024-04-17 09:28:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <title>Event Management Website</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/styles.css\">\n");
      out.write("    <link rel=\"shortcut icon\" href=\"assets/img/favicon.png\" type=\"image/x-icon\">\n");
      out.write("    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap\" rel=\"stylesheet\">\n");
      out.write("    <!--Stylesheet-->\n");
      out.write("    <style>\n");
      out.write("        \n");
      out.write("        body {\n");
      out.write("    font-family: var(--body-font);\n");
      out.write("    font-size: var(--normal-font-size);\n");
      out.write("    font-weight: var(--font-medium);\n");
      out.write("    background: linear-gradient(to right bottom, #000000, #ff00c8);\n");
      out.write("    color: var(--text-color);\n");
      out.write("}\n");
      out.write("        \n");
      out.write("      *,\n");
      out.write("*:before,\n");
      out.write("*:after{\n");
      out.write("    padding: 0;\n");
      out.write("    margin: 0;\n");
      out.write("    box-sizing: border-box;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".background{\n");
      out.write("    width: 430px;\n");
      out.write("    height: 520px;\n");
      out.write("    position: absolute;\n");
      out.write("    transform: translate(-50%,-50%);\n");
      out.write("    left: 50%;\n");
      out.write("    top: 50%;\n");
      out.write("}\n");
      out.write(".background .shape{\n");
      out.write("    height: 200px;\n");
      out.write("    width: 200px;\n");
      out.write("    position: absolute;\n");
      out.write("    border-radius: 50%;\n");
      out.write("}\n");
      out.write(".shape:first-child{\n");
      out.write("    background: linear-gradient(to right bottom, #0018ff, #000000);\n");
      out.write("    left: -80px;\n");
      out.write("    top: -80px;\n");
      out.write("}\n");
      out.write(".shape:last-child{\n");
      out.write("    background: linear-gradient(to right bottom, #000000, #ff00c8);\n");
      out.write("    right: -30px;\n");
      out.write("    bottom: -80px;\n");
      out.write("}\n");
      out.write("form{\n");
      out.write("    height: 520px;\n");
      out.write("    width: 400px;\n");
      out.write("    background: linear-gradient(to right bottom, #ff00c8, #0013c4);\n");
      out.write("    position: absolute;\n");
      out.write("    transform: translate(-50%,-50%);\n");
      out.write("    top: 50%;\n");
      out.write("    left: 50%;\n");
      out.write("    border-radius: 10px;\n");
      out.write("    backdrop-filter: blur(10px);\n");
      out.write("    border: 2px solid rgba(255,255,255,0.1);\n");
      out.write("    box-shadow: 0 0 40px rgba(8,7,16,0.6);\n");
      out.write("    padding: 50px 35px;\n");
      out.write("}\n");
      out.write("form *{\n");
      out.write("    font-family: 'Poppins',sans-serif;\n");
      out.write("    color: #ffffff;\n");
      out.write("    letter-spacing: 0.5px;\n");
      out.write("    outline: none;\n");
      out.write("    border: none;\n");
      out.write("}\n");
      out.write("form h3{\n");
      out.write("    font-size: 32px;\n");
      out.write("    font-weight: 500;\n");
      out.write("    line-height: 42px;\n");
      out.write("    text-align: center;\n");
      out.write("}\n");
      out.write("\n");
      out.write("label{\n");
      out.write("    display: block;\n");
      out.write("    margin-top: 30px;\n");
      out.write("    font-size: 16px;\n");
      out.write("    font-weight: 500;\n");
      out.write("}\n");
      out.write("input{\n");
      out.write("    display: block;\n");
      out.write("    height: 50px;\n");
      out.write("    width: 100%;\n");
      out.write("    background-color: rgba(255,255,255,0.07);\n");
      out.write("    border-radius: 3px;\n");
      out.write("    padding: 0 10px;\n");
      out.write("    margin-top: 8px;\n");
      out.write("    font-size: 14px;\n");
      out.write("    font-weight: 300;\n");
      out.write("}\n");
      out.write("::placeholder{\n");
      out.write("    color: #e5e5e5;\n");
      out.write("}\n");
      out.write("button{\n");
      out.write("    margin-top: 50px;\n");
      out.write("    width: 100%;\n");
      out.write("    background-color: #ffffff;\n");
      out.write("    color: #080710;\n");
      out.write("    padding: 15px 0;\n");
      out.write("    font-size: 18px;\n");
      out.write("    font-weight: 600;\n");
      out.write("    border-radius: 5px;\n");
      out.write("    cursor: pointer;\n");
      out.write("}\n");
      out.write(".social{\n");
      out.write("  margin-top: 30px;\n");
      out.write("  display: flex;\n");
      out.write("}\n");
      out.write(".social div{\n");
      out.write("  background: red;\n");
      out.write("  width: 150px;\n");
      out.write("  border-radius: 3px;\n");
      out.write("  padding: 5px 10px 10px 5px;\n");
      out.write("  background-color: rgba(255,255,255,0.27);\n");
      out.write("  color: #eaf0fb;\n");
      out.write("  text-align: center;\n");
      out.write("}\n");
      out.write(".social div:hover{\n");
      out.write("  background-color: rgba(255,255,255,0.47);\n");
      out.write("}\n");
      out.write(".social .fb{\n");
      out.write("  margin-left: 25px;\n");
      out.write("}\n");
      out.write(".social i{\n");
      out.write("  margin-right: 4px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<header class=\"header\" id=\"header\">\n");
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
      out.write("                    <li class=\"nav__item\" style=\"display: none;\">\n");
      out.write("                       <form action=\"Servlet?id=all_events\" method=\"post\">\n");
      out.write("    <input type=\"hidden\" name=\"id\" value=\"all_events\">\n");
      out.write("    <button id=\"event_btn\" type=\"submit\" class=\"nav__link\">Events</button>\n");
      out.write("</form>\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a href=\"#\" class=\"nav__link\" onclick=\"eventNav()\">Events</a>\n");
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
      out.write("<!--                <div class=\"nav__buttons\">\n");
      out.write("                    <a href=\"register.jsp\" class=\"nav__button-ghost\">I am an Organizer</a>\n");
      out.write("                </div>-->\n");
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
      out.write("\n");
      out.write("<body>\n");
      out.write("    \n");
      out.write("<!--    <div class=\"home__images\">\n");
      out.write("            <img src=\"assets/img/img-44.png\" alt=\"image\" class=\"home__img-4\" style=\"z-index: -1; filter: blur(3px); position: fixed;\">\n");
      out.write("                    <img src=\"assets/img/img-3.png\" alt=\"image\" class=\"home__img-3\" style=\"z-index: -1; filter: blur(3px); position: fixed;\">\n");
      out.write("                    <img src=\"assets/img/img-2.png\" alt=\"image\" class=\"home__img-2\" style=\"z-index: -1; filter: blur(3px); position: fixed;\">\n");
      out.write("                    <img src=\"assets/img/img-11.png\" alt=\"image\" class=\"home__img-1\" style=\"z-index: -1; filter: blur(3px); position: fixed;\">\n");
      out.write("                </div>-->\n");
      out.write("    \n");
      out.write("    <div class=\"background\">\n");
      out.write("        <div class=\"shape\"></div>\n");
      out.write("        <div class=\"shape\"></div>\n");
      out.write("    </div>\n");
      out.write("    <form id=\"login\" action=\"AdminServlet?id=login\" method=\"post\">\n");
      out.write("        <h3>Login Here</h3>\n");
      out.write("\n");
      out.write("        <label for=\"username\">Username</label>\n");
      out.write("        <input type=\"text\" placeholder=\"Username\" id=\"username\" name=\"username\">\n");
      out.write("\n");
      out.write("        <label for=\"password\">Password</label>\n");
      out.write("        <input type=\"password\" placeholder=\"Password\" id=\"password\" name=\"password\">\n");
      out.write("\n");
      out.write("        <button id=\"submitButton\" type=\"submit\">Log In</button>\n");
      out.write("        <div class=\"social\">\n");
      out.write("            <!--<a href=\"register.jsp\" class=\"go\">Don't have an account Register</a>-->\n");
      out.write("            <a href=\"index.jsp\" class=\"fb\">Cancel</a>\n");
      out.write("<!--          <div class=\"go\"><i class=\"fab fa-google\"></i>  Google</div>\n");
      out.write("          <div class=\"fb\"><i class=\"fab fa-facebook\"></i>  Facebook</div>-->\n");
      out.write("        </div>\n");
      out.write("    </form>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    function eventNav(){\n");
      out.write("              document.getElementById(\"event_btn\").click();\n");
      out.write("          }\n");
      out.write("</script>\n");
      out.write("    \n");
      out.write("</body>\n");
 Boolean registrationSuccess = (Boolean) request.getAttribute("registrationSuccess"); 
      out.write('\n');
 if (registrationSuccess != null) { 
      out.write("\n");
      out.write("    <script>\n");
      out.write("        var message = ");
      out.print( registrationSuccess ? "'Registration successful!'" : "'Invalid Crediantials'" );
      out.write(";\n");
      out.write("        alert(message);\n");
      out.write("    </script>\n");
 } 
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("<script src=\"assets/js/gsap.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- MAIN JS -->\n");
      out.write("<script src=\"assets/js/main.js\"></script>\n");
      out.write("\n");
      out.write("<script src=\"script.js\"></script>\n");
      out.write("\n");
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
