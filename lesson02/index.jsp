<!DOCTYPE html>
<html>
	<head>
		<meta charset='UTF-8'>
		<title>Table generator</title>
	</head>

<form action='1.jsp'>
<table width='30%' border='1'>

	<tr>
		<td align="center">
			<ul style="list-style-type: none;">
			<li> Rows: <input type='text' name="rows" size="2" maxlength="2"></li>
			</ul>
		</td>
	
		<td align="center">
			<ul style="list-style-type: none;">
			<li> Cols: <input type='text' name="cols" size="2" maxlength="2"></li>
			</ul>
		</td>
	</tr>
	
	<tr>
		<td align="center" colspan='2'>
		<input type='submit' value='GENERATE'/>
		</td>
	</tr>

</table>
	
</form>

</html>