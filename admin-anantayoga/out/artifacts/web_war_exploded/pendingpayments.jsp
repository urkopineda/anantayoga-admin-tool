<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pagos pendientes | Ananta Yoga</title>
    <jsp:include page="./res/includes.html"/>
    <script>
        $(function () {
            refreshAllPayments();
        });
        function refreshAllPayments() {
            $('#payments-container').load('./res/payments/nprint.jsp');
            load_search('#search-input', '#payments-container');
        }
        function endPayment() {
            $('#alert-container').load('./res/payments/save.jsp', {id: $('#end-user-id').val(),
                                                                        idContract: $('#end-payment-id').val(),
                                                                        startDate: $('#end-payment-sd').val(),
                                                                        endDate: $('#end-payment-ed').val(),
                                                                        price: 0});
        }
        function addPayment() {
            $('#alert-container').load('./res/payments/save.jsp', {id: $('#add-user-id').val(),
                                                                        idContract: $('#add-payment-id').val(),
                                                                        startDate: $('#add-payment-sd').val(),
                                                                        endDate: $('#add-payment-ed').val(),
                                                                        price: $('#payment-amount').val()});
        }
        $(document).on('click', '#add-payment-button', function () {
            var v_u_id = $(this).data('user_id');
            var v_id = $(this).data('contract_id');
            var v_price_amount = $(this).data('price_amount');
            var v_sd = $(this).data('start_date');
            var v_ed = $(this).data('end_date');
            $('#add-user-id').val(v_u_id);
            $('#add-payment-id').val(v_id);
            $('#payment-amount').val(v_price_amount);
            $('#add-payment-sd').val(v_sd);
            $('#add-payment-ed').val(v_ed);
        });
        $(document).on('click', '#disable-payment-button', function () {
            var v_u_id = $(this).data('user_id');
            var v_id = $(this).data('contract_id');
            var v_sd = $(this).data('start_date');
            var v_ed = $(this).data('end_date');
            $('#end-user-id').val(v_u_id);
            $('#end-payment-id').val(v_id);
            $('#end-payment-sd').val(v_sd);
            $('#end-payment-ed').val(v_ed);
        });
    </script>
</head>
<body>
    <jsp:include page="./res/menu.html"/>
    <div id="alert-container"></div>
    <input id="search-input" type="text" class="form-control" placeholder="Buscar..." style="margin-left: 10px; width: 40%;">
    <div id="payments-cont" style="margin: 10px;">
        <div class="panel panel-default">
            <div class="panel-heading">Pagos pendientes</div>
            <table class="table">
                <thead>
                <tr>
                    <th>Nombre y apellidos</th>
                    <th>Cuota</th>
                    <th>Periodo</th>
                    <th>Precio</th>
                    <th>Opciones</th>
                </tr>
                </thead>
                <tbody id="payments-container"></tbody>
            </table>
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
                    <input type="hidden" id="end-user-id" value="-1">
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
                    <input type="hidden" id="add-user-id" value="-1">
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
</body>
</html>
