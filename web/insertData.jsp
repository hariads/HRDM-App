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
        <link rel="stylesheet" type="text/css" href="CSS/insertDataFormStyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body onload="location.href = 'dashboard.jsp'">

        <%

            String empname = request.getParameter("empFirstName") + " " + request.getParameter("empLastName");
            int dept = Integer.parseInt(request.getParameter("dept"));
            int mgrid = Integer.parseInt(request.getParameter("mgrid"));
            int salary = 2000;
            String hiredate = request.getParameter("hiredate");
            int jobcode = Integer.parseInt(request.getParameter("jobcode"));
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");

            String connectionURL = "jdbc:mysql://127.0.0.1:3306/hr_db";

            Connection connection = null;

            PreparedStatement pstatement = null;
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            int updateQuery = 0;
            if (empname != null) {

                if (empname != "") {
                    try {

                        connection = DriverManager.getConnection(connectionURL, "hari", "hari");
                        String salquery = "select maxsalary from job where jobcode=" + jobcode + "";
                        Statement stmt = connection.createStatement();
                        ResultSet rs = stmt.executeQuery(salquery);
                        rs.next();
                        salary = rs.getInt(1);

                        String queryString = "INSERT INTO employee(empname,dept,mgrid,salary,hiredate,jobcode,phone,email) VALUES (?,?,?,?,?,?,?,?)";

                        pstatement = connection.prepareStatement(queryString);

                        pstatement.setString(1, empname);
                        pstatement.setInt(2, dept);
                        pstatement.setInt(3, mgrid);
                        pstatement.setInt(4, salary);
                        pstatement.setString(5, hiredate);
                        pstatement.setInt(6, jobcode);
                        pstatement.setString(7, phone);
                        pstatement.setString(8, email);

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
    </body>
</html>