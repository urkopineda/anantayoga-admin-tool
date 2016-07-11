<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="data.Payments" %>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%
    DB db = new DB();
    DateFormat df = new SimpleDateFormat("dd/MM/YYYY");
    ArrayList<Payments> ps = null;
    try {
        ps = db.getAllPayments();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    for (Payments p : ps) {
        %>
        <tr>
            <td><%= p.getUserName() %></td>
            <td><%= p.getContract() %></td>
            <td><%= df.format(p.getStartDate()) %> al <%= df.format(p.getEndDate()) %></td>
            <td><%= df.format(p.getDate()) %></td>
            <td>
                <%
                    if (p.getPrice() == 0) {
                %>
                    Anulado
                <%
                    } else {
                %>
                    <%= p.getPrice() %>
                <%
                    }
                %>
            </td>
            <td class="hiddefromprint">
                <button type="button" class="btn btn-warning" onclick="window.open('./bill.jsp?id=<%= p.getId() %>')">
                    Ver factura
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