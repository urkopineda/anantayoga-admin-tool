<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="data.Contract" %>
<%
    DB db = new DB();
    Contract c = new Contract();
    c.setIdUser(Integer.parseInt(request.getParameter("idUser")));
    c.setIdFee(Integer.parseInt(request.getParameter("idFee")));
    try {
        db.createContract(c);
        %>
        <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>¡Bien!</strong> El contrato se ha guardado correctamente.
            <a onclick="refreshContracts();refreshPendingPayments();" href="#">Refrescar</a>
        </div>
        <%
         db.disconnect();
    } catch (SQLException e) {
        e.printStackTrace();
        %>
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>¡Error!</strong> Ha ocurrido un error al crear el contrato, código de error: <%= e.getErrorCode() %>.
        </div>
        <%
    }
%>