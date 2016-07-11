<%@ page import="data.FeeType" %>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Cuotas y bonos | Ananta Yoga</title>
        <jsp:include page="./res/includes.html"/>
        <script>
            $(function () {
                $('#fees-container').load('./res/fees/print.jsp');
                $("[name='view-all-check']").bootstrapSwitch();
                $("[name='view-all-check']").on('switchChange.bootstrapSwitch', function(event, state) {
                    newRefreshFees(state);
                });
                load_search('#search-input', '#fees-container');
            })
            function deleteFee() {
                $('#alert-container').load('./res/fees/delete.jsp', {id: $(`#delete-fee-id`).val()});
            }
            function upFee() {
                $('#alert-container').load('./res/fees/up.jsp', {id: $(`#up-fee-id`).val()});
            }
            function saveFee() {
                $('#alert-container').load('./res/fees/save.jsp',  {name: $('#name').val(),
                                                                    type: $('#type').val(),
                                                                    days: $('#days').val(),
                                                                    price: $('#price').val()});
            }
            function refreshFees() {
                if ($("[name='view-all-check']").prop("checked") == true) {
                    $('#fees-container').load('./res/fees/vprint.jsp');
                } else {
                    $('#fees-container').load('./res/fees/print.jsp');
                }
                load_search('#search-input', '#fees-container');
            }
            function newRefreshFees(state) {
                if (state == true) {
                    $('#fees-container').load('./res/fees/vprint.jsp');
                } else {
                    $('#fees-container').load('./res/fees/print.jsp');
                }
                load_search('#search-input', '#fees-container');
            }
            $(document).on('click', '#delete-fee-button', function () {
                var v_id = $(this).data('fee_id');
                $('#delete-fee-id').val(v_id);
            });
            $(document).on('click', '#up-fee-button', function () {
                var v_id = $(this).data('fee_id');
                $('#up-fee-id').val(v_id);
            });
        </script>
    </head>
    <%
        DB db = new DB();
    %>
    <body>
    <jsp:include page="./res/menu.html"/>
    <div id="alert-container"></div>
    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addModal" style="margin-bottom: 15px; margin-left: 10px;">
        Añadir
    </button>
    <label style="float: right; margin-right: 10px;" data-toggle="tooltip" title="Ver todos los datos, incluso los dados de baja."><input type="checkbox" name="view-all-check"></label>
    <input id="search-input" type="text" class="form-control" placeholder="Buscar..." style="margin-left: 10px; width: 40%;">
    <div id="fees-cont" style="margin: 10px;">
        <div class="panel panel-default">
            <div class="panel-heading">Cuotas y bonos</div>
            <table class="table">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Días</th>
                        <th>Precio</th>
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody id="fees-container"></tbody>
            </table>
        </div>
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Añadir nueva cuota / bono</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Tipo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input id="name" type="text" style="width: 100%"></td>
                                    <td><select id="type" style="width: 100%">
                                    <%
                                        ArrayList<FeeType> feeTypes = null;
                                        try {
                                            feeTypes = db.getFeeTypes();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                        for (FeeType f : feeTypes) {
                                    %>
                                            <option><%= f.getName()%></option>
                                    <%
                                        }
                                    %>
                                    </select></td>
                                </tr>
                            </tbody>
                        </table>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Días</th>
                                <th>Precio</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><input id="days" type="number" style="width: 100%"></td>
                                <td><input id="price" type="number" style="width: 100%"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="saveFee();">Guardar cambios</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" tabindex="-1" role="dialog" id="deleteModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">¡Cuidado!</h4>
                    </div>
                    <div class="modal-body">
                        <p>¿Seguro que quieres dar de baja esta cuota / bono? Esta cuota / bono se ocultará.</p>
                        <input type="hidden" id="delete-fee-id" value="-1">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">No, sacame de aquí</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deleteFee()">Si, entiendo los riesgos</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" tabindex="-1" role="dialog" id="upModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">¡Cuidado!</h4>
                    </div>
                    <div class="modal-body">
                        <p>¿Seguro que quieres dar de alta esta cuota / bono?</p>
                        <input type="hidden" id="up-fee-id" value="-1">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                        <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="upFee()">Si</button>
                    </div>
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
