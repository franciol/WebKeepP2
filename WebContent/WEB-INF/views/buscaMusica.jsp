<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form onsubmit="search">
		<input name="searchTag">
	</form>

	<table>
		<tr>
			<th>Musica selecionada</th>
			
			<td>
			<form action="">
			<input type="hidden" id="idSelected">
			<input type="text" id = "songSelected">
			</form>
			</td>
		</tr>

	</table>



	<script type="text/javascript">
		var xhr = new XMLHttpRequest();
		var url = "https://api.deezer.com/search/track?q=<%=request.getParameter("searchTag")%>";

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonData = JSON.parse(xhr.responseText);

			}
			showTracks(jsonData);
		};

		xhr.open("GET", url, true);
		xhr.send();

		function showTracks(data) {
			var output = "<ul>";
			var i;

			for ( var i in data.data) {
				output += "<li>id = "+data.data[i].id+" Musica: " + data.data[i].title + " (artist: "
						+ data.data[i].artist.name + ")</li>";
			}
			output += "</ul>";
			document.getElementById("listaTracks").innerHTML = output;

		}
		function selectSong() {

		}
	</script>
	<div id="listaTracks"></div>
</body>
</html>