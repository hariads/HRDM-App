<%-- 
    Document   : addDepartment
    Created on : Jul 18, 2018, 3:28:55 PM
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
        <link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="CSS/insertDataFormStyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <%

            String departmentName = request.getParameter("departmentName");
            int departmentId = Integer.parseInt(request.getParameter("departmentId"));

            String connectionURL = "jdbc:mysql://127.0.0.1:3306/hr_db";

            Connection connection = null;

            PreparedStatement pstatement = null;
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            int updateQuery = 0;
            if (departmentName != null) {

                if (departmentName != "") {
                    try {

                        connection = DriverManager.getConnection(connectionURL, "hari", "hari");

                        String queryString = "INSERT INTO department(dept,deptid) VALUES (?,?)";

                        pstatement = connection.prepareStatement(queryString);

                        pstatement.setString(1, departmentName);
                        pstatement.setInt(2, departmentId);

                        updateQuery = pstatement.executeUpdate();
                        if (updateQuery != 0) {
                            System.out.println("data inserted");
                        }
                    } catch (Exception ex) {
                        System.out.println(ex);
                    }
                }
            }
        %>
        <br><br><br><br><br><br><br><h1>Department Inserted!</h1><br><br>
    <center>        <div class="row button justify-content-md-center"><button type="button" class="btn btn-success" onclick="location.href = 'dashboard.jsp'">HOME</button><br></div>
    </center>> </body>
</html>