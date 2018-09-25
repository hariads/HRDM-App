package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.Connection;

public final class fetchDepartment_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\r');
      out.write('\n');
 Class.forName("com.mysql.cj.jdbc.Driver"); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("  \r\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Arvo\" rel=\"stylesheet\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>Employee details view page</title>\r\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\r\n");
      out.write("         <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\r\n");
      out.write("        <style>\r\n");
      out.write("            th,td{\r\n");
      out.write("                padding-right: 2em;\r\n");
      out.write("                padding-left: 2em;\r\n");
      out.write("\r\n");
      out.write("            }\r\n");
      out.write("            .jumbo2{\r\n");
      out.write("                padding:0px;\r\n");
      out.write("                margin:0px;\r\n");
      out.write("            }\r\n");
      out.write("             #bt{\r\n");
      out.write("                border-radius:0; \r\n");
      out.write("                background-repeat:no-repeat;\r\n");
      out.write("                border: none;\r\n");
      out.write("                overflow: hidden;\r\n");
      out.write("                outline:none;\r\n");
      out.write("             }\r\n");
      out.write("    .jumbotron{\r\n");
      out.write("                width: 50%;\r\n");
      out.write("                margin-left: 25em;\r\n");
      out.write("                margin-top: 4em;\r\n");
      out.write("            }\r\n");
      out.write("              tr,td,th{\r\n");
      out.write("                font-size: 20px;\r\n");
      out.write("            }\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        \r\n");
      out.write("        <form id=\"form1\">\r\n");
      out.write("              <nav class=\"navbar navbar-inverse\" >  \r\n");
      out.write("                <div class=\"container-fluid\">\r\n");
      out.write("                    <div class=\"navbar-header\" style=\"margin-top:-5px;\"> <a class=\"navbar-brand\" href=\"dashboard.jsp\"><img src=\"https://storage.googleapis.com/hrm-bucket/UI/hrdm.png\" ></a></div>\r\n");
      out.write("                   <li><button type=\"button\" class=\"btn\" id=\"bt\"  onclick=\"location.href = 'dashboard.jsp'\" style=\"background-color:transparent;color:white;margin-top:0.4em;\">Home</button>\r\n");
      out.write("                    <ul class=\"nav navbar-nav\" style=\"float:right;\">           \r\n");
      out.write("                        <li>  <input class=\"form-control mr-sm-2\" type=\"search\" placeholder=\"Search\" name=\"search\" aria-label=\"Search\" style=\"margin-top:0.4em;\">\r\n");
      out.write("                        </li><li><button class=\"btn\" onclick=\"fun3()\" style=\"background-color:transparent\"><img src=\"https://png.icons8.com/ios/50/ffffff/search.png\" height=\"35\" style=\"border:10%\"></button>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li><button type=\"button\" class=\"btn\" id=\"bt\"  onclick=\"location.href = 'index.jsp'\" style=\"background-color:transparent;color:white;margin-top:0.4em;\">Logout</button></li>\r\n");
      out.write("                    </ul>  </div></nav>\r\n");
      out.write("            <center><h2 style=\"margin-top:2em;\">Search Results</h2></center>\r\n");
      out.write("<!--            <div class=\"jumbotron\" style=\"background-color:white; padding: 0px; width: 60%; margin-left: 12em; margin-top:4em;\">\r\n");
      out.write("                <table class=\"table\">\r\n");
      out.write("                    <thead >\r\n");
      out.write("                        <tr>\r\n");
      out.write("\r\n");
      out.write("                            <th style=\"padding-top:0px; padding-bottom: 0px; border-top: none; border-bottom: none; \">Department ID</th>\r\n");
      out.write("                            <th style=\"padding-top:0px; padding-bottom: 0px; border-top: none; border-bottom: none;\">Department Name</th>\r\n");
      out.write("                            \r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </thead>\r\n");
      out.write("<div class=\"jumbotron\" id=\"jumbo2\" style=\"background-color:white; padding: 0px;\">\r\n");
      out.write("                <table class=\"table\">\r\n");
      out.write("                    <thead style=\"display:none;\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <th>Department ID</th>\r\n");
      out.write("                            <th>Department Name</th>\r\n");
      out.write("                            \r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </thead>-->\r\n");
      out.write("         <div class=\"jumbotron\" id=\"jumbo2\" style=\"background-color:white; padding: 0px;\">\r\n");
      out.write("             <table class=\"table-responsive\" width=\"80%\" style=\"background-color:white;\">\r\n");
      out.write("                    <thead >\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <th style=\"border-bottom: 2px solid;\">Department ID</th>\r\n");
      out.write("                            <th style=\"border-bottom: 2px solid;\">Department Name</th>\r\n");
      out.write("                            \r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </thead>\r\n");
      out.write("                    ");

                        String name = request.getParameter("search");
                        /* Create string of connection url within specified 
                    //format with machine name, 
                     port number and database name. Here machine name id 
                     localhost and database name is student. */
                        String connectionURL = "jdbc:mysql://127.0.0.1:3306/hr_db";
                        // declare a connection by using Connection interface 
                        Connection connection = null;

                        // declare object of Statement interface that uses for 
                        //executing sql statements.
                        // Load JBBC driver "com.mysql.jdbc.Driver"
                        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

                        // check if the text box is empty
                        // check if the text box having only blank spaces
                        /* Create a connection by using getConnection()
                               method that takes parameters of string type 
                               connection url, user name and password to connect 
                                 to database. */
                      int deptid = 0;
                        String deptname = "";

                        try {
                            connection = DriverManager.getConnection(connectionURL, "hari", "hari");
                            Statement stmt = connection.createStatement();
                                           //SELECT DISTINCTROW * from employee join department on employee.dept = department.deptid where employee.empname LIKE '%HR%' or department.dept LIKE '%name%'
                            String query = "SELECT deptid,dept from department where department.dept LIKE '%"+name+"%' or department.deptid LIKE '%"+name+"%'";
                            ResultSet rs = stmt.executeQuery(query);
                            while (rs.next()) {
                                 deptid = rs.getInt(1);
                                deptname = rs.getString(2);
                               {
      out.write("\r\n");
      out.write("                \r\n");
      out.write("                    <tbody>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td style=\"border-bottom:none;\">");
      out.print( deptid);
      out.write("</td>\r\n");
      out.write("                            <td style=\"border-bottom:none;\">");
      out.print( deptname);
      out.write("</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </tbody>\r\n");
      out.write("                \r\n");
      out.write("\r\n");
      out.write("                ");
 }
                        }
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                
      out.write("</table>\r\n");
      out.write("              \r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("        <script>\r\n");
      out.write("            function fun()\r\n");
      out.write("            {\r\n");
      out.write("                document.getElementById('form1').action = \"updateForm.jsp\";\r\n");
      out.write("                document.getElementById('form1').method = \"GET\";\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("            function fun3()\r\n");
      out.write("            {\r\n");
      out.write("                document.getElementById('form1').action = \"fetchDepartment.jsp\";\r\n");
      out.write("                document.getElementById('form1').method = \"GET\";\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("            function fun2()\r\n");
      out.write("            {\r\n");
      out.write("                var retVal = confirm(\"Do you want to delete ?\");\r\n");
      out.write("                if (retVal == true) {\r\n");
      out.write("                    document.getElementById('form1').action = \"deleteData.jsp\";\r\n");
      out.write("                    document.getElementById('form1').method = \"GET\";\r\n");
      out.write("                    return true;\r\n");
      out.write("                } else {\r\n");
      out.write("                    document.getElementById('form1').action = \"viewEmployee.jsp\";\r\n");
      out.write("                    return false;\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        </script>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
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
