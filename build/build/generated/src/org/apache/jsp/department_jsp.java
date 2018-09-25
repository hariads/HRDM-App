package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.Connection;

public final class department_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
 Class.forName("com.mysql.cj.jdbc.Driver"); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\r\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\r\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("    <script type=\"text/javascript\" src=\"Form_validation.js\" ></script>\r\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Roboto+Slab\" rel=\"stylesheet\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>Department details view page</title>\r\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\r\n");
      out.write("        <style>\r\n");
      out.write("\r\n");
      out.write("            #bt{\r\n");
      out.write("                border-radius:0; \r\n");
      out.write("                background-repeat:no-repeat;\r\n");
      out.write("                border: none;\r\n");
      out.write("                overflow: hidden;\r\n");
      out.write("                outline:none;\r\n");
      out.write("\r\n");
      out.write("            }\r\n");
      out.write("            .btn:hover{\r\n");
      out.write("                background-color: #000000;\r\n");
      out.write("                color:white;\r\n");
      out.write("            }\r\n");
      out.write("            .jumbotron{\r\n");
      out.write("                width: 50%;\r\n");
      out.write("                margin-left: 25em;\r\n");
      out.write("                margin-top: 4em;\r\n");
      out.write("            }\r\n");
      out.write("            h2{\r\n");
      out.write("                font-family: Roboto Slab;\r\n");
      out.write("            }\r\n");
      out.write("            tr,td,th{\r\n");
      out.write("                font-size: 20px;\r\n");
      out.write("            }\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("    <title>HRDM</title>\r\n");
      out.write("    <body style=\"background-color:white\">\r\n");
      out.write("\r\n");
      out.write("        <form id=\"form1\" style=\"background-color:white\" >\r\n");
      out.write("            <nav class=\"navbar navbar-inverse\" >  \r\n");
      out.write("                <div class=\"container-fluid\">\r\n");
      out.write("                    <div class=\"navbar-header\" style=\"margin-top:-5px;\"> <a class=\"navbar-brand\" href=\"dashboard.jsp\"><img src=\"https://storage.googleapis.com/hrm-bucket/UI/hrdm.png\" ></a></div>\r\n");
      out.write("                   <li><button type=\"button\" class=\"btn\" id=\"bt\"  onclick=\"location.href = 'index.jsp'\" style=\"background-color:transparent;color:white;margin-top:0.4em;\">Home</button>\r\n");
      out.write("                    <ul class=\"nav navbar-nav\" style=\"float:right;\">           \r\n");
      out.write("                        <li>  <input class=\"form-control mr-sm-2\" type=\"search\" placeholder=\"Search\" name=\"search\" aria-label=\"Search\" style=\"margin-top:0.4em;\">\r\n");
      out.write("                        </li><li><button class=\"btn\" onclick=\"fun3()\" style=\"background-color:transparent\"><img src=\"https://png.icons8.com/ios/50/ffffff/search.png\" height=\"35\" style=\"border:10%\"></button>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li><button type=\"button\" class=\"btn\" id=\"bt\"  onclick=\"location.href = 'index.jsp'\" style=\"background-color:transparent;color:white;margin-top:0.4em;\">Logout</button></li>\r\n");
      out.write("                    </ul>  </div></nav>\r\n");
      out.write("\r\n");
      out.write("            <center><h2>Departments</h2></center>\r\n");
      out.write("            <button style=\"margin-left:60em;\" type=\"button\" class=\"btn btn-dark\" style=\"margin-top: -2em;\" data-toggle=\"modal\" data-target=\"#myModal\">Insert</button>\r\n");
      out.write("\r\n");
      out.write("           <div class=\"jumbotron\" id=\"jumbo2\" style=\"background-color:white; padding: 0px;\">\r\n");
      out.write("               <table class=\"table\" width=\"80%\">\r\n");
      out.write("                    <thead >\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <th style=\"border-bottom: 2px solid;\">Department ID</th>\r\n");
      out.write("                            <th style=\"border-bottom: 2px solid;\">Department Name</th>\r\n");
      out.write("                            \r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </thead>\r\n");
      out.write("                    ");


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
                            String query = "select deptid,dept from department";
                            ResultSet rs = stmt.executeQuery(query);
                            while (rs.next()) {
                                deptid = rs.getInt(1);

                                deptname = rs.getString(2);
                                {
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    <tbody>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <!--<td><input type=\"radio\" name=\"upid\" style=\"height:20px;width:20px\" id=\"d1\" value  =\"");
      out.print( deptid);
      out.write("\"></td>-->\r\n");
      out.write("                          <td style=\"border-top: none; border-bottom: none; border-bottom-color: white;\">");
      out.print( deptid);
      out.write("</td>\r\n");
      out.write("                          <td style=\"border-bottom:none;\">");
      out.print( deptname);
      out.write("</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </tbody>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    ");
 }
                            }
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    
      out.write("</table>\r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("    \r\n");
      out.write("        <div class=\"modal fade\" id=\"myModal\" role=\"dialog\">\r\n");
      out.write("            <div class=\"modal-dialog\">\r\n");
      out.write("\r\n");
      out.write("                <!-- Modal content-->\r\n");
      out.write("                <div class=\"modal-content\">\r\n");
      out.write("                    <div class=\"modal-header\">\r\n");
      out.write("                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\r\n");
      out.write("                        <center>   <h4 class=\"modal-title\">Fill Department Details</h4></center>\r\n");
      out.write("                    </div> \r\n");
      out.write("                    <div class=\"modal-body\">\r\n");
      out.write("                        <form name =\"myForm\" action=\"addDepartment.jsp\" method=\"GET\">\r\n");
      out.write("                            <div class=\"row justify-content-md-center\" style=\"width:90%;\">\r\n");
      out.write("                                <div class=\"col-sm-3\"></div>\r\n");
      out.write("                                <div class=\"col-sm-1\"><label><i class=\"fa fa-id-card\" style=\"font-size:36px\"></i></label>\r\n");
      out.write("                                </div><div class=\"col-sm-1\"></div>\r\n");
      out.write("                                <div class=\"col-sm-5\">\r\n");
      out.write("                                   <input  type=\"text\" class=\"form-control\" id=\"Depart_id\" placeholder=\"Department id\" name=\"departmentId\" required=\"required\"> </div><br><br><br><br>\r\n");
      out.write("                                   <div class=\"col-sm-3\"></div>\r\n");
      out.write("                                   <div class=\"col-sm-1\"><label><img src=\"https://png.icons8.com/ios/50/000000/department-filled.png\"></label></div><div class=\"col-sm-1\"></div><div class=\"col-sm-5\"><input type=\"text\" id = \"Depart_name\" placeholder=\"Department Name\" name=\"departmentName\" class=\"form-control\" required=\"required\" onkeypress = \"return valid_Employee_name(event)\"></div><br><br><br><br>\r\n");
      out.write("                                     <button class=\"btn btn-dark\" type=\"submit\"style=\"margin-left:20em;\" >Submit</button>\r\n");
      out.write("                                   <button class=\"btn btn-dark\" type=\"reset\" >Reset</button>\r\n");
      out.write("                              \r\n");
      out.write("                            </div>\r\n");
      out.write("                        </form>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"modal-footer\">\r\n");
      out.write("\r\n");
      out.write("                        \r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <script>\r\n");
      out.write("\r\n");
      out.write("            function fun3()\r\n");
      out.write("            {\r\n");
      out.write("                document.getElementById('form1').action = \"fetchDepartment.jsp\";\r\n");
      out.write("                document.getElementById('form1').method = \"GET\";\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            function fun2()\r\n");
      out.write("            {\r\n");
      out.write("                 document.getElementById('form1').action = \"addDepartment.jsp\";\r\n");
      out.write("                document.getElementById('form1').method = \"GET\";\r\n");
      out.write("                return false;\r\n");
      out.write("               \r\n");
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
