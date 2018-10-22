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

	<script type="text/javascript">
		var xhr = new XMLHttpRequest();
		var url = "https://cors-anywhere.herokuapp.com/http://api.deezer.com/search/track?q=<%=request.getParameter("searchTag")%>";


		xhr.open("GET", url,true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonData = JSON.parse(xhr.responseText);

			}
			showTracks(jsonData);
		};

		function showTracks(data) {
			var output = "<table>";
			var i;
			for ( var i in data.data) {
				output += '<tr><td><form action="selecionaMusic" method="POST"><input type="hidden" name="idSelected" value="'+data.data[i].id+'"><input type="submit" value="Select"></form></td>';
				output += "<td>Musica: "
						+ data.data[i].title + " (artist: "
						+ data.data[i].artist.name + ")</td></tr>";
			}
			output += "</table>";

			document.getElementById("listaTracks").innerHTML = output;

		}
		function selectSong() {

		}
	</script>
	<div id="listaTracks"></div>
</body>
</html>