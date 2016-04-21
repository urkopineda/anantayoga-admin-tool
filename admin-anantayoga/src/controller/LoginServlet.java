package controller;

import data.User;
import db.DBUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by urko on 18/04/16.
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nextPage = "login.jsp";
        DBUtils db = new DBUtils();
        if (db.checkUser((String) request.getSession().getAttribute("username"),
                (String) request.getSession().getAttribute("password"))) {
            request.getSession().setAttribute("user", new User((String) request.getSession().getAttribute("username")));
            request.getSession().setAttribute("message", "Bienvenido, " + (String) request.getSession().getAttribute("username"));
            nextPage = "index.jsp";
        }
        response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
