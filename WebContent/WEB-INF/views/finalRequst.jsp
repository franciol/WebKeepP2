<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="pegaAccess" method="POST" >
		<input type="hidden" id="hiddenField" name="total"> <input type="submit">

	</form>
	<script type="text/javascript">
var url_string = "https://connect.deezer.com/oauth/access_token.php?app_id=306204&secret=<%=session.getAttribute("codeSecret").toString()%>&code=<%=session.getAttribute("code01").toString()%>";
//window.location.href
const Http = new XMLHttpRequest();
Http.open("POST",url_string);
Http.send();

Http.onreadystatechange=(e)=> {
	document.getElementById("hiddenField").value=Http.responseText;
}
</script>



</body>
</html>