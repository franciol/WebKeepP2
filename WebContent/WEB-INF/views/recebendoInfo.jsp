<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div type="hidden" id="firrstCode"></div>
	<script type="text/javascript">
		function closing() {
			window.open('', '_self', '');
			window.close();

		}
	</script>
	<%
		System.out.println(request.getParameter("code"));
		session.setAttribute("code01", request.getParameter("code"));
		if (session.getAttribute("code01").equals(null)) {

		} else {
	%>
	<a href="localhost:8080/TechWebP2/finalizaLogDeezer" onclick="closing()" target="_blank">Redirect</a>

	<%
		}
	%>





</body>
</html>