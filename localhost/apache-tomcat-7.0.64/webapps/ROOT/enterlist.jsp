<%@ page import="java.util.List" %>
<%@ page import="ru.mysite.web.card.AppCardDAO" %>
<%@ page import="ru.mysite.web.card.ClientCard" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
<form action="enterlist.jsp">
    <center><h1>List of cars</h1></center>
    <%
        AppCardDAO dao = new AppCardDAO();
        String card = request.getParameter("card");
        String make = request.getParameter("make");
        String model = request.getParameter("model");
        String year = request.getParameter("year");
        String vin = request.getParameter("vin");
        String id = request.getParameter("id");
        int idInt = Integer.parseInt(id);
        int cardInt = Integer.parseInt(card);
        String action = request.getParameter("action");
        List<ClientCard> applicationList = dao.selectData(cardInt);


        ClientCard app = new ClientCard();
        if ("create".equals(action)) {
            app = new ClientCard(cardInt, make, model, year, vin);
            dao.create(app);
            applicationList = dao.selectData(cardInt);
        } else if ("remove".equals(action)) {
            dao.remove(idInt);
            applicationList = dao.selectData(cardInt);
        } else if ("select".equals(action)) {
            app = dao.selectOneCard(idInt);
        } else if ("update".equals(action)) {
            app = new ClientCard(cardInt, make, model, year, vin);
            dao.update(idInt, app);
            applicationList = dao.selectData(cardInt);
        } else if("execute".equals(action)){
            applicationList = dao.selectData(cardInt);
        }

    %>
    <input type="hidden" name="id" value="<%=app.getId()%>"/>
    <input type="hidden" name="card" value="<%=request.getParameter("card")%>"/>
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
            <td><%=application1.getMake()%>
            </td>
            <td><%=application1.getModel()%>
            </td>
            <td><%=application1.getYear()%>
            </td>
            <td><%=application1.getVin()%>
            </td>
            <td>
                <a class="btn btn-danger" href="enterlist.jsp?action=remove&id=<%=application1.getId()%>&card=<%=application1.getCard_id()%>">
                    Delete
                </a>
                <a class="btn btn-warning" href="enterlist.jsp?action=select&id=<%=application1.getId()%>&card=<%=application1.getCard_id()%>">
                    Select
                </a>
                <a class="btn btn-success" href="orderslist.jsp?action=execute&id=<%=application1.getId()%>&order=<%=application1.getId()%>">
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
