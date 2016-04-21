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
    } else response.sendRedirect("login.jsp");

%>
<!DOCTYPE HTML>
<html>
<head></head>
<body>
    <p>Hi!</p>
</body>
</html>
