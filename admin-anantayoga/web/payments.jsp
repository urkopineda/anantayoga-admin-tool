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
                        //the 'is' for buttons that trigger popups
                        //the 'has' for icons within a button that triggers a popup
                        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
                            $(this).popover('hide');
                        }
                    });
                });
            });
            function refreshAllPayments() {
                // TODO: Tener en cuenta las fechas a mostrar.
                $('#payments-container').load('./res/payments/nview.jsp');
                load_search('#search-input', '#payments-container');
            }
            function clean() {
                $('#fi-cal').val("");
                $('#ff-cal').val("");
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
                        <input id="ff-cal" type='text' class="form-control" onblur="refreshAllPayments()" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    </div>
                </div>
            </label>
            <label>Hasta...
                <div class="form-group">
                    <div class='input-group date' id='datetimepicker-ff'>
                        <input id="fi-cal" type='text' class="form-control" onblur="refreshAllPayments()"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    </div>
                </div>
            </label>
            <button type="button" class="btn btn-danger" onclick="clean()">
                Limpiar
            </button>
            <script type="text/javascript">
                $(function () {
                    $('#datetimepicker-fi').datetimepicker({
                        locale: 'es'
                    });
                    $('#datetimepicker-ff').datetimepicker({
                        locale: 'es'
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
    <button type="button" class="btn btn-info" onclick="window.print()" style="margin-left: 10px;">
        Imprimir
    </button>
</body>
</html>
