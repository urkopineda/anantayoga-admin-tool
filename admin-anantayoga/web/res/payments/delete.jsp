<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="main.DB"%>
<%@ page import="java.sql.SQLException" %>
<%
    DB db = new DB();
    try {
        db.deletePayment(Integer.parseInt(request.getParameter("id")));
        %>
        <div class="alert alert-success alert-dismissible" role="alert">
            <strong>¡Bien!</strong> Pago eliminado corretamente.
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
            <strong>¡Error!</strong> Ha ocurrido un error al eliminar el pago, código de error: <%= e.getErrorCode() %>.
        </div>
        <%
    }
%>