<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="image/light_background_texture_69531_3840x2160.jpg">

<p1 align="left">
<form action="AdminloginCheckout" method="Post">
<input type="submit" value="Admin Login" /></form></p1> <%-- it is an action button that is perform the action on click which is send the request on there form action and here we go with form action on AdminloginCheckout--%>
<p1 align="right">
<form action="CutomerLoginCheckout" method="Post">
<input type="submit" value=" Customer Profile" /></form><%-- when we click customer profile we go with form action on CutomerLoginCheckout --%>
<form action="logout.jsp" method="get">
<input type="submit" value=" Logout" /></form></p1><%-- when we click customer profile we go with form action on logout.jsp --%>
<%!int a=0;%>
 <%!String ipaddress="";%>
<%@page import="connect.Addtocartconnect,java.net.InetAddress"%>
   <%
   HttpSession ss=request.getSession();//if user already login 
	 String x=(String)ss.getAttribute("user");
	if(x==null)//check if its not then send url CheckoutCLogin.jsp
	{
   InetAddress addr=InetAddress.getLocalHost();
	String ipaddress=addr.getHostAddress();
   //ipaddress =request.getRemoteAddr();
   Addtocartconnect pd=new Addtocartconnect();//it is an class and we create an object
   a=pd.countProduct(ipaddress);//by object we call countProduct(ipaddress) function and it all data give the value a
	}
	else
	{
		String email=x;
		Addtocartconnect pd1=new Addtocartconnect();//it is an class and we create an object
	    a=pd1.countProductemail(email);//by object we call countProduct(ipaddress) function and it all data give the value a
	}
%>

<center>
<img src="image/zappy-logo.png" heigth="150" width="150" /></img> <%-- it is an image of zappy --%>
</center><center>
<h3><font color="red"><%String m=(String)request.getAttribute("msg"); 
if(m!=null)
	out.println(m);
%></font></h3><%-- It get the attribute where set the msg attribute--%>
</center><center>
<form action="Addtocard" method="get">
<input type="submit" value="show add to cart product(<%=a%>)" /></form>
</center><center>
<%@page import="java.util.ArrayList,zappyinfo.Zeppy" %>
<%
ArrayList<Zeppy> ar=(ArrayList<Zeppy>)request.getAttribute("LIST"); // get the list attribute which is set shoppingList servlet and get the all data in the arraylist form.
if(ar!=null)
{	int b=0;
	%><table  background="image/light_background_texture_69531_3840x2160.jpg"><%
			for(Zeppy z:ar)
	{
			if(b%5==0) // we want to get the data in table sequence of four
			{
			out.println("<tr>");
		    %>
			<td>
			<form action="Addtocard" method="post">
   <center><h4>Product Name =<%=z.getProductID()%></h4></center> <%--get the productid with zeppy object z--%>
    <center><a href="ViewproductDetailsController?productID=<%=z.getProductID()%>"><img src="images/<%=z.getImages()%>" heigth="150" width="150" /></a></br></center> <%-- we create a link when we click image it will go ViewproductDetailsController servlet and that is show the all product details--%>
    <center><b>Product Name</b> =<%=z.getProductname()%><br/></center><%--get the productname with getter function--%>
    <center><b>Price</b> =<%=z.getPrice()%>Rs<br/></center><%-- get the price --%>
   <center><b>Weight</b> = <%=z.getWeight()%><br/></center><%--get the weight --%>
   <center><b>Details</b> =<%=z.getDetails()%><br/></center><%--get details --%>
     <%-- <td><input type="number" value="quantity"/></td> --%>
   <center> <input type="hidden" name="productID" value="<%=z.getProductID() %>"/></center><%--it is hidden field with get the productid--%>
    <center><input type="submit" value="Addtocart" name="work"/><br/></center> <%--when we click the addtocart we go with form action on Addtocard servlet--%>
    <center><input type="number" min="1" value="1" name="quantity" required/><br/></center> <%--it is field of quantity that we set minimum value 1  --%>
   <center> <input type="hidden" value="<%=z.getPrice()%>" name="price" /></center>  <%--we also create another hidden field which is get price --%> 
  </form>
		</td>
	<%
			}else{
				%>
				<td>
<form action="Addtocard" method="post">                                            </br>
   <center><h4>Product Name =<%=z.getProductID()%></h4></center>
    <center><a href="ViewproductDetailsController?productID=<%=z.getProductID()%>"><img src="images/<%=z.getImages()%>" heigth="150" width="150" /></a></br></center>
    <center><b>Product Name</b> =<%=z.getProductname()%><br/></center>
    <center><b>Price</b> =<%=z.getPrice()%>Rs<br/></center>
   <center><b>Weight</b> = <%=z.getWeight()%><br/></center>
   <center><b>Details</b> =<%=z.getDetails()%><br/></center>
     <%-- <td><input type="number" value="quantity"/></td> --%>
   <center><input type="hidden" name="productID" value="<%=z.getProductID() %>"/></center>
    <center><input type="submit" value="Addtocart" name="work"/><br/></center>
    <center><input type="number" min="1" value="1" name="quantity" required/><br/></center>
    <center><input type="hidden" value="<%=z.getPrice()%>" name="price" /> </center>  
																						
						</center>
					</form>
				</td>
				
				<%
			if(b%5==4)
				out.println("</tr>");
			    	
		    }		
			b++;

		}
							
    
%>
		</table>				
	<%
}
%>
</center>
</center>
</body>
</html>
