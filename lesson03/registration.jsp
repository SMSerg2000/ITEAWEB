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
		result = "Registration Success";
}

}

if(showForm){
%>
<form action = ''>

<table border='0'>
<tr>
<td>

	<table border = '1'>
		<tr>
		<td width = '50' align = 'center'>
		Name
		</td>
		<td width = '50' align = 'center'>
		<input type = 'text', name = 'name'/>
		</td>
		</tr>
	  
		<tr>
		<td width = '50' align = 'center'>
		Login
		</td>
		<td width = '50' align = 'center'>
		<input type = 'text', name = 'login'/>
		</td>
	  </tr>
	  
		<tr>
		<td width = '50' align = 'center'>
		Password
		</td>
		<td width = '50' align = 'center'>
		<input type = 'password', name = 'password'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50' align = 'center'>
		Re-Password
		</td>
		<td width = '50' align = 'center'>
		<input type = 'password', name = 're-password'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50' align = 'center'>
		Age
		</td>
		<td width = '50' align = 'center'>
		<input type = 'text', name = 'age'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50' align = 'center'>
		Gender
		</td>
		<td width = '50' align = 'center'>
		F<input type = 'radio', name = 'gender' value='F'/>
		M<input type = 'radio', name = 'gender' value='M'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50' align = 'center'>
		Address
		</td>
		<td width = '50' align = 'center'>
		<select name='address'>
			<option value='1'> NONE </option>
			<option value='2'> DNR </option>
			<option value='3'> LNR </option>
			<option value='4'> Crimea </option>
		</select>
		</td>
	  </tr>
	  
	  	  <tr>
		<td width = '50' align = 'center'>
		Comments
		</td>
		<td width = '50' align = 'center'>
		<textarea name='comments' cols='20' rows='10'></textarea>
		</td>
	  </tr>
	  
	  	  <tr>
		<td width = '50' align = 'center'>
		Amigo
		</td>
		<td width = '50' align = 'center'>
		<input type = 'checkbox', name = 'amigo'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50' align = 'center'>
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