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
<h2><font color="green">Zappy Products</font> </h2>
<table style="background-color: #FBFCFC;"" border="1">
<tr style="background-color:#E5E7E9;"><th>productID</th><th>productname</th><th>price</th><th>weight</th><th>details</th><th>images</th><th>option</th></tr>
<%@page import="java.util.ArrayList,zappyinfo.Zeppy" %>
<h3><font color="red"><%String m=(String)request.getAttribute("msg");
 if(m!=null)
	 out.println(m);
%></font></h3>
<%
ArrayList<Zeppy> ar=(ArrayList<Zeppy>)request.getAttribute("LIST");
for(Zeppy z:ar)
{
%>
<tr>
     <form action="Opreation" method="get">
    <td><%=z.getProductID()%></td>
    <td><%=z.getProductname()%></td>
    <td><%=z.getPrice()%></td>
    <td><%=z.getWeight()%></td>
    <td><%=z.getDetails()%></td>
    <td><img src="images/<%=z.getImages()%>" heigth="75" width="75" /></td>
    <td>

    <input type="hidden" name="productID" value="<%=z.getProductID() %>"/>
    <input type="submit" value="Delete" name="opreation" onclick="return confirmdelete();"/>
 <script>
 function confirmTest()
 {
var a=confirm("do you realy want to Update");
return a;
 }
 </script>
 <script>
 function confirmdelete()
 {
var a=confirm("do you realy want to delete");
return a;
 }
 </script>
 
    <input type="submit" value="Update" name="opreation" onclick="return confirmTest();" />
    
    </form></td>   
  </tr>
  <a href="Opreation" onclick="return confirmTest();"></a>
<% 
}
%>
</table>
</body>
</html>