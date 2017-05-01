<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="main.DB"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="data.Fee" %>
<%
    DB db = new DB();
    Fee f = new Fee();
    f.setName(request.getParameter("name"));
    f.setType(request.getParameter("type"));
    f.setDays(Integer.parseInt(request.getParameter("days")));
    f.setPrice(Double.parseDouble(request.getParameter("price")));
    try {
        db.insertFee(f);
        %>
        <div class="alert alert-success alert-dismissible" role="alert">
            <strong>¡Bien!</strong> La cuota / bono se ha guardado correctamente.
        </div>
        <script>
            window.setTimeout(function() {
                $(".alert").alert('close');
                refreshFees();
            }, 2000);
        </script>
        <%
        db.disconnect();
    } catch (SQLException e) {
        e.printStackTrace();
        %>
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>¡Error!</strong> Ha ocurrido un error al guardar la cuota / bono, código de error: <%= e.getErrorCode() %>.
        </div>
        <%
    }

%>