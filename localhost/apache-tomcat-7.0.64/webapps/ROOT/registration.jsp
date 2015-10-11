<%@ page import="ru.mysite.web.client.Client" %>
<%@ page import="ru.mysite.web.client.AppDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
<form action="registration.jsp">
    <center><h1>Registration</h1></center>
    <%
        AppDAO dao = new AppDAO();

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String birth = request.getParameter("date");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String cardId = dao.selectLastCardId();
        int cardInt = Integer.parseInt(cardId);
        Client client = new Client(cardInt+1, fname, lname, birth, address, phone, email);
        if("Registration".equals(request.getParameter("register")))
        dao.create(client);
    %>
    <a class="bnt btn-primary" href="clients.jsp">
        Clients
    </a>
    <a class="bnt btn-warning" href="enter.jsp">
        Cars
    </a>
    <a class="bnt btn-primary" href="orders.jsp">
        Orders
    </a>
    <a class="bnt btn-warning" href="index.jsp">
        Checker
    </a>
    <a class="bnt btn-primary" href="registration.jsp">
        Registration
    </a>
    <center>
    <table>
        <tr>
            <td>Name</td>
            <td><input type="text" name="fname"></td>
        </tr>
        <tr>
            <td>Lastname</td>
            <td><input type="text" name="lname"></td>
        </tr>
        <tr>
            <td>Date of birth</td>
            <td><input type="date" name="date"></td>
        </tr>
        <tr>
            <td>Address</td>
            <td><input type="text" name="address"></td>
        </tr>
        <tr>
            <td>Phone</td>
            <td><input type="text" name="phone"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td><input class="btn btn-primary" type="submit" name="register" value="Registration"></td>
            <td>
            <a class="btn btn-danger" href="clients.jsp">
                check all clients
            </a>
            </td>
        </tr>
    </table>
    </center>
</form>
</body>
</html>
