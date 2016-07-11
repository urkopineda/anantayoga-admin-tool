<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="data.Contract" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    DB db = new DB();
    DateFormat df = new SimpleDateFormat("dd/MM/YYYY");
    ArrayList<Contract> cs = null;
    try {
        cs = db.getContracts(Integer.parseInt(request.getParameter("id")));
    } catch (SQLException e) {
        e.printStackTrace();
    }
    for (Contract c : cs) {
        %>
        <tr>
            <td><%= c.getFee() %></td>
            <td><%= df.format(c.getDate()) %></td>
            <td>
                <button id="end-contract-button" type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal" data-contract_id="<%= c.getId() %>">
                    Borrar
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