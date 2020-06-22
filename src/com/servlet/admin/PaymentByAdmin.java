package com.servlet.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.PaymentBeans;
import com.dao.Smpp_DaoImpl;

/**
 * Servlet implementation class PaymentByAdmin
 */
public class PaymentByAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentByAdmin() {
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
		PaymentBeans paymentBean=new PaymentBeans();
		paymentBean.setName(request.getParameter("name"));
		paymentBean.setTransfer_date(request.getParameter("transfer_date"));
		paymentBean.setCredit_transfer(request.getParameter("credit_transfer"));
		paymentBean.setTransffered_by(request.getParameter("transffered_by"));
		paymentBean.setPayment_ref(request.getParameter("payment_ref"));
		paymentBean.setCredit_before(request.getParameter("credit_before"));
		paymentBean.setCredit_after(request.getParameter("credit_after"));
		Smpp_DaoImpl smpp_DaoImpl=new Smpp_DaoImpl();
		int i=smpp_DaoImpl.addPaymentByAdmin(paymentBean);
		if(i>0) {
			response.sendRedirect("paymentHistory?clr=languagesList1&act=languagesList1&message=2");
		}else {
			response.sendRedirect("paymentHistory?clr=languagesList1&act=languagesList1&message=0");
		}
	}

}
