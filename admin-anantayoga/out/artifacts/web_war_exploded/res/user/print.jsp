<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="data.User"%>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%
    DB db = new DB();
    User u = null;
    try {
        u = db.getUser(Integer.parseInt(request.getParameter("id")));
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
    <div class="page-header">
        <h1><%= u.getName() %> <small><%= u.getSurname() %></small></h1>
    </div>
    <div class="row" style="margin-bottom: 20px;">
        <!--
        <div class="col-sm-2">
            <img class="img-thumbnail" src="./res/images/prueba.jpg" style="width: 100%;">
        </div>
        -->
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">Información de contacto</div>
                <table class="table">
                    <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Teléfono</th>
                        <th>Email</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><input id="name" type="text" style="width: 100%" value="<%= u.getName() %>"></td>
                        <td><input id="surname" type="text" style="width: 100%" value="<%= u.getSurname() %>"></td>
                        <td><input id="tel" type="number" style="width: 100%" value="<%= u.getPhone() %>"></td>
                        <td><input id="email" type="email" style="width: 100%" value="<%= u.getEmail() %>"><a href="mailto:<%= u.getEmail() %>">Enviar email</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">Dirección</div>
        <table class="table">
            <thead>
            <tr>
                <th>Dirección</th>
                <th>Población</th>
                <th>Provincia</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input id="dir" type="text" style="width: 100%" value="<%= u.getDir() %>"></td>
                <td><input id="city" type="text" style="width: 100%" value="<%= u.getCity() %>"></td>
                <td><input id="state" type="text" style="width: 100%" value="<%= u.getState() %>"></td>
            </tr>
            </tbody>
        </table>
    </div>
<%
    try {
        db.disconnect();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>