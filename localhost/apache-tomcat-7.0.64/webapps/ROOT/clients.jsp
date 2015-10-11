<%@ page import="java.util.List" %>
<%@ page import="ru.mysite.web.card.AppCardDAO" %>
<%@ page import="ru.mysite.web.card.ClientCard" %>
<%@ page import="ru.mysite.web.client.AppDAO" %>
<%@ page import="ru.mysite.web.client.Client" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
<form action="clients.jsp">
    <center><h1>Clients</h1></center>
    <%
        AppDAO dao = new AppDAO();
        String cardId = request.getParameter("card_id");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String date = request.getParameter("date");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String id = request.getParameter("id");
        String action = request.getParameter("action");

        Client app = new Client();
        if ("create".equals(action)) {
            if(date.equals("")){
                int cardInt = Integer.parseInt(cardId);
                app = new Client(cardInt, fname, lname, "1900-01-01", address, phone, email);
                dao.create(app);
            } else {
                int cardInt = Integer.parseInt(cardId);
                app = new Client(cardInt, fname, lname, date, address, phone, email);
                dao.create(app);
            }
        } else if ("remove".equals(action)) {
            int idInt = Integer.parseInt(id);
            dao.remove(idInt);
        } else if ("select".equals(action)) {
            int idInt = Integer.parseInt(id);
            app = dao.selectOne(idInt);
        } else if ("update".equals(action)) {
            int idInt = Integer.parseInt(id);
            int cardInt = Integer.parseInt(cardId);
            app = new Client(cardInt, fname, lname, date, address, phone, email);
            dao.update(idInt, app);
        }

        List<Client> applicationList = dao.selectAll();
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
            <td>fname <input name="fname" class="form-control" value="<%=app.getFirstName()%>"/></td>
            <td>lname<input name="lname" class="form-control" value="<%=app.getLastName()%>"/></td>
            <td>date<input name="date" type="date" class="form-control" value="<%=app.getDate()%>"/></td>
            <td>address<input name="address" class="form-control" value="<%=app.getAddress()%>"/></td>
            <td>phone<input name="phone" class="form-control" value="<%=app.getPhone()%>"/></td>
            <td>email<input name="email" class="form-control" value="<%=app.getEmail()%>"/></td>
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
            for (Client application1 : applicationList) {
        %>
        <tr>
            <td><%=application1.getFirstName()%>
            </td>
            <td><%=application1.getLastName()%>
            </td>
            <td><%=application1.getDate()%>
            </td>
            <td><%=application1.getAddress()%>
            </td>
            <td><%=application1.getPhone()%>
            </td>
            <td><%=application1.getEmail()%>
            </td>
            <td>
                <a class="btn btn-danger" href="clients.jsp?action=remove&id=<%=application1.getId()%>">
                    Delete
                </a>
                <a class="btn btn-warning" href="clients.jsp?action=select&id=<%=application1.getId()%>">
                    Select
                </a>
                <a class="btn btn-success" href="enterlist.jsp?action=execute&id=<%=application1.getId()%>&card=<%=application1.getId()%>">
                    Cars
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
