<%-- 
    Document   : updateForm
    Created on : Jul 6, 2018, 5:47:19 PM
    Author     : Hariharan
--%>

<%@page import ="java.sql.*"%>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet">

    <head>
        <title>HRDM</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            .scroll{
                max-height:400px;              
                overflow-x: hidden;
                overflow-y: scroll;
                /*overlow-y:scroll;*/
            }
            #bt{

                background-repeat:no-repeat;
                border: none;
                overflow: hidden;
                outline:none;

            }
            .btn:hover{
                background-color: #000000;
            }
            #jumbo1{
                float: right;
                margin-right: 2em;            }
            #jumbo2{
                padding-top:0px;
            }
            .jumbotron-fluid{

                font-size: 20px;
            }

        </style>
    </head>
    <body style="background-color:white; overflow-x: hidden;">


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
                    <li class="nav-item active">
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
        <form id="form1" style="background-color:white" style="max-width:100%;">        

            <div clas="jumbotron" id="jumbo1" style="margin-top:1em; margin-bottom: 1em;">
                <button class="btn  btn-sm btn-dark" id="bt" style="width: 5em;  height: 3em;" onclick="insert()">Add</button>
                <button class="btn btn-sm btn-dark" id="bt" style="width: 5em;  height: 3em;" onclick="update()">Update</button>
                <button class="btn btn-sm  btn-dark" id="bt" style="width: 5em;  height: 3em;" onclick="deleteemp()">Delete</button>
            </div>
            <center><h2>Employee Table</h2></center>

            <br>
            

            <div class="jumotron jumbotron-fluid" style="background-color:white; padding-bottom: 0px;margin-bottom: 0px;">
                <table class="table table-light" style="margin-left: 5px; margin-right:12px;background-color:white;">
                    <thead class="thead-light" style="border-bottom:none;">
                        <tr>
                            <th width="4%"></th>
                            <th width="5%">ID</th>
                            <th width="12%">Name</th>
                            <th width="12%">Department</th>
                            <th width="9%">Salary</th>
                            <th width="13%">HiredDate</th>
                            <th width="14%">Mobile</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                </table>
            </div>

            <div class="jumbotrn" id="jumbo15" style="background-color:white">
                <div class="scroll">
                    <table class="table table-light" style="margin-top:-0.8em;">
                        <thead style="display:none;">
                            <tr>
                                <th></th>
                                <th  >ID</th>
                                <th>Name</th>
                                <th>Department</th>
                                <th>Salary</th>
                                <th>HiredDate</th>
                                <th>Mobile</th>
                                <th>Email</th>

                            </tr>
                        </thead>
                        <%

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
                                String query = "select employee.empid,employee.empname,department.dept,employee.salary,employee.hiredate,employee.phone,employee.email,employee.status from employee join department where employee.dept = department.deptid order by empname";
                                ResultSet rs = stmt.executeQuery(query);
                                if (rs != null) {
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
                                        status = rs.getString(8);
                                        if (!status.equals("Terminated")) {%>

                        <tbody class="scroll">
                        <td ><input type="radio" name="upid" style="height:20px;width:20px" id="d1" value  ="<%= eid%>" checked="checked"></td>
                        <td ><%= eid%></td>
                        <td ><%= ename%></td>
                        <td ><%= deptname%></td>
                        <td ><%= salary%></td>
                        <td ><%= hdate%></td>
                        <td ><%= phone%></td>
                        <td ><%= email%></td>
                        </tr>
                        </tbody>


                        <% }
                            }
                        } else {
                        %><h1>NO RECORDS FOUND</h1><%
                                }
                            } catch (Exception e) {
                                System.out.println(e);
                            }
                        %></table></div>
            </div>
        </form>
        <script>
            function update()
            {
                document.getElementById('form1').action = "updateForm.jsp";
                document.getElementById('form1').method = "GET";
                return false;
            }
            function insert()
            {
                document.getElementById('form1').action = "insertDataForm.jsp";
                document.getElementById('form1').method = "GET";
                return false;
            }

            function logout()
            {
                document.getElementById('form1').action = "index.jsp";
                document.getElementById('form1').method = "GET";
                return false;
            }
            function deleteemp()
            {
                var retVal = confirm("Do you want to delete ?");
                if (retVal == true) {
                    document.getElementById('form1').action = "deleteData.jsp";
                    document.getElementById('form1').method = "GET";
                    return true;
                } else {
                    document.getElementById('form1').action = "viewEmployee.jsp";
                    return false;
                }
            }

        </script>

    </body>
</html>