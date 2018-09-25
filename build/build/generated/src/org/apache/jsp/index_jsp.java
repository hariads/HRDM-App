package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

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
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>  \n");
      out.write("    <script src=\"Scripts/jquery-1.4.1.js\" type=\"text/javascript\"/>\n");
      out.write("  <script src=\"Scripts/jquery.alerts.js\" type=\"text/javascript\"/>\n");
      out.write("  <link href=\"Styles/jquery.alerts.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    <link rel=\"shortcut icon\" type=\"image/png\" href=\"https://storage.googleapis.com/hrm-bucket/UI/HRDM_logo%20(1).png\"/>\n");
      out.write("    <title> HRDM</title>\n");
      out.write("\t<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\"> \n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"index_style.css\">\n");
      out.write("\t<link href=\"https://fonts.googleapis.com/css?family=Archivo+Black|Lalezar\" rel=\"stylesheet\">\n");
      out.write("</head>\n");
      out.write("<body >\n");
      out.write("\n");
      out.write("\t<div class=\"jumbotron\">\n");
      out.write("\t\t<center><img id=\"logo\" src=\"https://storage.googleapis.com/hrm-bucket/UI/HRDM_logo%20(1).png\"></center>\n");
      out.write("\t\t<hr>\n");
      out.write("\t\t<form id=\"loginform\" role=\"form\">\n");
      out.write("\t\t\t<div id=\"input-form\">\n");
      out.write("                            <br> \n");
      out.write("           <div style=\"margin-bottom: 25px\" class=\"input-group\">\n");
      out.write("                <span class=\"input-group-addon\"><i class=\"glyphicon glyphicon-user\"></i></span>\n");
      out.write("            \t<center><input id=\"login-username\" type=\"text\" class=\"form-control\" name=\"username\" value=\"\" placeholder=\"Employee id\"></center>                                        \n");
      out.write("            </div>\n");
      out.write("            <br>\n");
      out.write("            <div style=\"margin-bottom: 25px\" class=\"input-group\">\n");
      out.write("                <span class=\"input-group-addon\"><i class=\"glyphicon glyphicon-lock\"></i></span>\n");
      out.write("                 <center><input id=\"login-password\" type=\"password\" class=\"form-control\" name=\"password\" placeholder=\"password\"></center>\n");
      out.write("            </div>\n");
      out.write("            <br>\n");
      out.write("            <center><button onclick=\"callDashBoard()\" class=\"btn btn-primary\" id=\"sign-in-button\" >Login</button></center>\n");
      out.write("                        </div>\n");
      out.write("        </form>\n");
      out.write("\t</div>\n");
      out.write("        <script>\n");
      out.write("            function callDashBoard() {\n");
      out.write("                var usr = document.getElementById(\"login-username\").value;\n");
      out.write("                var pwd = document.getElementById(\"login-password\").value;\n");
      out.write("                if ((usr== \"hrms@jsp.com\") && (pwd == \"root\")) {\n");
      out.write("             \n");
      out.write("                    document.getElementById('loginform').action = \"dashboard.jsp\";\n");
      out.write("                } \n");
      out.write("                else { \n");
      out.write("                            $(\"#Button\").click(function () {\n");
      out.write("   4:              jAlert('Wow !My alert message with custom titile','My custom title bar here...');\n");
      out.write("   5:              return false;\n");
      out.write("   6:          });\n");
      out.write("                     alert(\"Password INVALID!!\");\n");
      out.write("                   }\n");
      out.write("                   return false;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
