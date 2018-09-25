package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.Connection;

public final class fetch_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css\" integrity=\"sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB\" crossorigin=\"anonymous\">\r\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Arvo\" rel=\"stylesheet\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>HRDM</title>\r\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\r\n");
      out.write("        <style>\r\n");
      out.write("            th,td{\r\n");
      out.write("                padding-right: 2em;\r\n");
      out.write("                padding-left: 2em;\r\n");
      out.write("\r\n");
      out.write("            }\r\n");
      out.write("            .jumbotron{\r\n");
      out.write("                background-color: white;\r\n");
      out.write("            }\r\n");
      out.write("            #bons{\r\n");
      out.write("                background-color: white;\r\n");
      out.write("                padding: 0px;\r\n");
      out.write("                margin-top: 2em;\r\n");
      out.write("                float:right;\r\n");
      out.write("                margin-right: 1em;  \r\n");
      out.write("            }\r\n");
      out.write("            #tab{\r\n");
      out.write("                padding:0px;\r\n");
      out.write("            }\r\n");
      out.write("            .scroll{\r\n");
      out.write("                max-height:400px;              \r\n");
      out.write("                overflow-x: hidden;\r\n");
      out.write("                overflow-y: scroll;\r\n");
      out.write("                /*overlow-y:scroll;*/\r\n");
      out.write("            }\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        \r\n");
      out.write("        <form id=\"form1\">\r\n");
      out.write("                  <nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\" >  \r\n");
      out.write("\r\n");
      out.write("                <a class=\"navbar-brand\" href=\"dashboard.jsp\"><img src=\"https://storage.googleapis.com/hrm-bucket/UI/hrdm.png\"></a>\r\n");
      out.write("                <input style=\"margin-left:40em;\" class=\"form-control mr-sm-2\" type=\"search\" placeholder=\"Search\" name=\"search\" aria-label=\"Search\">\r\n");
      out.write("                <div><button class=\"btn btn-dark\" onclick=\"fun3()\" style=\"padding:0;background-color:transparent\"><img src=\"https://png.icons8.com/ios/50/ffffff/search.png\" height=\"35\" style=\"border:10%\"></button>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div >  <button class=\"btn btn-dark\" id=\"bt\"  onclick=\"logout()\">Logout</button></div>\r\n");
      out.write("            </nav>\r\n");
      out.write("            <div class=\"jumbotron\" id=\"bons\">\r\n");
      out.write("                 <button class=\"btn \"  onclick=\"fun()\">Update</button>\r\n");
      out.write("                 <button class=\"btn \"  onclick=\"fun2()\">Delete</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            <center><h2>Search Results</h2></center>\r\n");
      out.write("                \r\n");
      out.write("                    <div class=\"jumotron jumbotron-fluid\" style=\"background-color:white; padding-bottom: 0px;margin-bottom: 0px;\">\r\n");
      out.write("               <table class=\"table table-light \" style=\"margin-left: 5px; margin-right:12px;background-color:white;\">\r\n");
      out.write("                   <thead class=\"thead-light \" style=\"border-bottom:none;\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <th width=\"4.5%\"></th>\r\n");
      out.write("                            <th width=\"5%\">ID</th>\r\n");
      out.write("                            <th width=\"13%\">Name</th>\r\n");
      out.write("                            <th width=\"15%\">Department</th>\r\n");
      out.write("                            <th width=\"9%\">Salary</th>\r\n");
      out.write("                            <th width=\"13%\">HiredDate</th>\r\n");
      out.write("                            <th width=\"14%\">Mobile</th>\r\n");
      out.write("                            <th>Email</th>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </thead>\r\n");
      out.write("                  </table>\r\n");
      out.write("            </div>\r\n");
      out.write("              \r\n");
      out.write("       <div class=\"jumbotrn\" id=\"jumbo15\" style=\"background-color:white\">\r\n");
      out.write("               <div class=\"scroll\">\r\n");
      out.write("                   <table class=\"table table-light\" style=\"margin-top:-0.8em;\">\r\n");
      out.write("                     <thead style=\"display:none;\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <th></th>\r\n");
      out.write("                            <th>ID</th>\r\n");
      out.write("                            <th>Name</th>\r\n");
      out.write("                            <th>Department</th>\r\n");
      out.write("                            <th>Salary</th>\r\n");
      out.write("                            <th>HiredDate</th>\r\n");
      out.write("                            <th>Mobile</th>\r\n");
      out.write("                            <th>Email</th>\r\n");
      out.write("\r\n");
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
                      int eid = 0, dept = 0, mgrid = 0, salary = 0;
                        String ename = "", hdate = "", email = "", phone = "", status = "", deptname = "";

                        try {
                            connection = DriverManager.getConnection(connectionURL, "hari", "hari");
                            Statement stmt = connection.createStatement();
                                           //SELECT DISTINCTROW * from employee join department on employee.dept = department.deptid where employee.empname LIKE '%HR%' or department.dept LIKE '%name%'
                            String query = "SELECT DISTINCTROW employee.empid,employee.empname,department.dept,employee.salary,employee.hiredate,employee.phone,employee.email from employee join department on employee.dept = department.deptid where employee.empname LIKE '%"+name+"%' or department.dept LIKE '%"+name+"%' or employee.email LIKE '%"+name+"%' or employee.hiredate LIKE '%"+name+"%'";
                            ResultSet rs = stmt.executeQuery(query);
                            while (rs.next()) {
                                 eid = rs.getInt(1);
                                ename = rs.getString(2);
                                deptname = rs.getString(3);
                                //mgrid = rs.getInt(4);
                                salary = rs.getInt(4);
                                hdate = rs.getString(5);
                                //jobcode = rs.getInt(7);
                                phone = rs.getString(6);
                                email = rs.getString(7);
                                if (!status.equals("Terminated")) {
      out.write("\r\n");
      out.write("                \r\n");
      out.write("                    <tbody class=\"scroll\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td><input type=\"radio\" name=\"upid\" style=\"height:20px;width:20px\" id=\"d1\" value  =\"");
      out.print( eid);
      out.write("\"></td>\r\n");
      out.write("                            <td>");
      out.print( eid);
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print( ename);
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print( deptname);
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print( salary);
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print( hdate);
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print( phone);
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print( email);
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
      out.write("                \r\n");
      out.write("            </div>\r\n");
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
      out.write("                document.getElementById('form1').action = \"fetch.jsp\";\r\n");
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
