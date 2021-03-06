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
import connect.LoginConnect;

/**
 * Servlet implementation class CustomerCheckoutController
 */
@WebServlet("/CustomerCheckoutController")
public class CustomerCheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerCheckoutController() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String u=request.getParameter("email");//get email and password
		String p=request.getParameter("password");
		LoginConnect ld=new LoginConnect();
		   int y=ld.Ccheck(u,p);//check the email and password entered by user correct or not
		   if(y==1)
		   {    
			    HttpSession ss=request.getSession();//set session or user identity
		        ss.setAttribute("user",u);
		        Addtocartconnect ac=new Addtocartconnect();
		        int x=ac.updatecart(u);
			    response.sendRedirect("Allinfo");//and send response to allinfo servlet
		   }
		   else//if user entered wrong password then
		   {
		RequestDispatcher rd=request.getRequestDispatcher("CutomerLogin.jsp");//user can not login, user need to try again and again until user entered right password
		request.setAttribute("msg","login Fail,Try again");//print msg login page
		rd.forward(request, response);
		
	}
	}

}
