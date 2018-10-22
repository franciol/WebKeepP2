<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login WebKeep</title>
</head>
<body>

	<h2>Página de Login</h2>
	<table>
		<form action="efetuaLogin" method="post">
			<tr>
			<td>
				Email:
				<input type="email" name="Email" />
			</td>
			</tr>
			<tr>
			<td>Senha:<input type="password" name="senha" /></td></tr>
			<tr>
				<input type="submit" value="Login" />
			</tr>
		</form>
		
		<td>
			<a href="registro">Registrar</a>
		</td>
	</table>
</body>
</html>