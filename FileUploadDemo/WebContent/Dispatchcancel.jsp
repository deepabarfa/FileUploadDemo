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

 <h3><font color="green">Admin Approve</font> </h3>

<%String m=(String)request.getAttribute("msg");
  if(m!=null)
  out.println(m);
 %> 
<table style="background-color:#E5E7E9;" border="1">
<tr style="background-color: #FBFCFC;"><th>productID</th><th>images</th><th>productname</th><th>price</th><th>details</th><th>Quantity</th><th>Email</th><th>Name</th><th>Mobile</th><th>Address</th><th>Date</th><th>Status</th><th>Approve</th></tr>
<%@page import="java.util.ArrayList,zappyinfo.Zeppy" %>
<%
ArrayList<Zeppy> ar=(ArrayList<Zeppy>)request.getAttribute("LIST");
for(Zeppy z:ar)
{
%>
<tr>
<form action="AdminApproveOperation" method="post">
    <td><%=z.getProductID()%></td>
    <td><img src="images/<%=z.getImages()%>" heigth="125" width="125" /></td>
    <td><%=z.getProductname()%></td>
     <input type="hidden" value="<%=z.getProductname()%>" name="productname" />
    <td><%=z.getPrice()%></td>
    <td><%=z.getDetails()%></td>
    <td><%=z.getQuantity()%></td>
    <td><%=z.getEmail()%></td>
    <td><%=z.getName()%></td>
    <td><%=z.getMobile()%></td>
    <td><%=z.getAddress()%></td>
    <td><%=z.getDate()%></td>
    <%  int st=0;
      String status;
      st=z.getStatus(); 
      if(st==1)
      {
    	  status="Dispatched";
      }
      else
      {
    	  status="Pending";
      }
      %>
      <td><%=status%></td>
      <input type="hidden" value="<%=z.getProductID()%>" name="productID">
    <td><input type="submit" value="Dispatch" name="op"/> <input type="submit" value="Cancel" name="op"/> 
  </form></tr>
 <% 
}
%>
  </table>
</body>
</html>