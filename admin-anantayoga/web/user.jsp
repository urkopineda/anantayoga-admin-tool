<%@ page import="data.Fee" %>
<%@ page import="data.User" %>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%
        DB db = new DB();
        User u = null;
        try {
            u = db.getUser(Integer.parseInt(request.getParameter("id")));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
    <head>
        <title><%= u.getName() %> <%= u.getSurname() %> | Ananta Yoga</title>
        <jsp:include page="./res/includes.html"/>
        <script>
            $(function () {
                refreshUser();
                refreshContracts();
                refreshAllPayments();
            });
            function saveUser() {
                $('#alert-container').load('./res/user/update.jsp', {name: $('#name').val(),
                                                                    surname: $('#surname').val(),
                                                                    dir: $('#dir').val(),
                                                                    city: $('#city').val(),
                                                                    state: $('#state').val(),
                                                                    tel: $('#tel').val(),
                                                                    email: $('#email').val(),
                                                                    id: <%= u.getId() %>});
            }
            function saveContract() {
                $('#contract-alert-container').load('./res/contract/save.jsp', {idUser: <%= u.getId() %>,
                                                                                idFee: $('#fee-option').val()});
            }
            function endContract() {
                $('#contract-alert-container').load('./res/contract/delete.jsp', {id: $('#end-contract-id').val()});
            }
            function refreshUser() {
                $('#user-data').load('./res/user/print.jsp', {id: <%= u.getId() %>});
            }
            function refreshContracts() {
                $('#contracts-container').load('./res/contract/print.jsp', {id: <%= u.getId() %>});
                refreshPendingPayments();
            }
            function refreshAllPayments() {
                refreshPendingPayments();
                refreshPayments();
            }
            function refreshPendingPayments() {
                $('#pending-payments-container').load('./res/payments/print.jsp', {id: <%= u.getId() %>});
            }
            function refreshPayments() {
                $('#payments-container').load('./res/payments/view.jsp', {id: <%= u.getId() %>});
            }
            function endPayment() {
                $('#alert-pending-payments').load('./res/payments/save.jsp', {id: <%= u.getId() %>,
                                                                              idContract: $('#end-payment-id').val(),
                                                                              startDate: $('#end-payment-sd').val(),
                                                                              endDate: $('#end-payment-ed').val(),
                                                                              price: 0});
            }
            function addPayment() {
                $('#alert-pending-payments').load('./res/payments/save.jsp', {id: <%= u.getId() %>,
                                                                              idContract: $('#add-payment-id').val(),
                                                                              startDate: $('#add-payment-sd').val(),
                                                                              endDate: $('#add-payment-ed').val(),
                                                                              price: $('#payment-amount').val()});
            }
            $(document).on('click', '#end-contract-button', function () {
                var v_id = $(this).data('contract_id');
                $('#end-contract-id').val(v_id);
            });
            $(document).on('click', '#add-payment-button', function () {
                var v_id = $(this).data('contract_id');
                var v_price_amount = $(this).data('price_amount');
                var v_sd = $(this).data('start_date');
                var v_ed = $(this).data('end_date');
                $('#add-payment-id').val(v_id);
                $('#payment-amount').val(v_price_amount);
                $('#add-payment-sd').val(v_sd);
                $('#add-payment-ed').val(v_ed);
            });
            $(document).on('click', '#disable-payment-button', function () {
                var v_id = $(this).data('contract_id');
                var v_sd = $(this).data('start_date');
                var v_ed = $(this).data('end_date');
                $('#end-payment-id').val(v_id);
                $('#end-payment-sd').val(v_sd);
                $('#end-payment-ed').val(v_ed);
            });
        </script>
    </head>
    <body>
        <jsp:include page="./res/menu.html"/>
        <div id="user-container" style="margin: 10px;">
            <div id="user-data"></div>
            <p>
                <button type="button" class="btn btn-info" onclick="saveUser()" style="margin-bottom: 15px; margin-left: 10px;">
                    Guardar cambios
                </button>
            </p>
            <div id="alert-container"></div>
            <hr>
            <div class="page-header">
                <h1>Contratos</h1>
            </div>
            <div id="contract-alert-container"></div>
            <p>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addModal" style="margin-bottom: 15px; margin-left: 10px;">
                    Crear contrato
                </button>
            </p>
            <div class="panel panel-default">
                <div class="panel-heading">Contratos</div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Cuota / Bono</th>
                            <th>Fecha</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody id="contracts-container"></tbody>
                </table>
            </div>
            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Añadir nuevo contrato</h4>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Cuota / Bono</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <select id="fee-option" style="width: 100%;">
                                            <% ArrayList<Fee> fees = null;
                                                try {
                                                    fees = db.getFees();
                                                } catch (SQLException e) {
                                                    e.printStackTrace();
                                                }
                                                for (Fee c : fees) { %>
                                                    <option value="<%= c.getId() %>"><%= c.getName() %></option>
                                            <%
                                                }
                                            %>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="saveContract()">Guardar cambios</button>
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
            <hr>
            <div class="page-header">
                <h1>Pagos</h1>
            </div>
            <div id="alert-pending-payments"></div>
            <div class="row" style="margin-bottom: 20px;">
                <div class="col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">Pagos pendientes</div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Cuota / Bono</th>
                                    <th>Periodo</th>
                                    <th>Cantidad</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody id="pending-payments-container"></tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">Pagos realizados</div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Cuota / Bono</th>
                                    <th>Periodo</th>
                                    <th>Fecha pago</th>
                                    <th>Cantidad</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody id="payments-container"></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal fade" tabindex="-1" role="dialog" id="disableModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">¡Cuidado!</h4>
                        </div>
                        <div id="end-payment-body" class="modal-body">
                            <p>¿Seguro que quieres anular este pago? Esta acción no se puede deshacer.</p>
                            <input type="hidden" id="end-payment-id" value="-1">
                            <input type="hidden" id="end-payment-sd" value="-1">
                            <input type="hidden" id="end-payment-ed" value="-1">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">No, sacame de aquí</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="endPayment()">Si, entiendo los riesgos</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" tabindex="-1" role="dialog" id="paymentModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">¡Cuidado!</h4>
                        </div>
                        <div id="add-payment-body" class="modal-body">
                            <p>Introduce la cantidad a pagar; recuerda, esta acción no se puede deshacer.</p>
                            <input type="hidden" id="add-payment-id" value="-1">
                            <input type="hidden" id="add-payment-sd" value="-1">
                            <input type="hidden" id="add-payment-ed" value="-1">
                            <div class="panel panel-default">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Cantidad</th>
                                        </tr>
                                    </thead>
                                    <tbody id="add-payment-container">
                                        <tr>
                                            <td><input type="number" id="payment-amount" style="width: 100%"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-info" data-dismiss="modal" onclick="addPayment()">Pagar</button>
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
