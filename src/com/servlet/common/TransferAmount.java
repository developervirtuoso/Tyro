package com.servlet.common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.SpanelPost;

/**
 * Servlet implementation class TransferAmount
 */
public class TransferAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransferAmount() {
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
		String removeUsername=request.getParameter("removeUsername");
		double amount=(Double.parseDouble(request.getParameter("amount"))/10);
		
		String addUsername=request.getParameter("addUsername");
		SpanelPost spanelPost=new SpanelPost();
		String username="shivali";
		try {
			spanelPost.first_consent("", "",0,"Transfer%20"+amount,"-"+amount,removeUsername);
			spanelPost.first_consent("", "",0,"Transfer%20"+amount,"+"+amount,addUsername);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("tyro");
	}

}
