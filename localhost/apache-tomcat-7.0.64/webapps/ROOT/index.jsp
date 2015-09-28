<%--
  Created by IntelliJ IDEA.
  User: Ирина
  Date: 25.09.2015
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
        import="ru.mysite.web.*, java.util.*" %>
<html>
<head>
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
<form action="start" method="get">
    <center><h1>Checker</h1></center>
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

    First name <input type="text" name="fname"/>
    Last name <input type="text" name="lname"/>
    <input type="submit" name="enter" value="check"/>
    </center>
</form>

</body>
</html>
