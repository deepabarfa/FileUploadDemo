<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#FEF9E7">
 <script type="text/javascript">
function show(input) {
        debugger;
        var validExtensions = ['jpg','png','jpeg']; //array of valid extensions
        var fileName = input.files[0].name;
        var fileNameExt = fileName.substr(fileName.lastIndexOf('.') + 1);
        if ($.inArray(fileNameExt, validExtensions) == -1) {
            input.type = ''
            input.type = 'file'
            $('#user_img').attr('src',"");
            alert("Only these file types are accepted : "+validExtensions.join(', '));
        }
        else
        {
        if (input.files && input.files[0]) {
            var filerdr = new FileReader();
            filerdr.onload = function (e) {
                $('#user_img').attr('src', e.target.result);
            }
            filerdr.readAsDataURL(input.files[0]);
        }
        }
    }

</script>
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
<tr><td> productname</td><td><input type="text" value="<%=z.getProductname()%>" pattern="[a-zA-Z\s]+" name="productname"></td><tr/>
 <tr><td>price</td><td><input type="text" value="<%=z.getPrice()%>" pattern="\d+(\.\d{1,2})?" name="price"></td><tr/>
 <tr><td>weight</td><td><input type="text" value="<%=z.getWeight()%>" pattern="^[0-9]*$" name="weight"></td><tr/>
 <tr><td>details</td><td><input type="text" value="<%=z.getDetails()%>" pattern="[a-zA-Z\s]+" name="details"/></td><tr/>
 <tr><td>images<%-- </td><td><input type="file" value="<%=z.getImages()%>"name="file" accept=".jpg"/></td><tr/>--%>
<tr>
 <td>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<div class="form-group">
 <td>             Upload Your Image
                    <div class="col-md-10">
                        
                        <div>
                            <img id="user_img"
                                 height="130"
                                 width="130"
                                 style="border:solid" />
                        </div>
                        <div>
                        </td>
                           
                           <td> 
                           <input type="file" title="search image" id="file" name="file" onchange="show(this)" required="required"/>
                           
                           </td>
                        </div>
                    </div>
                </div>
                <td><input type="submit" value="Update" /></td>
  </tr>


</form>
</table>
</body>
</html>