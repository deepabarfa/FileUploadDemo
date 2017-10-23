package connect;

import java.sql.Connection; // for establish the connection
import java.sql.DriverManager;//package for  jdbc driver
import java.sql.PreparedStatement; // for interface
import java.sql.ResultSet;// method that return a resultset object which contains the result returned by the execution query
import java.sql.SQLException;//for eql exception handling
import java.util.ArrayList;// for array list

import zappyinfo.Zeppy;

public class Addtocartconnect 
{
	public Connection start()// function of connection
	{
	Connection con=null;
	try //for handle the exception 
	{	
		 Class.forName("com.mysql.jdbc.Driver"); //load the jdbc suitable connection loads com.mysql.jdbc.Driver into memory
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/zappy","root",""); //establish the connection with specific language it may be mysql, oracle etc. 
	}
	catch(ClassNotFoundException | SQLException e)// catch ClassNotFoundException and SQLException both type exception and create object
	{
		System.out.println(e);// with object we print the exception in system and solved the problem
	}
	return con;
	}
	
	public int addtocart(int productID,String ipaddress, int quantity1, double tamount)//function with some parameter and return the int value
	{ 
		Zeppy e1=new Zeppy();// create an zeppy object 
		int x=0;
		try 
		{System.out.println("hello1");//for testing
		Connection con=start();// call the connection function 
		 PreparedStatement ps=con.prepareStatement("select * from upload where productID=?"); //it is an interface that is used to execute the parameterized query and here we create object of  PreparedStatemen interface
		    ps.setInt(1, productID);//set the productId with  PreparedStatemen object
		    ResultSet rs=ps.executeQuery(); // method that return a Resultset object which contains the result returned by the execution query
		    while(rs.next())
		    {
		    	    e1.setProductID(rs.getInt("productID"));// get value with resultset object and with zeppy object we call setter function 
					e1.setProductname(rs.getString("productname"));// get value with resultset object and with zeppy object we call setter function
					e1.setPrice(rs.getDouble("price"));// get value with resultset object and with zeppy object we call setter function
					e1.setWeight(rs.getString("weight"));// get value with resultset object and with zeppy object we call setter function
					e1.setDetails(rs.getString("details"));// get value with resultset object and with zeppy object we call setter function
					e1.setImages(rs.getString("images"));// get value with resultset object and with zeppy object we call setter function
		}}
		catch(Exception e)//handle exception
		{
			e.printStackTrace();//it trace the exception and print the location of of execution 
		}
		int p=0;
		try { //here with same function we perform another database    
			 Connection con1=start();// call the connection function 
		   	  PreparedStatement ps1=con1.prepareStatement("select productID from addtocart where ipaddress=?");//placeholder
		      ps1.setString(1,ipaddress);//set ipaddress with parameterized 
		   	  ResultSet rs=ps1.executeQuery();// method that return a Resultset object which contains the result returned by the execution query
		  while(rs.next())
		  {
			 p=rs.getInt("productID");//get productid in p variable
		  }
		  if(p!=1)
	  {
		System.out.println("hello");
		Connection con=start();// call the connection function 
		PreparedStatement ps=con.prepareStatement("insert into addtocart values(?,?,?,?,?,?,?,?,?)");//insert query in addtocart table
		ps.setInt(1,e1.getProductID());//get the value in zeppy class getter function and insert with prepareStatement query
		ps.setString(2,e1.getProductname());//get the value in zeppy class getter function and insert with prepareStatement query
		ps.setDouble(3,e1.getPrice());//get the value in zeppy class getter function and insert with prepareStatement query
		ps.setString(4,e1.getWeight());//get the value in zeppy class getter function and insert with prepareStatement query
		ps.setString(5,e1.getDetails());//get the value in zeppy class getter function and insert with prepareStatement query
		ps.setString(6,e1.getImages());//get the value in zeppy class getter function and insert with prepareStatement query
		ps.setString(7,ipaddress);//get the value in zeppy class getter function and insert with prepareStatement query
		ps.setInt(8, quantity1);//get the value in zeppy class getter function and insert with prepareStatement query
		ps.setDouble(9, tamount);//get the value in zeppy class getter function and insert with prepareStatement query
		
		x=ps.executeUpdate();//execute update query
		con.close();//close the connection
		
	}}catch(Exception e)//handle the exception
	{
		System.out.println(e);//print the exception in system
	}
		
		return x;//return the integer value
	}

	public ArrayList<Zeppy> viewaddcart() //create new function with return array list 
	{
		ArrayList<Zeppy> list=new ArrayList<>();// create ArrayList object
		try {	
		    Connection con=start();//call the connection function
		    PreparedStatement ps=con.prepareStatement("select * from addtocart");//write an query
			ResultSet rs= ps.executeQuery();//execute query
		while(rs.next())
		{
			Zeppy e=new Zeppy();//create an zeppy class object
			e.setProductID(rs.getInt("productID"));// get value with resultset object and with zeppy object we call setter function
			e.setImages(rs.getString("images"));
			e.setProductname(rs.getString("productname"));
			e.setPrice(rs.getDouble("price"));
			e.setWeight(rs.getString("weight"));
			e.setDetails(rs.getString("details"));
			e.setIpaddress(rs.getString("ipaddress"));
			e.setQuantity(rs.getInt("quantity"));
			e.setTamount(rs.getDouble("tamount"));
			list.add(e);
		}
			con.close();//close connection
			  }catch(SQLException  ex)
			{
				System.err.println(ex);
				ex.printStackTrace();
			}
		return list;
	}

	public int removeProduct(int productID, String ipaddress) //create new function and return integer value 
	{
		int y=0;
		   try {
			   Connection con=start();//call the connection function
			   	  PreparedStatement ps=con.prepareStatement("delete from addtocart where productID=? and ipaddress=?");//write delete query
			   	    ps.setInt(1,productID);// set value with parameterized
					ps.setString(2,ipaddress);
			   	    y=ps.executeUpdate();
			   	    
			     }catch(Exception e)//handle exception
			     {
			   	  System.out.println(e);
			     }

		   return y;
	}
	public int countProduct(String ipaddress)//create new function and it returns integer value 
	{
		int e=0;
		try {	
		    Connection con=start();
		    PreparedStatement ps=con.prepareStatement("select count(*) from addtocart where ipaddress=?");//create  query for counting 
			ps.setString(1,ipaddress);// set value with parameterized 
		    ResultSet rs= ps.executeQuery();
		while(rs.next())
		{
			e=rs.getInt(1);
		}
		System.out.println(e);
			con.close();
			  }catch(SQLException  ex)
			{
				System.err.println(ex);
			}
		
		return e;
		}

}
