/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.85
 * Generated at: 2024-05-19 10:50:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("      <!--=============== FAVICON ===============-->\n");
      out.write("      <link rel=\"shortcut icon\" href=\"assets/img/favicon.png\" type=\"image/x-icon\">\n");
      out.write("      <!--=============== REMIXICONS ===============-->\n");
      out.write("      <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.4.0/remixicon.css\" crossorigin=\"\">     \n");
      out.write("      <!--=============== CSS ===============-->\n");
      out.write("      <link rel=\"stylesheet\" href=\"assets/css/styles.css\">\n");
      out.write("      <title>Patil Constructions</title>      \n");
      out.write("      <style>\n");
      out.write("          .home{\n");
      out.write("              position: relative;\n");
      out.write("              height: 890px;\n");
      out.write("          }\n");
      out.write("          \n");
      out.write("          .home__img-2{\n");
      out.write("              margin-left: 500px;\n");
      out.write("          }\n");
      out.write("          .nav__button-ghost{\n");
      out.write("              width: min-content;\n");
      out.write("              background-color: hsla(0, 0%, 100%, .5);\n");
      out.write("              padding: 1rem 2.5rem;\n");
      out.write("              border: 2px solid var(--title-color);\n");
      out.write("              border-radius: .75rem;\n");
      out.write("          }\n");
      out.write("      </style>      \n");
      out.write("   </head>   \n");
      out.write("   <!--==================== HEADER ====================-->\n");
      out.write("      <header class=\"header\" id=\"header\">\n");
      out.write("        <nav class=\"nav container\">\n");
      out.write("            <a href=\"index.jsp\" class=\"nav__logo\">\n");
      out.write("                <img src=\"assets/img/logo.png\" alt=\"logo\">\n");
      out.write("            </a>\n");
      out.write("            <div class=\"nav__menu\" id=\"nav-menu\">\n");
      out.write("                <ul class=\"nav__list\">\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a href=\"index.jsp\" class=\"nav__link\">Home</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav__item\" style=\"display: none;\">\n");
      out.write("                       <form action=\"Servlet?id=all_events\" method=\"post\">\n");
      out.write("                            <input type=\"hidden\" name=\"id\" value=\"all_events\">\n");
      out.write("                            <button id=\"event_btn\" type=\"submit\" class=\"nav__link\">Events</button>\n");
      out.write("                        </form>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a href=\"#\" class=\"nav__link\" onclick=\"eventNav()\">Projects</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a href=\"about.jsp\" class=\"nav__link\">About</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a href=\"contact.jsp\" class=\"nav__link\">Contact</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("                <div class=\"nav__buttons\">\n");
      out.write("                    <a href=\"admin_login.jsp\" class=\"nav__button-ghost\">Admin</a>\n");
      out.write("                </div>\n");
      out.write("                <!--close button-->\n");
      out.write("                <div class=\"nav__close\" id=\"nav-close\">\n");
      out.write("                    <i class=\"ri-close-line\"></i>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <!--toggle button-->\n");
      out.write("            <div class=\"nav__toggle\" id=\"nav-toggle\">\n");
      out.write("                <i class=\"ri-menu-line\"></i>\n");
      out.write("            </div>\n");
      out.write("        </nav>          \n");
      out.write("      </header>\n");
      out.write("    <body>\n");
      out.write("      <!--==================== MAIN ====================-->\n");
      out.write("      <main class=\"main\">\n");
      out.write("         <!--==================== HOME ====================-->\n");
      out.write("         <section class=\"home\">\n");
      out.write("            <div class=\"home__container container\">\n");
      out.write("                <div class=\"home__content\">\n");
      out.write("                    <div class=\"home__data\">\n");
      out.write("                        <h3 class=\"home__subtitle\">\n");
      out.write("                            A LIFETIME EXPERIENCE\n");
      out.write("                        </h3>\n");
      out.write("                        <h1 class=\"home__title\">\n");
      out.write("                            Patil Constructions <br>\n");
      out.write("                        </h1>\n");
      out.write("			<h2 class=\"home__title2\">Elevating projects, simplifying solutions</h2>\n");
      out.write("                        <p class=\"home__description\">\n");
      out.write("                            Projects To Remember\n");
      out.write("                        </p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"home__images\">\n");
      out.write("                    <img src=\"assets/img/.png\" alt=\"image\" class=\"home__img-4\" >\n");
      out.write("                    <img src=\"assets/img/img-3.png\" alt=\"image\" class=\"home__img-3\">\n");
      out.write("                    <img src=\"assets/img/img-22.png\" alt=\"image\" class=\"home__img-2\">\n");
      out.write("                    <img src=\"assets/img/bg1.jpg\" alt=\"image\" class=\"home__img-1\">\n");
      out.write("                    <!--<img src=\"assets/img/img-3123.png\" alt=\"image\" class=\"home__img-5\">-->\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("         </section>\n");
      out.write("      </main>\n");
      out.write("      <script>\n");
      out.write("          function eventNav(){\n");
      out.write("              document.getElementById(\"event_btn\").click();\n");
      out.write("          }\n");
      out.write("      </script>     \n");
      out.write("   </body>  \n");
      out.write("<script src=\"assets/js/gsap.min.js\"></script>\n");
      out.write("<!-- MAIN JS -->\n");
      out.write("<script src=\"assets/js/main.js\"></script>\n");
      out.write("<script src=\"script.js\"></script>   \n");
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
