<%@ page import="java.util.List" %>
<%@ page import="ru.mysite.web.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
<form action="orders.jsp">
    <center><h1>Orders</h1></center>
    <%
        AppOrderDAO dao = new AppOrderDAO();
        String date = request.getParameter("date");
        String order = request.getParameter("order");
        String amount = request.getParameter("amount");
        String status = request.getParameter("status");
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        List<Orders> applicationList = dao.selectAll();
        Orders app = new Orders();
        if ("create".equals(action)) {
            int amountInt = Integer.parseInt(amount);
            int orderInt = Integer.parseInt(order);
            app = new Orders(orderInt, date, amountInt, status);
            dao.create(app);
            applicationList = dao.selectAll();
        } else if ("remove".equals(action)) {
            int idInt = Integer.parseInt(id);
            dao.remove(idInt);
            applicationList = dao.selectAll();
        } else if ("select".equals(action)) {
            int idInt = Integer.parseInt(id);
            app = dao.selectOne(idInt);
        } else if ("update".equals(action)) {
            int idInt = Integer.parseInt(id);
            int amountInt = Integer.parseInt(amount);
            int orderInt = Integer.parseInt(order);
            app = new Orders(orderInt, date, amountInt, status);
            dao.update(idInt, app);
            applicationList = dao.selectAll();
        } else if("execute".equals(action)) {
            int idInt = Integer.parseInt(id);
            applicationList = dao.selectData(idInt);
        }


    %>
    <input type="hidden" name="id" value="<%=app.getId()%>"/>
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


    <table class="table">
        <tr>
            <td>order_id<input name="order" class="form-control" value="<%=app.getOrder_id()%>"/></td>
            <td>date<input name="date" type="date" class="form-control" value="<%=app.getDate()%>"/></td>
            <td>amount(0-10000$)<input name="amount" class="form-control" value="<%=app.getAmount()%>"/></td>
            <td>status(Compl/Progr/Cancel)<input name="status" type="text" list="stats" class="form-control" value="<%=app.getStatus()%>"/>
                <datalist id="stats">
                <option value="Cancel">
                <option value="Progr">
                <option value="Compl">
            </datalist></td>
            <td>
                <button class="btn btn-success" name="action" value="create">
                    Add
                </button>
                <button class="btn btn-primary" name="action" value="update">
                    Update
                </button>
            </td>
        </tr>
        <%
            for (Orders application1 : applicationList) {
        %>
        <tr>
            <td><%=application1.getOrder_id()%>
            </td>
            <td><%=application1.getDate()%>
            </td>
            <td><%=application1.getAmount()%>
            </td>
            <td><%=application1.getStatus()%>
            </td>
            <td>
                <a class="btn btn-danger" href="orders.jsp?action=remove&id=<%=application1.getId()%>">
                    Delete
                </a>
                <a class="btn btn-warning" href="orders.jsp?action=select&id=<%=application1.getId()%>">
                    Select
                </a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</form>
</body>
</html>
