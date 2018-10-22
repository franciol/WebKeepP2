<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.*,mvc.model.*,mvc.controller.*" %>
<form action="postaNota" method ="post">
		<semi> Nova nota </semi>
		<br> <input type="text" name="conteudo_nota" autocomplete = off autofocus = autofocus ><br>
	</form>
	
	<table border='0'>
<% DAO dao = new DAO();
 List<Notas> notas = dao.getListaNotas();
 for (Notas nota : notas ) { %>
 <tr>
 <td>
  <form action="apagaNota" method="post">
    <input type="hidden" id="custId" name="id_nota" value="<%=nota.getIdNota()%>">
    <input type="submit" name="apagar" value="x" />
</form>
<form action="alteraNota" method="post">
    <input type="hidden" id="custId" name="id_nota" value="<%=nota.getIdNota()%>">
  	<input type="text" name="nota" value = "<%=nota.getConteudoNota()%>" autocomplete = off >
 


</form>
 </td>
 
 </tr>
 <% } %>
 </table>
</body>
</html>