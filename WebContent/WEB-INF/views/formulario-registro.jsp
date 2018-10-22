<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Registro de usuário</h2>
	<table>
		<form action="efetuaRegistro" method="post">
			<tr>
				<td>Email: <input type="email" name="email" /></td>
			</tr>
			<tr>
				<td>Nome: <input type="text" name="nome" /></td>
				<td>Sobrenome: <input type="text" name="sobrenome"></td>
			</tr>
			<br />
			<tr>
				<td>Senha: <input type="password" name="senha" /></td>
			</tr>
			<br /> <br />
			<tr>
				<td><input type="submit" value="Registrar" /></td>
			</tr>

		</form>
	</table>
</body>
</html>