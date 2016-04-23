<%--
  Created by IntelliJ IDEA.
  User: urko
  Date: 13/04/16
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html xmlns:jsp="http://java.sun.com/JSP/Page">
    <meta charset="utf-8" />
	<jsp:include page="./resources/head.jsp"/>
	<body>
		<div id="wrapper">
			<jsp:include page="./resources/header.jsp"/>
			<div>
				<div class="inner">
					<header>
						<h1>Iniciar sesión en Ananta Yoga</h1>
						<p>Aplicación de administración del Centro.</p>
					</header>
					<div id="login">
                        <form method="post" id="login-form" action="<%=request.getContextPath()%>/login">
							<p>
								Usuario
								<input type="text" placeholder="Usuario" id="username" name="username" ></input>
							</p>
							<p>
								Contraseña
								<input type="password" placeholder="Contraseña" id="password" ></input>
							</p>
							<input type="submit" value="Acceder"></input>
						</form>
					</div>
				</div>
			</div>
			<jsp:include page="./resources/footer.jsp"/>
		</div>
		<jsp:include page="./resources/includes.jsp"/>
	</body>
</html>