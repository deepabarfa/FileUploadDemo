<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
<%@page import="java.util.ArrayList,zappyinfo.Zeppy" %>
<h2><font color="green">Update Products</font> </h2>
<% 
Zeppy z=(Zeppy)request.getAttribute("msg");
%>

<table>
<form action="Opreation" method="post" enctype="multipart/form-data">
 <tr><td>productID</td><td><input type="text" value="<%=z.getProductID()%>" name="productID" /><td><tr/>
<tr><td> productname</td><td><input type="text" value="<%=z.getProductname()%>" name="productname"></td><tr/>
 <tr><td>price</td><td><input type="text" value="<%=z.getPrice()%>"name="price"></td><tr/>
 <tr><td>weight</td><td><input type="text" value="<%=z.getWeight()%>"name="weight"></td><tr/>
 <tr><td>details</td><td><input type="text" value="<%=z.getDetails()%>"name="details"/></td><tr/>
 <tr><td>images</td><td><input type="file" value="<%=z.getImages()%>"name="file" accept=".jpg"/></td><tr/>
<tr><td><input type="submit" value="Update" /></td><tr/>
</form>
</table>
</body>
</html>