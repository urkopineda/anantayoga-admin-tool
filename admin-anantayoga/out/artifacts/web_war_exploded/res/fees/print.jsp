<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="data.Fee"%>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%
    DB db = new DB();
    ArrayList<Fee> fees = null;
    try {
        fees = db.getFees();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    for (Fee c : fees) { %>
    <tr>
        <td><%= c.getName() %></td>
        <td><%= c.getType() %></td>
        <td><%= c.getDays() %></td>
        <td><%= c.getPrice() %></td>
        <td>
            <button type="button" class="btn btn-info" onclick="window.location.href='./fee.jsp?id=<%= c.getId() %>'">
                Ver / Editar
            </button>
            <button id="delete-fee-button" type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal" data-fee_id="<%= c.getId() %>">
                Dar de baja
            </button>
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