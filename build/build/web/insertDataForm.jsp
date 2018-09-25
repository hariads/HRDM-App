<%-- 
    Document   : index
    Created on : Jul 4, 2018, 6:18:05 PM
    Author     : Bharath
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="Form_validation.js" ></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet">
        <style>
            .jumbotron{
                width: 100%;
                background-color: white;
            }
            .justify-content-md-center
            {
                margin-right: 4em;
            }
        </style>



    </head>

    <body onload="displayDate()">

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="dashboard.jsp"><img src="https://storage.googleapis.com/hrm-bucket/UI/hrdm.png"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
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
        <div class="row justify-content-md-center">
            <div class="col-lg-2"></div>
            <div class="col-lg-6">
                <div class="container" id="form1">
                    <br>          <h2>New Employee details Form</h2>

                    <form name ="insertEmpForm" action="insertData.jsp" method="GET">
                        <div class="jumbotron jumbotron-fluid">
                            <div class="row justify-content-md-center">

                                <div class="col-sm-1"><img id="fnicon" src="https://png.icons8.com/ios-glyphs/26/000000/guest-male.png" width="40px" height="40px" style="margin-left:-30px"></div>&nbsp;<div class="col-sm-5"><input type="text" placeholder="First Name" style="margin-left:-20px" name="empFirstName" class="form-control" id="ip1" onkeypress="return valid_Employee_name(event)" required="required"><p id="p1" style="display:none;color:red">Input Invalid</p></div><br><br><p style="margin-left:"></p><div class="col-sm-5"><input type="text" placeholder="Last Name" name="empLastName" class="form-control" id="ip2" onkeypress="return valid_Employee_name(event)"  required="required"><p id="p1" style="display:none;color:red">Input Invalid</p></div><br><br><br>
                                <div class="col-sm-1"><img id="mgicon" src="https://png.icons8.com/metro/26/000000/businessman.png" width="35px" height="35px" style="margin-left:-15px"></div><div class="col-sm-11">
                                    <select name="mgrid" class="form-control" id="exampleFormControlInput1">
                                        <option value="0">NONE</option>
                                        <% String connectionURL = "jdbc:mysql://127.0.0.1:3306/hr_db";
                                            Connection connection = null;
                                            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                                            int eid = 0;
                                            String ename = "";
                                            try {
                                                connection = DriverManager.getConnection(connectionURL, "hari", "hari");
                                                Statement stmt = connection.createStatement();
                                                String query = "select empid,empname from employee where jobcode=120";
                                                ResultSet rs = stmt.executeQuery(query);
                                                while (rs.next()) {
                                                    eid = rs.getInt(1);
                                                    ename = rs.getString(2);
                                        %>



                                        <option value=<%= eid%>><%= eid%>-<%= ename%></option>
                                        <% }
                                            } catch (Exception e) {
                                                System.out.println(e);
                                            }

                                        %>
                                    </select></div><br><br><br>
                                <div class="col-sm-1"><img id="depticon" src="https://png.icons8.com/ios/50/000000/department-filled.png" width="35px" height="35px" style="margin-left:-15px"></div><div class="col-sm-11">
                                    <select name="dept" class="form-control" id="exampleFormControlInput1">
                                        <%                                           Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                                            int deptid = 0;
                                            String dept = "";
                                            try {
                                                connection = DriverManager.getConnection(connectionURL, "hari", "hari");
                                                Statement stmt = connection.createStatement();
                                                String query = "select deptid,dept from department";
                                                ResultSet rs = stmt.executeQuery(query);
                                                while (rs.next()) {
                                                    deptid = rs.getInt(1);
                                                    dept = rs.getString(2);

                                        %> <option value="<%= deptid%>"><%= dept%></option>
                                        <% }
                                            } catch (Exception e) {
                                                System.out.println(e);
                                            }

                                        %>

                                    </select>
                                </div><br><br><br>
                                <div class="col-sm-1"><img src="https://png.icons8.com/ios/50/000000/briefcase-filled.png" width="35px" height="35px" style="margin-left:-15px"></div><div class="col-sm-11">

                                    <select name="jobcode" class="form-control" id="exampleFormControlInput1">
                                        <%  Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                                            int jobcode = 0;
                                            String desig = "";
                                            try {
                                                connection = DriverManager.getConnection(connectionURL, "hari", "hari");
                                                Statement stmt = connection.createStatement();
                                                String query = "select jobcode,jobname from job";
                                                ResultSet rs = stmt.executeQuery(query);
                                                while (rs.next()) {
                                                    jobcode = rs.getInt(1);
                                                    desig = rs.getString(2);
                                        %>



                                        <option value=<%= jobcode%>><%= desig%></option>
                                        <% }
                                            } catch (Exception e) {
                                                System.out.println(e);
                                            }

                                        %>

                                    </select></div><br><br><br>

                                <div class="col-sm-1"><img id="hdicon" src="https://png.icons8.com/ios/50/000000/calendar-filled.png" width="35px" height="35px" style="margin-left:-15px"></div><div class="col-sm-11"><input  type="date" id="hiredate" class="form-control" name="hiredate" readonly="readonly"></div><br><br><br>
                                <div class="col-sm-1"><img id="phicon" src="https://png.icons8.com/android/26/000000/phone.png" style="margin-left:-15px"></div><div class="col-sm-11"><input type="tel" maxlength="10" minlength="10" class="form-control" id="exampleFormControlInput1" placeholder="Enter Mobile Number"  id="phone" name="phone" onkeypress="return valid_Employee_phone(event)" required="required"></div><br><br><br>
                                <div class="col-sm-1" ><img id="mailicon" src="https://png.icons8.com/ios/50/000000/new-post-filled.png" height="35px" width="35px" style="margin-left:-15px" ></div><div class="col-sm-11"><input  type="email" placeholder="Enter E-mail id" name="email" class="form-control" id="email1" required="required"></div>
                                <br><br><br>
                                <div class="col-sm-6">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<button class="btn btn-dark" onsubmit="fun()" type="submit">Submit</button></div>
                                <br>
                                <br>
                            </div>

                        </div>
                    </form>                  
                </div>
                <div class="col-lg-4"></div> 
            </div>

        </div>
        <script>
            function valid_Employee_name(event)
            {
                var emp_first_name = event.which;
                if ((emp_first_name < 65 || emp_first_name > 90) && (emp_first_name < 97 || emp_first_name > 122))
                {
                    return false;
                }
            }

            function displayDate() {
                document.getElementById("hiredate").valueAsDate = new Date();
            }

            $("#ip1, #ip2").keyup(function () {
                update();
            });
            function valid_Employee_phone(event)
            {
                var phone = event.which;
                if (phone < 48 || phone > 57)
                {
                    ``
                    return false;
                }
            }
            function update() {
                $("#email1").val($('#ip1').val() + "." + $('#ip2').val() + "@pramati.com");
            }
        </script>
    </body>
</html>










