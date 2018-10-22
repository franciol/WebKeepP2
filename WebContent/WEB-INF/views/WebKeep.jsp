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
		session.setAttribute("gifIdSelected", "");
		session.setAttribute("songIdSelected", "");
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
<table>
<tr>
<td>
	<form action="postaNota" method="post">
		<semi> Nova nota </semi>
		<br> <input type="text" name="conteudoNota"><br>
	</form></td><td>
	<a target="_blank" href="buscaDeezer">Adicionar Música</a>
	</td></tr>
</table>
	<table border='1'>
		<%
			DAO dao = new DAO();
		int idPraIngles = 0;

			List<Notas> notas = dao.getListaNotas();
			for (Notas nota : notas) {

				System.out.println("idSong: " + nota.getSongId());
		%>


					<script type="text/javascript">	
	var xhr = new XMLHttpRequest();
	var url = "http://api.giphy.com/v1/gifs/translate?api_key=jTqCD5PiUA6PdHY63Yvej71IEycXePvt&s=<%=nota.getConteudoNota() %>&weirdness=10"
		xhr.open("GET", url,true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var jsonData = JSON.parse(xhr.responseText);
			document.getElementById("tolo"+<%=idPraIngles%>).src="https://media.giphy.com/media/"+jsonData.data.id+"/giphy.gif";
			
	}
		else {
		<% System.out.println("OPS");%>	
		};
		}
	</script>
		<tr border="1">
		<% System.out.println("id"+idPraIngles); %>
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
			<td><iframe scrolling="no" frameborder="0" id="tolo<%=idPraIngles %>"
					allowTransparency="true"
					width="300" height="500"></iframe></td>
					
					
			<td><iframe scrolling="no" frameborder="0"
					allowTransparency="true"
					src="https://www.deezer.com/plugins/player?format=classic&autoplay=false&playlist=true&width=300&height=500&color=007FEB&layout=dark&size=medium&type=tracks&id=<%=nota.getSongId()%>&app_id=306204"
					width="300" height="250"></iframe></td>
			<%
			idPraIngles+=1;
				}
			%>
		
	</table>
</body>
</html>