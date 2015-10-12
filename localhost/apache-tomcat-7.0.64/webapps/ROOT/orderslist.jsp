<%@ page import="java.util.List" %>
<%@ page import="ru.mysite.web.*" %>
<%@ page import="ru.mysite.web.order.AppOrderDAO" %>
<%@ page import="ru.mysite.web.order.Orders" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
<form action="orderslist.jsp">
    <center><h1>Orders</h1></center>
    <%
        AppOrderDAO dao = new AppOrderDAO();
        String date = request.getParameter("date");
        String order = request.getParameter("order");
        String amount = request.getParameter("amount");
        String status = request.getParameter("status");
        String id = request.getParameter("id");
        int idInt = Integer.parseInt(id);
        int orderInt = Integer.parseInt(order);
        String action = request.getParameter("action");
        List<Orders> applicationList = dao.selectData(orderInt);

        Orders app = new Orders();
        if ("create".equals(action) && Integer.parseInt(amount) <= 10000) {
            int amountInt = Integer.parseInt(amount);
            if(date.equals("")){
                app = new Orders(orderInt, "1900-01-01", amountInt, status);
                dao.create(app);
                applicationList = dao.selectData(orderInt);
            }else {
                app = new Orders(orderInt, date, amountInt, status);
                dao.create(app);
                applicationList = dao.selectData(orderInt);
            }
        } else if ("remove".equals(action)) {
            dao.remove(idInt);
            applicationList = dao.selectData(orderInt);
        } else if ("select".equals(action)) {
            app = dao.selectOneCard(idInt);
        } else if ("update".equals(action)) {
            int amountInt = Integer.parseInt(amount);
            app = new Orders(orderInt, date, amountInt, status);
            dao.update(idInt, app);
            applicationList = dao.selectData(orderInt);
        } else if("execute".equals(action)) {
            applicationList = dao.selectData(orderInt);
        }


    %>
    <input type="hidden" name="id" value="<%=app.getId()%>"/>
    <input type="hidden" name="order" value="<%= request.getParameter("order")%>"/>

    <a class="bnt btn-primary" href="clients.jsp">
        Clients
    </a>
    <a class="bnt btn-warning" href="index.jsp">
        Checker
    </a>
    <a class="bnt btn-primary" href="registration.jsp">
        Registration
    </a>


    <table class="table">
        <tr>
            <td>date<input name="date" type="date" class="form-control" value="<%=app.getDate()%>"/></td>
            <td>amount(0-10000$)<input name="amount" class="form-control" value="<%=app.getAmount()%>"/></td>
            <td>status(Compl/Progr/Cancel)<%--<input name="status" type="text" list="stats" class="form-control" value="<%=app.getStatus()%>"/>
                <datalist id="stats">
                    <option value="Cancel">
                    <option value="Progr">
                    <option value="Compl">
                </datalist></td>--%>
                <select name="status" class="form-control">
                    <option value="Cancel">Cancel</option>
                    <option value="Progr">Progr</option>
                    <option value="Compl">Compl</option>
                </select>
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
            <td><%=application1.getDate()%>
            </td>
            <td><%=application1.getAmount()%>
            </td>
            <td><%=application1.getStatus()%>
            </td>
            <td>
                <a class="btn btn-danger" href="orderslist.jsp?action=remove&id=<%=application1.getId()%>&order=<%=application1.getOrder_id()%>">
                    Delete
                </a>
                <a class="btn btn-warning" href="orderslist.jsp?action=select&id=<%=application1.getId()%>&order=<%=application1.getOrder_id()%>">
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
