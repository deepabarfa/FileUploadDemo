<%-- this jsp shows add to card page
 --%>
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
<form action="CutomerLoginCheckout" method="post">
<input type="submit" value="Customer Home"/></form>
<form action="index.jsp" method="get">
<input type="submit" value="Zappy Home" /></form></p1>
 <p1 align="right">
<form action="logout.jsp" method="get">
<input type="submit" value=" Logout" /></form></p1>
<h2><font color="green">My Card</font> </h2>
<a href ="ShoppingList">add more product </a>
<br/>
<table style="background-color: #FBFCFC;" border="1">
<tr style="background-color:#E5E7E9;"><th>productID</th><th>images</th><th>productname</th><th>price</th><th>weight</th><th>details</th><th>Quantity</th><th>ipaddress</th><th>Remove</th></tr>

<%@page import="java.util.ArrayList,zappyinfo.Zeppy" %>
<%
double tamount=0;
ArrayList<Zeppy> ar=(ArrayList<Zeppy>)request.getAttribute("LIST");
for(Zeppy z:ar)
{
%>
<tr>
     <form action="addtocartCheckoutcontroller" method="post">
    <td><%=z.getProductID()%></td>
    <td><img src="images/<%=z.getImages()%>" heigth="100" width="100"/></a></td>
    <td><%=z.getProductname()%></td>
    <td><%=z.getPrice()%></td>
    <td><%=z.getWeight()%></td>
    <td><%=z.getDetails()%></td>
     <td><%=z.getQuantity()%></td>
    <td><%=z.getIpaddress()%></td> 
<td><h1><input type="submit" value="Delete" name="op"/></h1></td> 
    <input type="hidden" name="productID" value="<%=z.getProductID() %>"/> 
<%tamount=tamount+(z.getTamount()); %>

</form> 
  </tr>
<% 
}
%>  


    </table>
</br>
</br>
<p1 align="left">
<form action="addtocartCheckoutcontroller" method="post">
<input type="submit" value="Checkout" name="op"/></form></p1>

<%!int a=0;%>
 <%!String ipaddress="";%>
<%@page import="connect.Addtocartconnect"%>
   <%
   ipaddress =request.getRemoteAddr();
   Addtocartconnect pd=new Addtocartconnect();
   int a=pd.countProduct(ipaddress);
   %>
   <br/>
Total product:  <%=a%>
Total Amount:   <%=tamount%>

</table>
</body>
</html>