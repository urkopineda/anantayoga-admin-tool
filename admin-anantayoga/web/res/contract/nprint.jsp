<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="data.Contract" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%
    DB db = new DB();
    DateFormat df = new SimpleDateFormat("dd/MM/YYYY");
    ArrayList<Contract> cs = null;
    try {
        try {
            cs = db.getAllContracts();
        } catch (ParseException e) {
            e.printStackTrace();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    for (Contract c : cs) {
        %>
        <tr>
            <td><%= c.getUsername() %></td>
            <td><%= c.getFee() %></td>
            <td><%= df.format(c.getDate()) %></td>
            <td>
                <button id="end-contract-button" type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal" data-contract_id="<%= c.getId() %>">
                    Borrar
                </button>
                <button type="button" class="btn btn-info" onclick="window.location.href='./user.jsp?id=<%= c.getIdUser() %>'">
                   Ir al usuario
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