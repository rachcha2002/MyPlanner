package com.Services;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.client.getusertype;
import com.vendor.VendorDBUtil;
import com.vendor.vendor;

/**
 * Servlet implementation class serviceAccessServlet
 */
@WebServlet("/serviceAccessServlet")
public class serviceAccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
		
				HttpSession session = request.getSession(false);
		        String lusername = (String) session.getAttribute("username");
		        
		        String usertype=getusertype.usertype(lusername);
		        String cname="";
		        String vname="";
		        
		        
		        
		        
		        if(usertype=="Client") {
		        	cname=lusername;
		        	
		        }
				
		        else if(usertype=="Vendor") {
		        	vname=lusername;
		        	
		        }
		        
		        
		       
		
		
		String type=request.getParameter("type");
		String cus="cService";
		String ven="vService";
		boolean cusTypeEq=(type.equals(cus));
		boolean venTypeEq=(type.equals(ven));
		
		if (cusTypeEq && cname != null && !cname.isEmpty()) {
		    // Redirect for client
		    out.println("<script type='text/javascript'>");
		    out.println("location='customerHome.jsp'");
		    out.println("</script>");
		} else if (venTypeEq && vname != null && !vname.isEmpty()) {
		    // Redirect for vendor
		    out.println("<script type='text/javascript'>");
		    out.println("location='vendorHome.jsp'");
		    out.println("</script>");
		} else {
		    // Redirect to access denied
		    out.println("<script type='text/javascript'>");
		    out.println("location='serviceAccessDenied.jsp'");
		    out.println("</script>");
		}
	}

}