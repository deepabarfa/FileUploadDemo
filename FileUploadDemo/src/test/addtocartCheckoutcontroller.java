package test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connect.Addtocartconnect;
import connect.UpdateConnect;

/**
 * Servlet implementation class addtocartCheckoutcontroller
 */
@WebServlet("/addtocartCheckoutcontroller")
public class addtocartCheckoutcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addtocartCheckoutcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String y=request.getParameter("op");
		
		if(y.equals("Checkout"))//if we click checkout button
		{
			 HttpSession ss=request.getSession();//if user already login 
			 String x=(String)ss.getAttribute("user");
			if(x==null)//check if its not then send url CheckoutCLogin.jsp
			{
			response.sendRedirect("CheckoutCLogin.jsp");
			}
			else// if user login then it go with servlet
			{
			response.sendRedirect("Allinfo");	
			}
		}
		if(y.equals("Delete"))//if we click delete button
		{		String ipadd=request.getRemoteAddr();
			int p=Integer.parseInt(request.getParameter("productID"));//string to integer
			 Addtocartconnect cv=new Addtocartconnect();
			    int z=cv.removeProduct(p,ipadd);//database code
			     if(z==1)//check condition
			      {
			    	 response.sendRedirect("index.jsp");//jump index.jsp page
			    	 //RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			 	  //request.setAttribute("LIST","Product removed from cart");
			 	  //rd.forward(request, response);
		}
	}
	}

}
