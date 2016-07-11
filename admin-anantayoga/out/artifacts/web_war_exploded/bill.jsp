<%@ page import="data.Payments" %>
<%@ page import="main.DB" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%
        DB db = new DB();
        Payments p = null;
        DateFormat df = new SimpleDateFormat("dd/MM/YYYY");
        try {
            p = db.getPayment(Integer.parseInt(request.getParameter("id")));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
    <head>
        <title>Factura #<%= p.getId() %> | Ananta Yoga</title>
        <jsp:include page="./res/includes.html"/>
        <style>
            @page {
                size: A5 landscape;
            }
            body {
                font-size: 175%;
            }
            .post-thumb {
                float: left;
            }
            .post-thumb img {
                display: block;
            }
            .post-content {
                margin-left: 185px;
            }
            .dotted {
                border:0;
                border-bottom: 2px dotted;
                margin-left: 5px;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div id="bill-container" style="margin: 10px;">
            <div class="post-thumb">
                <img src="./res/images/logo.jpg">
            </div>
            <div class="post-content">
                <h1>Ananta Yoga</h1>
                <p>Recibo Nº <label><%= p.getId() %></label>
                    <br>
                NIF/CIF: <label>E95737508</label>
                    <br>
                Fecha de pago: <label><%= df.format(p.getDate()) %></label></p>
            </div>
            <div id="bill-content">
                <br><br>
                <label>Nombre: </label><input type="text" class="dotted" value="<%= p.getUserName() %>">
                <br>
                <br>
                <label>Precio: </label><input type="text" class="dotted" value="#<%= p.getPrice() %> €# (IVA incluido)">
                <br>
                <br>
                <label>Concepto: </label><input type="text" class="dotted" value="Pago de <%= p.getContract() %>, periodo del <%= df.format(p.getStartDate()) %> al <%= df.format(p.getEndDate()) %>">
            </div>
        </div>
    </body>
    <script>
        window.print();
    </script>
</html>
