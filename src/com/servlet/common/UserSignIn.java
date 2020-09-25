package com.servlet.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.beans.User;
import com.dao.Smpp_DaoImpl;

/**
 * Servlet implementation class UserSignIn
 */
public class UserSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSignIn() {
        super();
        // TODO Auto-generated constructor stub
    }
    final static Logger logger = Logger.getLogger(UserSignIn.class);
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

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        

      // System.out.println("Operating System======>"+os);
       ///System.out.println("Browser Name==========>"+browser);
        String publicip=request.getParameter("publicip");
       User user = new User();
       Smpp_DaoImpl daoImpl=new Smpp_DaoImpl();
        logger.info("111111111111");
        int id=0;
        
        Boolean status = false;
        
       
        String name = request.getParameter("username");
        String password = request.getParameter("password");
        
        user.setName(name);
        user.setPassword(password);
         
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a");
        String logintime = String.valueOf(sdf.format(cal.getTime()));
        try {
      	status = daoImpl.checkUser(user);
        	id = user.getId();
        	String email = user.getEmail();
        	name=user.getName();
        	password = user.getPassword();
        	
        	 if (status == true) {
        		 HttpSession session = request.getSession();

                 session.setAttribute("user_id", id);
                 session.setAttribute("user_email", email);
                 session.setAttribute("user_name", name);
                 response.sendRedirect("tyro");
             
               out.println("</body>");
               out.println("</html>");
        		 
        	 }else{ 
        		 
        		 status = false;
        		 
        		 String message = "Login Failed,Please try again!";
        		 request.setAttribute("message", message);
        		request.getRequestDispatcher("login?message=invalid email and password").include(request, response);
                 
                   out.println("</body>");
                   out.println("</html>");
        	 }
        
        } catch (Exception e) {
            e.printStackTrace();
        }
    
	}

}
