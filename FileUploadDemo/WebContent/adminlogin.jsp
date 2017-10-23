<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#FEF9E7">
<center>
<font color="red">
<%

String s=(String)request.getAttribute("msg");
if(s!=null)
	out.print(s);

%>
</font>
<pre>
<form action="LoginControllerr" method="post">
<h2><font color="green">Welcome to Admin Login</font></h2>
Login ID   <input type="text" name="uid" required/>
<br/> <br/> 
Password   <input type="password" name="password" required/>
<br/>
<input type="submit" value="login"/>      <input type="reset" />
</form>
</pre>
</center>
</body>
</html>