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
        <link rel="stylesheet" type="text/css" href="dashboard_style.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
    </head>

    <title>Dashboard</title>
</head>
<body>
    <!--    <nav class="navbar navbar-dark bg-dark justify-content-between">
            <a class="navbar-brand"><img src="https://storage.googleapis.com/hrm-bucket/UI/hrdm.png"></a>
      
            <a class="nav-link" href="dashboard.jsp">Home <span class="sr-only">(current)</span></a>
          
         
            <a class="nav-link" href="viewEmployee.jsp">Employee <span class="sr-only">(current)</span></a>
          
        
            <a class="nav-link" href="department.jsp">Department <span class="sr-only">(current)</span></a></li>
      
            <form class="form-inline" id="form1">
                <div><input class="form-control mr-sm-2"  name="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-dark" onclick="fun()" style="padding:0;background-color:transparent"><img src="https://png.icons8.com/ios/50/ffffff/search.png" height="35" style="border:10%"></button>
                </div>
                <button class="btn btn-dark my-2 my-sm-0" onclick="logout()">Logout</button>
            </form>
        </nav>-->
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
    <div class="row justify-content-center">
        <div class="col-lg-5 border jumbotron jumbotron-fluid" onclick="location.href = 'viewEmployee.jsp'" style="cursor: pointer;" id="jumbo1" >
            <div class="row" id="content">
                <div class="col-lg-8"><img src="https://png.icons8.com/ios/50/000000/conference-call-filled.png"><br>
                    <h4 style="font-size: 40px;">Employees</h4>
                    <a href="#" class="fill-div"></a>
                </div>
                <div class="col-lg-4" id="empnum"><%
                    String connectionURL = "jdbc:mysql://127.0.0.1:3306/hr_db";

                    Connection connection = null;

                    PreparedStatement pstatement = null;
                    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                    int count = 0;
                    try {
                        connection = DriverManager.getConnection(connectionURL, "hari", "hari");
                        Statement stmt = connection.createStatement();
                        String query = "select count(*) from employee where status='Active'";
                        ResultSet rs = stmt.executeQuery(query);
                        rs.next();
                        count = rs.getInt(1);
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                    %>
                    <span style="padding: 50px;"><%= count%></span></div>
            </div>
        </div>
        <div class="col-lg-2"></div>
        <div class="col-lg-5 border jumbotron jumbotron-fluid" onclick="location.href = 'department.jsp'" style="cursor: pointer;" id="jumbo2" >
            <div class="row" id="content">
                <div class="col-lg-8"><img src="https://png.icons8.com/ios/50/000000/department-filled.png">
                    <h4 style="font-size: 40px;">Departments</h4>
                </div>
                <div class="col-lg-4" id="depnum"><%

                    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                    int count_dept = 0;
                    try {
                        connection = DriverManager.getConnection(connectionURL, "hari", "hari");
                        Statement stmt = connection.createStatement();
                        String query = "select count(*) from department ";
                        ResultSet rs = stmt.executeQuery(query);
                        rs.next();
                        count_dept = rs.getInt(1);
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                    %>
                    <span style="padding: 50px;"><%= count_dept%></span></div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer font-small" style="background-color:white ">

        <!-- Copyright -->
        <div class="footer-copyright text-center py-3" style="color:black">Powered by :&nbsp;
            <a href="dashboard.jsp"><img src="https://storage.googleapis.com/hrm-bucket/UI/hrdm.png" hight="30px"width="70px"></a>
        </div>
        <!-- Copyright -->

    </footer>
    <!-- Footer -->
</body>
</html>