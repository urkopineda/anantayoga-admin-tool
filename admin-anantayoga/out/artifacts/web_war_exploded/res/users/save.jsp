<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="main.DB"%>
<%@ page import="data.User" %>
<%@ page import="java.sql.SQLException" %>
<%
    DB db = new DB();
    User u = new User();
    u.setName(request.getParameter("name"));
    u.setSurname(request.getParameter("surname"));
    u.setDir(request.getParameter("dir"));
    u.setCity(request.getParameter("city"));
    u.setState(request.getParameter("state"));
    u.setPhone(Long.parseLong(request.getParameter("tel")));
    u.setEmail(request.getParameter("email"));
    try {
        db.insertUser(u);
        %>
        <div class="alert alert-success alert-dismissible" role="alert">
            <strong>¡Bien!</strong> El usuario <%= u.getName() %> <%= u.getSurname() %> ha sido guardado correctamente.
        </div>
        <script>
            window.setTimeout(function() {
                $(".alert").alert('close');
                refreshUsers();
            }, 2000);
        </script>
        <%
        db.disconnect();
    } catch (SQLException e) {
        e.printStackTrace();
        %>
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>¡Error!</strong> Ha ocurrido un error al guardar el usuario, código de error: <%= e.getErrorCode() %>.
        </div>
        <%
    }

%>