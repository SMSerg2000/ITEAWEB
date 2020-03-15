<!DOCTYPE html>
<html>
	<head>
		<meta charset='UTF-8'>
		<title>Table colors</title>
	</head>

<%
String rows=request.getParameter("rows");
String cols=request.getParameter("cols");
try {
	int i = Integer. parseInt(rows);
	int j = Integer. parseInt(cols);
	int mediana1 = i/2 + 1;
	int mediana2 = j/2 + 1;
if (i%2 ==0 || j%2 ==0 || i<=0 || j<=0) {
	out.write("<h2>Field value <Rows> must not be even</h2>");
	out.write("<br><br>");
	out.write("<a href='#' onclick='history.back();return false;'>BACK</a>");
} else {
	out.write("<table width='100%' border='1'>");
	for (int a=1;a<=i;a++) {
		out.write("<tr>");
		for (int b=1;b<=j;b++) {
			if (a==mediana1 && b==mediana2){
				out.write("<td width='50' height='50' bgcolor='white'> </td>");
			} else if (a==1 || b==1 || a==i || b==j){
				out.write("<td width='50' height='50' bgcolor='green'> </td>");
			} else out.write("<td width='50' height='50' bgcolor='red'> </td>");
				}
		out.write("</tr>");		
			}
	out.write("</table>");
} 
} catch (NumberFormatException e) {
	out.write("<h1 style='color:red'> GO BACK  AND  ENTER  A  NUMBER!!!</h1>");
	out.write("<br><br>");
	out.write("<a href='#' onclick='history.back();return false;'>BACK</a>");
}

%>

</html>