<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Usuarios | Ananta Yoga</title>
        <jsp:include page="./res/includes.html"/>
        <script>
            $(function () {
                $('#users-container').load('./res/users/print.jsp');
                $("[name='view-all-check']").bootstrapSwitch();
                $("[name='view-all-check']").on('switchChange.bootstrapSwitch', function(event, state) {
                    newRefreshUsers(state);
                });
                load_search('#search-input', '#users-container');
            })
            function deleteUser() {
                $('#alert-container').load('./res/users/delete.jsp', {id: $('#delete-user-id').val()});
            }
            function upUser() {
                $('#alert-container').load('./res/users/up.jsp', {id: $('#up-user-id').val()});
            }
            function saveUser() {
                $('#alert-container').load('./res/users/save.jsp', {name: $('#name').val(),
                                                                    surname: $('#surname').val(),
                                                                    dir: $('#dir').val(),
                                                                    city: $('#city').val(),
                                                                    state: $('#state').val(),
                                                                    tel: $('#tel').val(),
                                                                    email: $('#email').val()});
            }
            function refreshUsers() {
                if ($("[name='view-all-check']").prop("checked") == true) {
                    $('#users-container').load('./res/users/vprint.jsp');
                } else {
                    $('#users-container').load('./res/users/print.jsp');
                }
                load_search('#search-input', '#users-container');
            }
            function newRefreshUsers(state) {
                if (state == true) {
                    $('#users-container').load('./res/users/vprint.jsp');
                } else {
                    $('#users-container').load('./res/users/print.jsp');
                }
            }
            $(document).on('click', '#delete-user-button', function () {
                var v_id = $(this).data('user_id');
                $('#delete-user-id').val(v_id);
            });
            $(document).on('click', '#up-user-button', function () {
                var v_id = $(this).data('user_id');
                $('#up-user-id').val(v_id);
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
        <div id="users-cont" style="margin: 10px;">
            <div class="panel panel-default">
                <div class="panel-heading">Usuarios</div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>Teléfono</th>
                            <th>Email</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody id="users-container"></tbody>
                </table>
            </div>
            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Añadir nuevo usuario</h4>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Apellidos</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input id="name" type="text" style="width: 100%"></td>
                                        <td><input id="surname" type="text" style="width: 100%"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Dirección</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input id="dir" type="text" style="width: 100%"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Población</th>
                                        <th>Provincia</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input id="city" type="text" style="width: 100%"></td>
                                        <td><input id="state" type="text" style="width: 100%"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Teléfono</th>
                                        <th>Email</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input id="tel" type="number" style="width: 100%"></td>
                                        <td><input id="email" type="email" style="width: 100%"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Foto</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input id="photo" type="file" style="width: 100%;"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="saveUser();">Guardar cambios</button>
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
                            <p>¿Seguro que quieres dar de baja este usuario? Este usuario se ocultará.</p>
                            <input type="hidden" id="delete-user-id" value="-1">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">No, sacame de aquí</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deleteUser()">Si, entiendo los riesgos</button>
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
                            <p>¿Seguro que quieres dar de alta a este usuario?</p>
                            <input type="hidden" id="up-user-id" value="-1">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                            <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="upUser()">Si</button>
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
