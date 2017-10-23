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
<form action="index.jsp" method="get">
<input type="submit" value="Zappy Home" /></form></p1>
<p1 align="right">
<form action="logout.jsp" method="get">
<input type="submit" value=" Logout" /></form> <%-- it is an action button that is perform the action on click which is send the request on there form action--%>
</p1>
<h2><font color="green">Welcome Admin</font></h2>
<h3><font color="red"><%String m=(String)request.getAttribute("msg");
if(m!=null)
out.println(m);
%></font></h3>
<br/><br/>
<fieldset>
<legend>Account Setting</legend>
<a href ="Updateadminprofile">Change Password</a> <%--links(one page to another page it may be jsp/ servlet) --%>
<br/>
</fieldset>
<br/>
<fieldset>
<legend>Product Details</legend>
<a href ="upload.jsp">Add product</a>
<br/><br/>
<a href ="ProductView">view all Product</a>
</fieldset>
<br/>
<fieldset>
<legend>customer Details</legend>
<a href ="ViewCustomer">view all Customer</a>
<br/>
</fieldset>
<br/>
<fieldset>
<legend>Order Details</legend>
<a href ="AllTotalOrderListController">View all Total order</a>
<br/><br/>
<a href ="TodayOrdercontroller">view pending Order</a>
<br/><br/>
<a href ="DispatcheListController">Dispatch and cancel</a>
<br/><br/>
<a href ="ViewDispatcheListController">view all Dispatch List</a>
<br/></fieldset>
</body>
</html>