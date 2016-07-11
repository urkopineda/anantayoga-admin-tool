<%@ page import="data.Fee" %>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="data.Contract" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%
        DB db = new DB();
        Fee f = null;
        try {
            f = db.getFee(Integer.parseInt(request.getParameter("id")));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
    <head>
        <title><%= f.getName() %> | Ananta Yoga</title>
        <jsp:include page="./res/includes.html"/>
        <script>
            function saveFee() {
                $('#alert-container').load('./res/fee/update.jsp', {id: <%= f.getId() %>,
                                                                  name: $('#name').val(),
                                                                  days: $('#days').val(),
                                                                  price: $('#price').val()});
            }
        </script>
    </head>
    <body>
        <jsp:include page="./res/menu.html"/>
        <div id="fee-container" style="margin: 10px;">
            <div class="page-header">
                <h1><%= f.getName() %> <small>Cuota / Bono</small></h1>
            </div>
            <div id="fee-data">
                <div class="panel panel-default">
                    <div class="panel-heading">Información de cuota / bono</div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Tipo</th>
                                <th>Días de duración</th>
                                <th>Precio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input id="name" type="text" style="width: 100%" value="<%= f.getName() %>"></td>
                                <td><%= f.getType() %></td>
                                <td><input id="days" type="number" style="width: 100%" value="<%= f.getDays() %>"></td>
                                <td><input id="price" type="number" style="width: 100%" value="<%= f.getPrice() %>"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <p>
                <button type="button" class="btn btn-info" onclick="saveFee()" style="margin-bottom: 15px; margin-left: 10px;">
                    Guardar cambios
                </button>
            </p>
            <div id="alert-container"></div>
            <hr>
            <div class="page-header">
                <h1>Contratos</h1>
            </div>
            <div id="contracts-container">
                <div class="panel panel-default">
                    <div class="panel-heading">Contratos relacionados con la cuota / bono '<%= f.getName() %>'</div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Fecha</th>
                            <th>Opciones</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            ArrayList<Contract> cs = null;
                            try {
                                cs = db.getContractsOfType(f.getId());
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                            for (Contract c : cs) {
                        %>
                            <tr>
                                <td><%= c.getUsername() %></td>
                                <td><%= c.getDate() %></td>
                                <td>
                                    <button type="button" class="btn btn-info" onclick="window.location.href='./user.jsp?id=<%= c.getIdUser() %>'">
                                        Ver usuario
                                    </button>
                                </td>
                            </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%
            try {
                db.disconnect();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
