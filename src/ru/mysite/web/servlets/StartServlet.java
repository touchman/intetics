package ru.mysite.web.servlets;

import ru.mysite.web.client.AppDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class StartServlet extends DispatcherServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AppDAO dao = new AppDAO();

        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String action = req.getParameter("enter");
        String cardId = dao.selectOneStr(fname, lname);

        if("check".equals(action) && dao.selectOneStr(fname,lname )!=null){
            super.forward("/enterlist.jsp?action=execute&id="+cardId+"&card="+cardId, req, resp);
        } else super.forward("/registration.jsp", req, resp);

    }
}
