<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#FEF9E7">
<p1 align="left">
<form action="AdminHome.jsp" method="get">
<input type="submit" value="Admin Home"/></form>
<form action="index.jsp" method="get">
<input type="submit" value="Zappy Home" /></form></p1>
 <p1 align="right">
<form action="logout.jsp" method="get">
<input type="submit" value=" Logout" /></form></p1>

 <h3><font color="green">Add Zappy Products</font> </h3 >
 <h3><font color="red"><%String m=(String)request.getAttribute("msg");
 if(m!=null)
	 out.println(m);
%></font></h3>
 <table>
 <pre>
 <form action="UploadProduct" method="post" enctype="multipart/form-data">
 <font color="blue">Product Name </font> <input type="text" pattern="[a-zA-Z\s]+" name="productname" required /><br/>
 <font color="blue">price </font>        <input type="text" pattern="\d+(\.\d{1,2})?" name="price" required /><br/>
 <font color="blue">weight(kg) </font>   <input type="text" pattern="^[0-9]*$" name="weight" required/><br/>
<font color="blue"> Details </font>      <input type="text" pattern="[a-zA-Z\s]+" name="details" required/><br/>
 <font color="blue">Images</font>        <input type="file" name="file" accept=".jpg"  required/><br/>
          <input type="submit" />
 </form>
 </pre>
 </table>
</body>
</html>