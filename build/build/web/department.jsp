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
    <head>
        <link rel="shortcut icon" type="image/png" href="https://storage.googleapis.com/hrm-bucket/UI/HRDM_logo%20(1).png"/>
        <title> HRDM</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="Form_validation.js" ></script>
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>

            .btn-dark{
                background-color:black;
                color:white;
            }

            .jumbotron{
                width: 50%;
                margin-left: 25em;
                margin-top: 4em;
            }
            h2{
                font-family: Roboto Slab;
            }
            tr,td,th{
                font-size: 20px;
            }
        </style>
    </head>
    <title>HRDM</title>
    <body style="background-color:white">


        <nav class="navbar navbar-inverse" >  
            <div class="container-fluid" >
                <div class="navbar-header" style="margin-top:-5px;"> <a class="navbar-brand" href="dashboard.jsp"><img src="https://storage.googleapis.com/hrm-bucket/UI/hrdm.png" ></a></div>
                <button type="button" class="btn" id="bt"  onclick="location.href = 'dashboard.jsp'" style="background-color:transparent;color:white;margin-top:0.4em;">Home</button>
                <button type="button" class="btn" id="bt"  onclick="location.href = 'viewEmployee.jsp'" style="background-color:transparent;color:white;margin-top:0.4em;">Employees</button>
                <button type="button" class="btn" id="bt"  onclick="location.href = 'department.jsp'" style="background-color:transparent;color:white;margin-top:0.4em;">Department</button>
                <button type="button" class="btn" id="bt"  onclick="location.href = 'index.jsp'" style="background-color:transparent;color:white;margin-top:0.4em;">Logout</button></li>
                <form action="fetchDepartment.jsp" method="GET" style="float:right;" >         
                    <input class="form-control mr-sm-2" type="search" style="display:inline;max-width:180px;margin-top:0.4em;" placeholder="Search Department" name="search" aria-label="Search" style="margin-top:0.4em;">
                    <button class="btn" type="submit" style="background-color:transparent; float:right; display: inline;"><img src="https://png.icons8.com/ios/50/ffffff/search.png" height="35"></button>
                </form> 
            </div></nav>
        <form id="form1" style="background-color:white" >
            <center><h2>Departments</h2></center>
            <button style="margin-right: 20em;float: right;" type="button" class="btn btn-dark" style="margin-top: -2em;" data-toggle="modal" data-target="#myModal">Insert</button>

            <div class="jumbotron" id="jumbo2" style="background-color:white; padding: 0px;">
                <table class="table" width="80%">
                    <thead >
                        <tr>
                            <th style="border-bottom: 2px solid;">Department ID</th>
                            <th style="border-bottom: 2px solid;">Department Name</th>

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
                                {%>

                    <tbody>
                        <tr>
                            <!--<td><input type="radio" name="upid" style="height:20px;width:20px" id="d1" value  ="<%= deptid%>"></td>-->
                            <td ><%= deptid%></td>
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

        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <center>   <h4 class="modal-title">Fill Department Details</h4></center>
                    </div> 
                    <div class="modal-body">
                        <form name ="myForm" action="addDepartment.jsp" method="GET">
                            <div class="row justify-content-md-center" style="width:90%;">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-1"><label><i class="fa fa-id-card" style="font-size:36px"></i></label>
                                </div><div class="col-sm-1"></div>
                                <div class="col-sm-5">
                                    <input  type="text" class="form-control" id="Depart_id" placeholder="Department id" name="departmentId" required="required"> </div><br><br><br><br>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-1"><label><img src="https://png.icons8.com/ios/50/000000/department-filled.png"></label></div><div class="col-sm-1"></div><div class="col-sm-5"><input type="text" id = "Depart_name" placeholder="Department Name" name="departmentName" class="form-control" required="required" onkeypress = "return valid_Employee_name(event)"></div><br><br><br><br>
                                <button class="btn btn-dark" type="submit"style="margin-left:20em;" >Submit</button>
                                <button class="btn btn-dark" type="reset" >Reset</button>

                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">


                    </div>
                </div>

            </div>
        </div>
        <script>

//            function search()
//            {
//                document.getElementById('form1').action = "fetchDepartment.jsp";
//                document.getElementById('form1').method = "GET";
//                return false;
//            }


        </script>

    </body>
</html>