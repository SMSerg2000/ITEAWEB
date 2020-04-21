<%@ page import = "less06.Checker"%>

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
	String logOut = request.getParameter("LogOut");
	boolean showForm = true;
	String result = "";
	String key = "key";

	//out.write("session: " + session.getId());
	
	if(login!=null){
		Checker checker = new Checker(login, password);		
		showForm=!checker.show();
		if (showForm == false){
			session.setAttribute(key, "sessionCheck");	
		}
		result = checker.message();
	}
	
	if(logOut != null){
		session.invalidate();
		session = request.getSession(true);
		//out.write("session: " + session.getId());
		showForm = true;
	}
	
	if(session.getAttribute(key) != null){
		result = "Hello, " + login;
		showForm = false ;
	}
	
	if(showForm){
	%>

<body link="#ff0000" vlink="#cecece" alink="#ff0000" bgcolor="black">
  <p>
  </p>
  <p><a href="registration.jsp">Registration</a></p>
</body>
	
<form id="loginForm" action="" method="get">

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
	} else{
%>

	<form action = '' method="get"> 
	   <tr>
		<td width = '50' align = 'center'>
		</td>
		<td width = '50' align = 'center'>
			<input type = 'submit' name = 'LogOut' value="logOut" />
		</td>
	  </tr>
	</table>

<%
	} out.write(result); 
%>

</body>
</html>