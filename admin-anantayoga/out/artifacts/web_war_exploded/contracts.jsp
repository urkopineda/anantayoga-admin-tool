<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Contratos | Ananta Yoga</title>
        <jsp:include page="./res/includes.html"/>
        <script>
            $(function () {
                $('#contracts-container').load('./res/contract/nprint.jsp');
                load_search('#search-input', '#contracts-container');
            });
            function endContract() {
                $('#alert-container').load('./res/contract/delete.jsp', {id: $('#end-contract-id').val()});
            }
            function refreshContracts() {
                $('#contracts-container').load('./res/contract/nprint.jsp');
            }
            $(document).on('click', '#end-contract-button', function () {
                var v_id = $(this).data('contract_id');
                $('#end-contract-id').val(v_id);
            });
        </script>
    </head>
    <%
        DB db = new DB();
    %>
    <body>
    <jsp:include page="./res/menu.html"/>
    <div id="alert-container"></div>
    <input id="search-input" type="text" class="form-control" placeholder="Buscar..." style="margin-left: 10px; width: 40%;">
    <div id="contracts-cont" style="margin: 10px;">
        <div class="panel panel-default">
            <div class="panel-heading">Contratos</div>
            <table class="table">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Fecha</th>
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody id="contracts-container"></tbody>
            </table>
        </div>
    </div>
    <div class="modal fade" tabindex="-1" role="dialog" id="deleteModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">¡Cuidado!</h4>
                </div>
                <div id="end-contract-body" class="modal-body">
                    <p>¿Seguro que quieres finalizar este contrato?</p>
                    <input type="hidden" id="end-contract-id" value="-1">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">No, sacame de aquí</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="endContract()">Si, entiendo los riesgos</button>
                </div>
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
