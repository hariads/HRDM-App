<%-- 
    Document   : deleteData
    Created on : Jul 6, 2018, 11:52:41 AM
    Author     : Hariharan
--%>

<%@page import ="java.sql.*"%>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<%@page import ="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" type="image/png" href="https://storage.googleapis.com/hrm-bucket/UI/HRDM_logo%20(1).png"/>
        <title> HRDM</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="delete_style.css">

        <script >
            function deleteClick() {
                var txt;
                if (confirm("Are you sure to delete the employee details ? ")) {
                    alert('Employee details deleted successfully');
                }
                document.getElementById('del').style.display = 'none';
                document.getElementById('can').style.display = 'none';
                document.getElementById('confirmation').style.display = 'none';
                window.
            }
            function logout()
            {
                document.getElementById('form1').action = "index.jsp";
                document.getElementById('form1').method = "GET";
                return false;
            }
        </script>
        <title>HRDM</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="dashboard.jsp"><img src="https://storage.googleapis.com/hrm-bucket/UI/hrdm.png"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewEmployee.jsp">Employees</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="department.jsp">Departments</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Logout</a>
                    </li>
                </ul> 
                <form class="form-inline my-2 my-lg-0" action="fetch.jsp" method="GET">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search Employee" name="search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="border:none;outline:none;"><img src="https://png.icons8.com/ios/50/ffffff/search.png" height="35" style="border:10%"></button>
                </form>

            </div>
        </nav>
        <br>
    <center> <h2>Record Deleted</h2></center>
    <br>
        <%
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
            String ename = "", hdate = "", email = "", phone = "", status = "";

            try {
                connection = DriverManager.getConnection(connectionURL, "hari", "hari");
                String queryString = "update employee set status = ?  where empid = ?";
                /* createStatement() is used for create statement
               object that is used for 
                 sending sql statements to the specified database. */
                PreparedStatement statement = connection.prepareStatement(queryString);
                statement.setString(1, "Terminated");
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
                status = rs.getString(10);

                // sql query to insert values in the secified table.
                //String queryString = "INSERT INTO employee(empid,empname,mgrid,dept,hiredate,phone,email) VALUES (?, ?, ?,?, ?, ?,?)";
            } catch (Exception e) {
                System.out.println(e);
            } finally {
                connection.close();
            }

        %>
    <div class="jumbotron">
        <table>
            <tr>
                <th>Fields</th>
                <th>Details</th>
            </tr>
            <tr>
                <td>Employee ID</td>
                <td><%= eid%></td>
            </tr>
            <tr>
                <td>Employee Name</td>
                <td><%= ename%></td>
            </tr>
            <tr>
                <td>Department</td>
                <td><%= dept%></td>

            </tr>
            <tr>
                <td>Manager ID</td>
                <td><%= mgrid%></td>
            </tr>
            <tr>
                <td>Salary</td>
                <td><%= salary%></td>

            </tr>
            <tr>
                <td>Hired Date</td>
                <td><%= hdate%></td>
            </tr>
            <tr>
                <td>Phone No</td>
                <td><%= phone%></td>
            </tr
            <tr>
                <td>Email</td>
                <td><%= email%></td>
            </tr>
            <tr>
                <td>Status</td>
                <td><%= status%></td>
            </tr>

        </table>


    </div>

</body>
</html>