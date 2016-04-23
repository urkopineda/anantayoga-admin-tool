package controller;

import data.User;
import db.Utils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by urko on 21/04/16.
 */
@WebServlet(name = "Login")
public class Login extends HttpServlet {

    private Utils db;
    private String nextPage = "/login";

    public Login() {
        super();
        db = new Utils();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("LOGIN: Checking login for user " + username + "...");
        checkUser(username, password, request);
        response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void checkUser(String username, String password, HttpServletRequest request) {
        if (db.checkUser(username, password)) {
            request.getSession().setAttribute("user", new User((String) request.getSession().getAttribute("username")));
            request.getSession().setAttribute("message", "Bienvenido, " + username);
            nextPage = "/index.jsp";
            System.out.println("LOGIN: Success!");
        } else {
            request.getSession().setAttribute("message", "ERROR: Datos incorrectos.");
            System.out.println("LOGIN - ERROR: Login failed.");
        }
    }

}
