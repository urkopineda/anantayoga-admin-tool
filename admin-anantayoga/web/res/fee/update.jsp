<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="data.Fee"%>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%
    DB db = new DB();
    Fee f = new Fee();
    f.setId(Integer.parseInt(request.getParameter("id")));
    f.setName(request.getParameter("name"));
    f.setDays(Integer.parseInt(request.getParameter("days")));
    f.setPrice(Double.parseDouble(request.getParameter("price")));
    try {
        db.updateFee(f);
        %>
        <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>¡Bien!</strong> La cuota / bono se ha actualizado correctamente.
        </div>
        <%
        db.disconnect();
    } catch (SQLException e) {
        e.printStackTrace();
        %>
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>¡Error!</strong> Ha ocurrido un error al guardar la cuota / bono, código de error: <%= e.getErrorCode() %>: <%= e.getMessage() %>.
        </div>
        <%
    }

%>