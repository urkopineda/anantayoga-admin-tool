<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="main.DB"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="data.User" %>
<%@ page import="java.sql.SQLException" %>
<%
    DB db = new DB();
    ArrayList<User> users = null;
    try {
        users = db.getAllUsers();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    for (User u : users) { %>
        <tr>
            <td><%= u.getName() %></td>
            <td><%= u.getSurname() %></td>
            <td><%= u.getPhone() %></td>
            <td><a href="mailto:<%= u.getEmail() %>"><%= u.getEmail() %></a></td>
            <td>
                <button type="button" class="btn btn-info" onclick="window.location.href='./user.jsp?id=<%= u.getId() %>'">
                    Ver / Editar
                </button>
                <%
                    if (u.getVigente() == 1) {
                %>
                <button id="delete-user-button" type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal" data-user_id="<%= u.getId() %>">
                    Dar de baja
                </button>
                <%
                    } else {
                %>
                <button id="up-user-button" type="button" class="btn btn-warning" data-toggle="modal" data-target="#upModal" data-user_id="<%= u.getId() %>">
                    Dar de alta
                </button>
                <%
                    }
                %>
            </td>
        </tr>
    <%
    }
    try {
        db.disconnect();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>