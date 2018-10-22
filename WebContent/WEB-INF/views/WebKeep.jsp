<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Projeto 2 de Tecnologias Web | Engenharia Insper">
<title>WebKeep</title>
<link
	href="https://fonts.googleapis.com/css?family=Cairo:300,600,700&amp;subset=arabic,latin-ext"
	rel="stylesheet">
<link href="./Resources/css/index.css" type="text/css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/css/style.css"
	type="text/css" rel="stylesheet">

</head>
<body>
	<%@ page import="java.util.*,mvc.model.*,mvc.controller.*"%>
	<%
		System.out.println("Usuario: " + session.getAttribute("usuarioLogado"));
	%>

<body>
	<div id="ognwrapper">
		<header class="gb_Ta gb_qb gb_Ed gb_Kd" ng-non-bindable="" id="gb"
			role="banner" style="background-color: #fb0">
			<div class="gb_je"></div>
			<h1>WebKeep</h1>
			<%
				try {
					System.out.println("Access_token: " + session.getAttribute("access_token"));
					if (session.getAttribute("access_token").equals(null)) {
			%>
			<a
				href="https://connect.deezer.com/oauth/auth.php?app_id=306204&redirect_uri=http://localhost:8080/TechWebP2/logaDeezer/&perms=basic_access,email"
				target="blank" type="button">Deezer Login</a>
			<%
				}

				} catch (Exception e) {
			%>
			<a
				href="https://connect.deezer.com/oauth/auth.php?app_id=306204&redirect_uri=http://localhost:8080/TechWebP2/logaDeezer/&perms=basic_access,email"
				target="blank" type="button">Deezer Login</a>
			<%
				}
			%>
			<a href="logout">Logout</a> <br>
	</div>

	<form action="postaNota" method="post">
		<semi> Nova nota </semi>
		<br> <input type="text" name="conteudoNota"><br>
	</form>

	<table border='1'>
		<%
			DAO dao = new DAO();
			List<Notas> notas = dao.getListaNotas();
			for (Notas nota : notas) {
		%>


		<tr border="1">
			<td>
				<form action="apagaNota" method="post">
					<input type="hidden" x name="idNota" value="<%=nota.getIdNota()%>">
					<input type="submit" name="apagar" value="x" />
				</form>
			</td>
			<td>
				<form action="alteraNota" method="post">
					<input type="hidden" name="idNota" value="<%=nota.getIdNota()%>">
					<input type="text" name="conteudoNota"
						value="<%=nota.getConteudoNota()%>" autocomplete=off>
				</form>
			</td>
			<td><iframe scrolling="no" frameborder="0"
					allowTransparency="true"
					src="https://www.deezer.com/plugins/player?format=classic&autoplay=false&playlist=true&width=300&height=200&color=007FEB&layout=dark&size=medium&type=tracks&id=104166850&app_id=306204"
					width="300" height="150"></iframe></td>
			<%
				}
			%>
		
	</table>
</body>
</html>