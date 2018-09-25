package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.Date;

public final class deleteData_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css\" integrity=\"sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB\" crossorigin=\"anonymous\">\r\n");
      out.write(" <link rel=\"stylesheet\" type=\"text/css\" href=\"delete_style.css\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <script >\r\n");
      out.write("            function deleteClick() {\r\n");
      out.write("                var txt;\r\n");
      out.write("                if (confirm(\"Are you sure to delete the employee details ? \")) {\r\n");
      out.write("                    alert('Employee details deleted successfully');\r\n");
      out.write("                }\r\n");
      out.write("                document.getElementById('del').style.display = 'none';\r\n");
      out.write("                document.getElementById('can').style.display = 'none';\r\n");
      out.write("                document.getElementById('confirmation').style.display = 'none';\r\n");
      out.write("                window.\r\n");
      out.write("            }\r\n");
      out.write("     function logout()\r\n");
      out.write("            {\r\n");
      out.write("                document.getElementById('form1').action = \"index.jsp\";\r\n");
      out.write("                document.getElementById('form1').method = \"GET\";\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("        </script>\r\n");
      out.write("<title>HRDM</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("         <nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\" > \r\n");
      out.write("                <a class=\"navbar-brand\" href=\"dashboard.jsp\"><img src=\"https://storage.googleapis.com/hrm-bucket/UI/hrdm.png\"></a><div >  <button class=\"btn btn-dark\" id=\"bt\"  onclick=\"location.href='dashboard.jsp'\">Home</button></div>\r\n");
      out.write("<!--                <input style=\"margin-left:40em;\" class=\"form-control mr-sm-2\" type=\"search\" placeholder=\"Search\" name=\"search\" aria-label=\"Search\">\r\n");
      out.write("                <div><button class=\"btn btn-dark\" onclick=\"fun3()\" style=\"padding:0;background-color:transparent\"><img src=\"https://png.icons8.com/ios/50/ffffff/search.png\" height=\"35\" style=\"border:10%\"></button>\r\n");
      out.write("                </div>-->\r\n");
      out.write("                <div style=\"margin-left:65em;\">  <button class=\"btn btn-dark\" id=\"bt\"  onclick=\"logout()\">Logout</button></div>\r\n");
      out.write("            </nav>\r\n");
      out.write("        <br>\r\n");
      out.write("    <center> <h2>Record Deleted</h2></center>>\r\n");
      out.write("        ");

            String delid = request.getParameter("upid");

            System.out.println(delid);
            /* Create string of connection url within specified 
    format with machine name, 
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
            String ename = "", hdate = "", email = "", phone = "",status="";

            try {
                connection = DriverManager.getConnection(connectionURL, "hari", "hari");
                 String queryString = "update employee set status = ?  where empid = ?";
                /* createStatement() is used for create statement
               object that is used for 
                 sending sql statements to the specified database. */
                PreparedStatement statement = connection.prepareStatement(queryString);
                statement.setString(1,"Terminated");
                statement.setInt(2, Integer.parseInt(delid));
                statement.executeUpdate();
                System.out.println("Employee record " + delid + " deleted");
                
                Statement stmt = connection.createStatement();
                String query = "select * from employee where empid = " + delid + "";
                ResultSet rs = stmt.executeQuery(query);
                rs.next();
                eid = rs.getInt(1);
                ename = rs.getString(2);
                dept = rs.getInt(3);
                mgrid = rs.getInt(4);
                salary = rs.getInt(5);
                hdate = rs.getString(6);
                
                phone = rs.getString(8);
                email = rs.getString(9);
                status=rs.getString(10);

                // sql query to insert values in the secified table.
                //String queryString = "INSERT INTO employee(empid,empname,mgrid,dept,hiredate,phone,email) VALUES (?, ?, ?,?, ?, ?,?)";
               
            } catch (Exception e) {
                System.out.println(e);
            } finally {
                connection.close();
            }

        
      out.write("\r\n");
      out.write("        <div class=\"jumbotron\">\r\n");
      out.write("            <table>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th>Fields</th>\r\n");
      out.write("                    <th>Details</th>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>Employee ID</td>\r\n");
      out.write("                    <td>");
      out.print( eid);
      out.write("</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>Employee Name</td>\r\n");
      out.write("                    <td>");
      out.print( ename);
      out.write("</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>Department</td>\r\n");
      out.write("                    <td>");
      out.print( dept);
      out.write("</td>\r\n");
      out.write("\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>Manager ID</td>\r\n");
      out.write("                    <td>");
      out.print( mgrid);
      out.write("</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>Salary</td>\r\n");
      out.write("                    <td>");
      out.print( salary);
      out.write("</td>\r\n");
      out.write("\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>Hired Date</td>\r\n");
      out.write("                    <td>");
      out.print( hdate);
      out.write("</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>Phone No</td>\r\n");
      out.write("                    <td>");
      out.print( phone);
      out.write("</td>\r\n");
      out.write("                </tr\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>Email</td>\r\n");
      out.write("                    <td>");
      out.print( email);
      out.write("</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>Status</td>\r\n");
      out.write("                    <td>");
      out.print( status);
      out.write("</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("            </table>\r\n");
      out.write("\r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
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
