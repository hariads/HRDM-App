<%-- 
    Document   : insertData
    Created on : Jul 4, 2018, 7:07:21 PM
    Author     : Bharath
--%>
<%@page import ="java.sql.*"%>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<%@page import ="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="update_style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HRDM</title>
    </head>
    <style>

        h1,h2{
            font-family: Arvo;
            text-align: center;
        }
        #form1{
            background-color: white;
        }
        #fnicon,#mgicon,#rpicon,#phicon,#emicon{
            margin-left: 80%;
        }
        .jumbotron{
            margin-left: 0em;
            width: 80%;
            margin-top: -4em;
            padding: 0;
            background-color: white;
            border-radius: 6px;
            border-color: black;

        }
        body{
            width: 100%;
        }
        h1,h2{
            margin:0;
        }

    </style>
    <body>
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
        <%
            String upid = request.getParameter("upid");

            String connectionURL = "jdbc:mysql://127.0.0.1:3306/hr_db";
            Connection connection = null;

            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

            int eid = 0, dept = 0, mgrid = 0, salary = 0, jobcode = 0;
            String ename = "", hdate = "", email = "", phone = "";

            try {
                connection = DriverManager.getConnection(connectionURL, "hari", "hari");
                Statement stmt = connection.createStatement();
                String query = "select * from employee where empid = " + upid + "";
                ResultSet rs = stmt.executeQuery(query);
                rs.next();
                eid = rs.getInt(1);
                ename = rs.getString(2);
                dept = rs.getInt(3);
                mgrid = rs.getInt(4);
                salary = rs.getInt(5);
                hdate = rs.getString(6);
                jobcode = rs.getInt(7);
                phone = rs.getString(8);
                email = rs.getString(9);

            } catch (Exception e) {
                System.out.println(e);
            }%>
        <br>
        <br>
        <div class="row justify-content-center">
            <div class="jumbotron jumbotron-fluid">
                <br>
                <h1>HRDM</h1><br>
                <h2>UPDATE  EMPLOYEE  DETAILS</h2>
                <div class="col">
                    <br><br>
                    <form name = "myForm" id="form2">
                        <div class="row justify-content-md-center">
                            <div class="col-sm-2"></div><div class="col-sm-9"><input type="text"   style="display:none;" placeholder="<%= eid%>" class="form-control" id="exampleFormControlInput1" name="empid" value="<%= eid%>" readonly="readonly"></div>
                            <div class="col-sm-2"><img id="fnicon" src="https://png.icons8.com/ios-glyphs/26/000000/guest-male.png"></div><div class="col-sm-9"><input style="max-width:400px" type="text" placeholder="<%= ename%>" onkeypress="return valid_Employee_name(event)" class="form-control" id="exampleFormControlInput1" name="empname" value="<%= ename%>" required="required"></div><br><br><br>

                            <div class="col-sm-2"><img id="mgicon" src="https://png.icons8.com/metro/26/000000/businessman.png"></div><div class="col-sm-9"> <select style="max-width:400px" name="mgrid" class="form-control" id="exampleFormControlInput1"> 
                                    <option value="0">NONE</option>
                                    <%

                                        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                                        int id = 0;
                                        String name = "";
                                        try {
                                            connection = DriverManager.getConnection(connectionURL, "hari", "hari");
                                            Statement stmt = connection.createStatement();
                                            String query = "select empid,empname from employee where jobcode=120";
                                            ResultSet rs = stmt.executeQuery(query);
                                            while (rs.next()) {
                                                id = rs.getInt(1);
                                                name = rs.getString(2);
                                    %>



                                    <option value=<%= id%>><%= id%>-<%= name%></option>
                                    <% }
                                        } catch (Exception e) {
                                            System.out.println(e);
                                        }

                                    %>
                                </select></div><br><br><br>
                            <div class="col-sm-2"><img id="rpicon" src="https://png.icons8.com/ios-glyphs/26/000000/rupee.png"></div><div class="col-sm-9"><input style="max-width:400px" type="text" placeholder="Enter Salary" name="sal" class="form-control" id="exampleFormControlInput1" value="<%= salary%>" required="required"></div><br><br><br>                           
                            <div class="col-sm-2"><img id="phicon" src="https://png.icons8.com/android/26/000000/phone.png"></div><div class="col-sm-9"><input style="max-width:400px" type="tel" minlength="10" maxlength="10" class="form-control" id="exampleFormControlInput1" placeholder="Enter Mobile Number" name="phone" class="form-control" id="exampleFormControlInput1" value="<%= phone%>" onkeypress="return valid_Employee_phone(event)" required="required"></div><br><br><br>
                            <div class="col-sm-2"><img id="emicon" src="https://png.icons8.com/ios-glyphs/26/000000/secured-letter.png"></div><div class="col-sm-9"><input style="max-width:400px" type="email" placeholder="Enter E-mail id" name="email" class="form-control" id="exampleFormControlInput1" value="<%= email%>" required="required"></div>
                            <br><br><br>
                            <div class="col-sm-3"><button type="submit" class="btn btn-dark" onclick="updateData()">Update</button></div>
                            <br>
                            <br>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <script>
            function updateData() {
                var retVal = confirm("Do you want to continue ?");
                if (retVal == true) {
                    document.getElementById('form2').action = "updateDataForm.jsp";
                    document.getElementById('form2').method = "GET";
                    return true;
                } else {
                    document.getElementById('form2').action = "dashboard.jsp";
                    return false;
                }
            }
            function valid_Employee_name(event)
            {
                var emp_first_name = event.which;
                if ((emp_first_name < 65 || emp_first_name > 90) && (emp_first_name < 97 || emp_first_name > 122))
                {
                    return false;
                }
            }
            function valid_Employee_phone(event)
            {
                var phone = event.which;
                if (phone < 48 || phone > 57)
                {
                    ``
                    return false;
                }
            }
        </script>
    </body>
</html>