<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="data.Payments" %>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<%
    DB db = new DB();
    DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
    ArrayList<Payments> ps = null;
    String strStart = request.getParameter("sta");
    String strEnd = request.getParameter("end");
    Date startDate = null;
    Date endDate = null;
    if (request.getParameter("sta") != null && !("").equals(request.getParameter("sta"))) {
        try {
            startDate = df.parse(strStart);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
    if (request.getParameter("end") != null && !("").equals(request.getParameter("sta"))) {
        try {
            endDate = df.parse(strEnd);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
    try {
        ps = db.getAllPayments(startDate, endDate);
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
                <button id="delete-payment-button" type="button" class="btn btn-danger" data-toggle="modal" data-target="#deletePaymentModal" data-payment_id="<%= p.getId() %>">
                    Borrar pago
                </button>
                <button type="button" class="btn btn-info" onclick="window.location.href='./user.jsp?id=<%= p.getIdUser() %>'">
                    Ver / Editar usuario
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