<%@ page import="java.util.List" %>
<%@ page import="ru.mysite.web.AppCardDAO" %>
<%@ page import="ru.mysite.web.ClientCard" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
<form action="enter.jsp">
    <center><h1>List of cars</h1></center>
    <%
        AppCardDAO dao = new AppCardDAO();
        String card = request.getParameter("card");
        String order = request.getParameter("order");
        String make = request.getParameter("make");
        String model = request.getParameter("model");
        String year = request.getParameter("year");
        String vin = request.getParameter("vin");
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        String access = "close";
        List<ClientCard> applicationList = dao.selectAll();


        ClientCard app = new ClientCard();
        if ("create".equals(action)) {
            int cardInt = Integer.parseInt(card);
            int orderInt = Integer.parseInt(order);
            app = new ClientCard(cardInt ,orderInt, make, model, year, vin);
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
            int cardInt = Integer.parseInt(card);
            int orderInt = Integer.parseInt(order);
            app = new ClientCard(cardInt ,orderInt, make, model, year, vin);
            dao.update(idInt, app);
            applicationList = dao.selectAll();
        } else if("execute".equals(action)){
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
            <td>card_id<input name="card" class="form-control" value="<%=app.getCard_id()%>"/></td>
            <td>order_id<input name="order" class="form-control" value="<%=app.getOrder_id()%>"/></td>
            <td>make<input name="make" class="form-control" value="<%=app.getMake()%>"/></td>
            <td>model<input name="model" class="form-control" value="<%=app.getModel()%>"/></td>
            <td>year<input name="year" type="date" class="form-control" value="<%=app.getYear()%>"/></td>
            <td>vin<input name="vin" class="form-control" value="<%=app.getVin()%>"/></td>
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
            for (ClientCard application1 : applicationList) {
        %>
        <tr>
            <td><%=application1.getCard_id()%>
            </td>
            <td><%=application1.getOrder_id()%>
            </td>
            <td><%=application1.getMake()%>
            </td>
            <td><%=application1.getModel()%>
            </td>
            <td><%=application1.getYear()%>
            </td>
            <td><%=application1.getVin()%>
            </td>
            <td>
                <a class="btn btn-danger" href="enter.jsp?action=remove&id=<%=application1.getId()%>">
                    Delete
                </a>
                <a class="btn btn-warning" href="enter.jsp?action=select&id=<%=application1.getId()%>">
                    Select
                </a>
                <a class="btn btn-success" href="orderslist.jsp?action=execute&id=<%=application1.getOrder_id()%>&order=<%=application1.getOrder_id()%>">
                    Orders
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
