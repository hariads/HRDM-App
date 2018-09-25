<%-- 
    Document   : updateDataorm
    Created on : Jul 9, 2018, 12:01:45 PM
    Author     : Santhosh Kumar
--%>
<%@page import ="java.sql.*"%>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<%@page import ="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HRDM</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="CSS/insertDataFormStyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="https://www.connectinternetsolutions.com/wp-content/uploads/2016/02/12-Courses-for-Starting-Your-Web-Development-Journey.jpg">
        <%
            String empid = request.getParameter("empid");
            String empname = request.getParameter("empname");
//            int dept = Integer.parseInt(request.getParameter("dept"));
            int mgrid = Integer.parseInt(request.getParameter("mgrid"));
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            int salary = Integer.parseInt(request.getParameter("sal"));

            //empid empname dept mgrid salary hiredate jobcode phone email empwd
            /* Create string of connection url within specified 
       format with machine name, 
                        

            
        port number and database name. Here machine name id 
        localhost and database name is student. */
            // declare object of Statement interface that uses for 
            //executing sql statements.
            String connectionURL = "jdbc:mysql://127.0.0.1:3306/hr_db";
            Connection connection = null;
            PreparedStatement pstatement = null;
            // Load JBBC driver "com.mysql.jdbc.Driver"
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            int updateQuery = 0;
            // check if the text box is empty
            if (empid != null) {
                // check if the text box having only blank spaces
                if (empid != "") {
                    try {
                        /* Create a connection by using getConnection()
                  method that takes parameters of string type 
                  connection url, user name and password to connect 
                    to database. */
                        connection = DriverManager.getConnection(connectionURL, "hari", "hari");
                        // sql query to insert values in the secified table.
                        //String queryString = "INSERT INTO employee(empid,empname,mgrid,dept,hiredate,phone,email) VALUES (?, ?, ?,?, ?, ?,?)";
                        String queryString = "UPDATE employee SET empname = ? , phone = ? , email = ? ,mgrid = ?,salary = ?  where empid = ?";
                        //empid empname dept mgrid salary hiredate jobcode phone email empwd
                        /* createStatement() is used for create statement
                  object that is used for 
                    sending sql statements to the specified database. */
                        pstatement = connection.prepareStatement(queryString);

                        pstatement.setString(1, empname);
                        pstatement.setString(2, phone);
                        pstatement.setString(3, email);
                        pstatement.setInt(4, mgrid);
                        pstatement.setInt(5, salary);
                        pstatement.setString(6, empid);

                        //pstatement.setInt(3, phone);
                        //pstatement.setString(4, email);
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
        <br><br><br><br><br><br><br><h1>Employee Detail Updated!</h1><br><br>
        <div class="row button justify-content-md-center"><button type="button" class="btn btn-success" onclick="location.href = 'dashboard.jsp'">HOME</button><br></div>

    </body>
</html>
