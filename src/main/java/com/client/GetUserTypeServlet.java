package com.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vendor.VendorDBUtil;
import com.vendor.vendor;

/**
 * Servlet implementation class GetUserTypeServlet
 */
@WebServlet("/GetUserTypeServlet")
public class GetUserTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
        String lusername = (String) session.getAttribute("username");
        
        
        
        String usertype=getusertype.usertype(lusername);
        
        
        if(usertype=="Client") {
        	
        	 List<Client> clientDetails = ClientDBUtil.getClientDetailsbyusername(lusername);
             request.setAttribute("clientDetails", clientDetails);

             RequestDispatcher dis1 = request.getRequestDispatcher("useraccount.jsp");
             dis1.forward(request, response);
        	
        	
        }
		
        else if(usertype=="Vendor") {
        	 List<vendor> vendorDetails=VendorDBUtil.getvendorDetailsbyusername(lusername);
     		request.setAttribute("vendorDetails", vendorDetails);
     		
     		
     		RequestDispatcher dis1=request.getRequestDispatcher("vuseraccount.jsp");
     		dis1.forward(request, response);
        	
        	
        	
        }
		
		
	}

}
