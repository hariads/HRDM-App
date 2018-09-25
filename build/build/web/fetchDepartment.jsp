<%@page import ="java.sql.*"%>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" type="image/png" href="https://storage.googleapis.com/hrm-bucket/UI/HRDM_logo%20(1).png"/>
        <title> HRDM</title>
        <link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            th,td{
                padding-right: 2em;
                padding-left: 2em;

            }
            .jumbo2{
                padding:0px;
                margin:0px;
            }
            #bt{
                border-radius:0; 
                background-repeat:no-repeat;
                border: none;
                overflow: hidden;
                outline:none;
            }
            .jumbotron{
                width: 50%;
                margin-left: 25em;
                margin-top: 4em;
            }
            tr,td,th{
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse" >  
            <div class="container-fluid" >
                <div class="navbar-header" style="margin-top:-5px;"> <a class="navbar-brand" href="dashboard.jsp"><img src="https://storage.googleapis.com/hrm-bucket/UI/hrdm.png" ></a></div>
                <button type="button" class="btn" id="bt"  onclick="location.href = 'dashboard.jsp'" style="background-color:transparent;color:white;margin-top:0.4em;">Home</button>
                <button type="button" class="btn" id="bt"  onclick="location.href = 'viewEmployee.jsp'" style="background-color:transparent;color:white;margin-top:0.4em;">Employees</button>
                <button type="button" class="btn" id="bt"  onclick="location.href = 'department.jsp'" style="background-color:transparent;color:white;margin-top:0.4em;">Department</button>
                <button type="button" class="btn" id="bt"  onclick="location.href = 'index.jsp'" style="background-color:transparent;color:white;margin-top:0.4em;">Logout</button></li>
                <form action="fetchDepartment.jsp" method="GET" style="float:right;" >         
                    <input class="form-control mr-sm-2" type="search" style="display:inline;max-width:150px;margin-top:0.4em;" placeholder="Search" name="search" aria-label="Search" style="margin-top:0.4em;">
                    <button class="btn" type="submit" style="background-color:transparent; float:right; display: inline;"><img src="https://png.icons8.com/ios/50/ffffff/search.png" height="35"></button>
                </form> 
            </div></nav>


        <form id="form1">        
            <center><h2 style="margin-top:2em;">Search Results Of Departments</h2></center>

            <div class="jumbotron" id="jumbo2" style="background-color:white; padding: 0px;">
                <table class="table" width="80%" style="background-color:white;">
                    <thead >
                        <tr>
                            <th style="border-bottom: 2px solid;">Department ID</th>
                            <th style="border-bottom: 2px solid;">Department Name</th>

                        </tr>
                    </thead>
                    <%
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
                            String query = "SELECT deptid,dept from department where department.dept LIKE '%" + name + "%' or department.deptid LIKE '%" + name + "%'";
                            ResultSet rs = stmt.executeQuery(query);
                            while (rs.next()) {
                                deptid = rs.getInt(1);
                                deptname = rs.getString(2);
                                {%>

                    <tbody>
                        <tr>
                            <td><%= deptid%></td>
                            <td><%= deptname%></td>
                        </tr>
                    </tbody>


                    <% }
                            }
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %></table>

            </div>
        </form>


    </body>
</html>