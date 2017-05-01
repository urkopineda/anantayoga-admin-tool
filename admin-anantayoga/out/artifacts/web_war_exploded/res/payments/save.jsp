<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="data.Payments" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.ParseException" %>
<%
    DB db = new DB();
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    Payments p = new Payments();
    p.setIdUser(Integer.parseInt(request.getParameter("id")));
    p.setIdContract(Integer.parseInt(request.getParameter("idContract")));
    try {
        p.setStartDate(new java.sql.Date(df.parse(request.getParameter("startDate")).getTime()));
        p.setEndDate(new java.sql.Date(df.parse(request.getParameter("endDate")).getTime()));
    } catch (ParseException e) {
        e.printStackTrace();
    }
    p.setPrice(Double.parseDouble(request.getParameter("price")));
    try {
        db.insertPayment(p);
        %>
        <div class="alert alert-success alert-dismissible" role="alert">
            <strong>¡Bien!</strong> El pago se ha guardado correctamente.
        </div>
        <script>
            window.setTimeout(function() {
                $(".alert").alert('close');
                refreshAllPayments();
            }, 2000);
        </script>
        <%
        db.disconnect();
    } catch (SQLException e) {
        e.printStackTrace();
        %>
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>¡Error!</strong> Ha ocurrido un error al guardar el pago, código de error: <%= e.getErrorCode() %>.
        </div>
        <%
    }
%>