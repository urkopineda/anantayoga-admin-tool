<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Pagos realizados | Ananta Yoga</title>
        <jsp:include page="./res/includes.html"/>
        <style>
            .popover {
                width: 750px;
            }
            @media print {
                body * {
                    visibility: hidden;
                }
                @page {
                    size: landscape;
                }
                #payments-cont * {
                    visibility: visible;
                }
            }
        </style>
        <script>
            $(function () {
                refreshAllPayments();
                $(document).ready(function(){
                    $("#cal-popover").popover({
                        title: '<b>Selecciona periodo de fechas</b>',
                        content: $("#cal-content").html(),
                        html: true
                    });
                });
                $('body').on('click', function (e) {
                    $('[data-toggle="popover"]').each(function () {
                        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
                            $(this).popover('hide');
                        }
                    });
                });

            });
            function refreshAllPayments() {
                $('#payments-container').load('./res/payments/nview.jsp', {sta: $('#datetimepicker-fi').data().date,
                                                                           end: $('#datetimepicker-ff').data().date});
                load_search('#search-input', '#payments-container');
            }
            function deletePayment() {
                $('#alert-container').load('./res/payments/delete.jsp', {id: $('#delete-payment-id').val()});
            }
            $(document).on('click', '#delete-payment-button', function () {
                var v_id = $(this).data('payment_id');
                $('#delete-payment-id').val(v_id);
            });
            function clean() {
                $('#fi-cal').val("");
                $('#ff-cal').val("");
                $('#datetimepicker-fi').data().date = "";
                $('#datetimepicker-fi').data().date = "";
                refreshAllPayments();
            }
        </script>
    </head>
    <body>
    <jsp:include page="./res/menu.html"/>
    <div id="alert-container"></div>
    <div class="input-group" style="margin-left: 10px; width: 40%;">
        <input id="search-input" aria-describedby="cal-btn" type="text" class="form-control" placeholder="Buscar...">
        <span class="input-group-addon" id="cal-btn">
            <a href="#" data-toggle="popover" id="cal-popover">
                <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
            </a>
        </span>
    </div>
    <div id="cal-content" style="display: none;">
        <div id="cal" style="width: 100%">
            <label>Desde...
                <div class="form-group">
                    <div class='input-group date' id='datetimepicker-fi'>
                        <input id="fi-cal" type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    </div>
                </div>
            </label>
            <label>Hasta...
                <div class="form-group">
                    <div class='input-group date' id='datetimepicker-ff'>
                        <input id="ff-cal" type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    </div>
                </div>
            </label>
            <button type="button" class="btn btn-danger" onclick="clean();">
                Limpiar
            </button>
            <button type="button" class="btn btn-success" onclick="refreshAllPayments()">
                Filtrar
            </button>
            <script type="text/javascript">
                $(function () {
                    $('#datetimepicker-fi').datetimepicker({
                        locale: 'es',
                        format: 'L'
                    });
                    $('#datetimepicker-ff').datetimepicker({
                        locale: 'es',
                        format: 'L'
                    });
                });
            </script>
        </div>
    </div>
    <div id="payments-cont" style="margin: 10px;">
        <div class="panel panel-default">
            <div class="panel-heading">Pagos realizados</div>
            <table class="table">
                <thead>
                    <tr>
                        <th>Nombre y apellidos</th>
                        <th>Cuota</th>
                        <th>Periodo</th>
                        <th>Fecha de pago</th>
                        <th>Precio</th>
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody id="payments-container"></tbody>
            </table>
        </div>
    </div>
    <div class="modal fade" tabindex="-1" role="dialog" id="deletePaymentModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">¡Cuidado!</h4>
                </div>
                <div class="modal-body">
                    <p>¿Seguro que quieres borrar este pago? Los datos NO se podrán recuperar.</p>
                    <input type="hidden" id="delete-payment-id" value="-1">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">No, sacame de aquí</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deletePayment()">Si, entiendo los riesgos</button>
                </div>
            </div>
        </div>
    </div>
    <button type="button" class="btn btn-info" onclick="window.print()" style="margin-left: 10px;">
        Imprimir
    </button>
</body>
</html>
