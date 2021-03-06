<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="data.Payments" %>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.ParseException" %>
<%
    DB db = new DB();
    DateFormat df = new SimpleDateFormat("dd/MM/YYYY");
    ArrayList<Payments> ps = null;
    try {
        ps = db.getAllPendingPayments();
    } catch (SQLException | ParseException e) {
        e.printStackTrace();
    }
    for (Payments p : ps) {
        %>
        <tr>
            <td><%= p.getUserName() %></td>
            <td><%= p.getContract() %>
            <%
                if (p.isWarning()) {
            %>
                <span class="glyphicon glyphicon-warning-sign" aria-hidden="true" data-toggle="tooltip" title="¡Cuidado! El pago está retrasado."></span>
            <%
                }
            %>
            </td>
            <td><%= df.format(p.getStartDate()) %> al <%= df.format(p.getEndDate()) %></td>
            <td><%= p.getPrice() %></td>
            <td>
                <button id="add-payment-button" type="button" class="btn btn-info" data-toggle="modal" data-target="#paymentModal" data-contract_id="<%= p.getIdContract() %>" data-price_amount="<%= p.getPrice() %>"
                        data-start_date="<%= p.getStartDate() %>" data-end_date="<%= p.getEndDate() %>" data-user_id="<%= p.getIdUser() %>">
                    Pagar
                </button>
                <button id="disable-payment-button" type="button" class="btn btn-danger" data-toggle="modal" data-target="#disableModal" data-contract_id="<%= p.getIdContract() %>"
                        data-start_date="<%= p.getStartDate() %>" data-end_date="<%= p.getEndDate() %>" data-user_id="<%= p.getIdUser() %>">
                    Anular
                </button>
                <button type="button" class="btn btn-info" onclick="window.location.href='./user.jsp?id=<%= p.getIdUser() %>'">
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