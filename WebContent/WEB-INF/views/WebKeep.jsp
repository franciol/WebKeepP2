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
	<script type="text/javascript">
	var xhr = new XMLHttpRequest();

	</script>
	<div id="ognwrapper">
		<header class="gb_Ta gb_qb gb_Ed gb_Kd" ng-non-bindable="" id="gb"
			role="banner" style="background-color: #fb0">
			<div class="gb_je"></div>
			<a href="refresh">WebKeep</a><br><br>
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
			<br><a href="logout">Logout</a> <br>
	</div>
	<script type="text/javascript">	//3FSQwJp32KFepKGhvF9bVAlZ9jUO95M4   //jTqCD5PiUA6PdHY63Yvej71IEycXePvt
	var url = "https://cors-anywhere.herokuapp.com/http://api.giphy.com/v1/gifs/translate?api_key=3FSQwJp32KFepKGhvF9bVAlZ9jUO95M4&s=<%=session.getAttribute("gifCont") %>&weirdness=10"
		xhr.open("GET", url);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			<% System.out.println("VAIIIII"); %>
			var jsonData = JSON.parse(xhr.responseText);
			document.getElementById("gifSee").src="https://media.giphy.com/media/"+jsonData.data.id+"/giphy.gif";
			
	}
		else {
		<% System.out.println("OPS s");%>	
		};
		}
	</script>
<iframe scrolling="no" frameborder="0"
					allowTransparency="true" width="300" height="320"
					id="gifSee"></iframe>
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
		%>
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
			<td>
				<form action="verGif" method="post">
				<input type="hidden" value="<%=nota.getConteudoNota()%>" name="conteudoNota">
				<input type="submit" value="Ver GIF">
				</form>
			</td>
					
					
			<td><iframe scrolling="no" frameborder="0"
					allowTransparency="true"
					src="https://www.deezer.com/plugins/player?format=classic&autoplay=false&playlist=true&width=300&height=100&color=007FEB&layout=dark&size=medium&type=tracks&id=<%=nota.getSongId()%>&app_id=306204"
					></iframe></td>
			<%
			idPraIngles+=1;
				}
			%>
		
	</table>
</body>
</html>