package com.vendor;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.client.Client;
import com.client.ClientDBUtil;

/**
 * Servlet implementation class VendorUserAccountServlet
 */
@WebServlet("/VendorUserAccountServlet")
public class VendorUserAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
        String lusername = (String) session.getAttribute("username");

        List<vendor> vendorDetails=VendorDBUtil.getvendorDetailsbyusername(lusername);
		request.setAttribute("vendorDetails", vendorDetails);
		
		
		RequestDispatcher dis1=request.getRequestDispatcher("vuseraccount.jsp");
		dis1.forward(request, response);

	}

}
