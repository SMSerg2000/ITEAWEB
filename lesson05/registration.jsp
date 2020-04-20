<head>
	<title></title>
	<meta charset="UTF-8" />
	<link href="main.css" rel="stylesheet" />
</head>

<body link="#ff0000" vlink="#cecece" alink="#ff0000" bgcolor="black">
  <p>
  </p>
  <p><a href="form.jsp">Autorisation</a></p>
</body>

<body>

<%@ page import ="less05.DBInserter" %>

<%
// login (email) type: text    (errors emty or not email)
// name type: text     (errors not empty)
// age type: text  12~100
// address select  (check address)
// gender radiobutton (errors not empty)
// comments textarea (not empty)(check not null)
// i agree to install AmigoBrowser (no DB) checkbox
// password password  min:8char(2-numbers,2-Headletters Latin only)(errors pass not ???)
// repeat password  (no DB) password
// rigthside Error text

String name = request.getParameter("name");
String login = request.getParameter("login");
String password = request.getParameter("password");
String repassword = request.getParameter("re-password");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String address = request.getParameter("address");
String comments = request.getParameter("comments");
String amigo = request.getParameter("amigo");
boolean showForm = true;
String result = "";
String errorText = "";

if(login!=null){
	boolean existError = false;
	errorText = "<td><ul>";
	
	if(name.length() == 0){
			existError = true;
			errorText += "<li>Empty Name</li>";
	}
	
	if(login.length() == 0){
			existError = true;
			errorText += "<li>Empty Login</li>";
	}
	
	if(login.matches("^(.+)@(.+)$")==false) {
			existError = true;
			errorText += "<li>Invalid login</li>";
	}
	
	if(password.matches("(?=.*[0-9]{2,})(?=.*[A-Z]{2,}).{8,}")==false) {
			existError = true;
			errorText += "<li>Password must be at least 8 characters, 2 numbers, 2 Headletters Latin only</li>";
	}
	
	if(password.equals(repassword)!=true) {
			existError = true;
			errorText += "<li>Password not confirmed</li>";
	}
	
	try{
	int age_int = Integer.parseInt(age);
		if (age_int<12 || age_int>100 ){
			existError = true;
			errorText += "<li>Age must be between 12 and 100 years old</li>";
		}
	} catch (NumberFormatException e) {
		existError = true;
		errorText += "<li>Age must be a number</li>";
	}
	
	if(gender == null){
			existError = true;
			errorText += "<li>Empty Gender</li>";
	}
	
	if(address.equals("1") == true){
			existError = true;
			errorText += "<li>No address selected</li>";
	}
	
	if(comments == ""){
			existError = true;
			errorText += "<li>Empty Comments</li>";
	}
	
	errorText += "</ul></td>";
	
	if(existError){
		showForm = true;
	}else{
		showForm = false;
		DBInserter inserter = new DBInserter();
		inserter.insert(name, password, login, Integer.valueOf(age), gender, comments, address);
		out.write("Registration Success");
}
}

if(showForm){	
%>
<form action = '' method="post" class="subform">

<table border='0'>
<tr>
<td>

	<table border = '1'>
		<tr>
		<td width = '50'>
		<label for="name" class="label">Name</label>
		</td>
		<td width = '50'>
		<input type = 'text', name = 'name'/>
		</td>
		</tr>
	  
		<tr>
		<td width = '50'>
		<label for="login" class="label">Login</label>
		</td>
		<td width = '50'>
		<input type = 'text', name = 'login', value="<%=login==null?"":login%>"/>
		</td>
	  </tr>
	  
		<tr>
		<td width = '50'>
		<label for="password" class="label">Password</label>
		</td>
		<td width = '50'>
		<input type = 'password', name = 'password'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50'>
		<label for="re-password" class="label">Re-Password</label>
		</td>
		<td width = '50'>
		<input type = 'password', name = 're-password'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50' >
		<label for="age" class="label">Age</label>
		</td>
		<td width = '50' >
		<input type = 'text', name = 'age' value="<%=age==null?"":age%>"/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50'>
		<label for="gender" class="label">Gender</label>
		</td>
		<td width = '50' align = 'center'>
		<input type = 'radio', name = 'gender' value='F' <%=(gender!=null&&gender.equals("F"))?"checked":""%>>F</input>
		<input type = 'radio', name = 'gender' value='M' <%=(gender!=null&&gender.equals("M"))?"checked":""%>>M</input>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50'>
		<label for="address" class="label">Address</label>
		</td>
		<td width = '50' align = 'center'>
		<select name='address'>
			<option value="1" <%=(address!=null&&address.equals("1"))?"selected":"" %>> Choose </option>
			<option value="2" <%=(address!=null&&address.equals("2"))?"selected":"" %>> DNR </option>
			<option value="3" <%=(address!=null&&address.equals("3"))?"selected":"" %>> LNR </option>
			<option value="4" <%=(address!=null&&address.equals("4"))?"selected":"" %>> CRIMEA </option>
		</select>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50'>
		 <label for="comments" class="label">Comments</label>
		</td>
		<td width = '50'>
		<textarea name='comments' cols='20' rows='10'><%=comments==null?"":comments%></textarea>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50'>
		<label for="amigo" class="label">Amigo</label>
		</td>
		<td width = '50' align = 'center'>
		<input type = 'checkbox', name = 'amigo'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50'>
		</td>
		<td width = '50' align = 'center'>
		<input type = 'submit', value = 'OK'/>
		</td>
	  </tr>
	  </table>

</td>
 
<%
	out.write(errorText);
%>

</table>
</form>

<%
}
out.write(result);
%>

</body>
</html>