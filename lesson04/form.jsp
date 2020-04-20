<%@ page import = "less04.Checker"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<meta charset="UTF-8" />
	<link href="style.css" rel="stylesheet" />
</head>

<body>
	<%
	String login = request.getParameter("login");
	String password = request.getParameter("password");
	boolean showForm = true;
	String result = "";

	if(login!=null){
		Checker checker = new Checker(login, password);		
		showForm=!checker.show();
		result = checker.message();
	}
	
	if(showForm){
	%>
	
<form id="loginForm" action="" method="post">

	<div class="field">
		<label>Enter your login:</label>
		<div class="input"><input type="text" name="login" value="" id="login" /></div>
	</div>

	<div class="field">
		<a href="#" id="forgot">Forgot your password?</a>
		<label>Enter your password:</label>
		<div class="input"><input type="password" name="password" value="" id="pass" /></div>
	</div>

	<div class="submit">
		<button type="submit">Enter</button>
		<label id="remember"><input name="" type="checkbox" value="" /> Remember me</label>
	</div>

</form>

<%
	} out.write(result); 
%>

</body>
</html>