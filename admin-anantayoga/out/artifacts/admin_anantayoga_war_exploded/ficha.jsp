<%@ page import="data.User" %>
<%--
  Created by IntelliJ IDEA.
  User: urko
  Date: 13/04/16
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user;
    HttpSession s = request.getSession(false);
    if (s != null) {
        user = (User) s.getAttribute("user");
        if (user == null) response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE HTML>
<html xmlns:jsp="http://java.sun.com/JSP/Page">
    <head>
        <meta charset="utf-8" />
        <title>Ficha de usuario | Ananta Yoga</title>
    </head>
    <jsp:include page="./resources/head.jsp"/>
    <body>
    <div id="wrapper">
        <jsp:include page="./resources/header.jsp"/>
        <div>
            <div class="inner">
                <header>
                    <h1>NOMBRE APELLIDOS</h1>
                    <p>Ficha de usuario.</p>
                </header>
                <h2>Personas</h2>
                <div id="main">

                </div>
            </div>
        </div>
        <jsp:include page="./resources/footer.jsp"/>
    </div>
    <jsp:include page="./resources/includes.jsp"/>
    </body>
</html>
