package com.Package;

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

import com.client.getusertype;
import com.venue.Venue;
import com.venue.venueDBUtil;

/**
 * Servlet implementation class getPackagesServlet
 */
@WebServlet("/getPackagesServlet")
public class getPackagesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		HttpSession session = request.getSession(false);
        String lusername = (String) session.getAttribute("username");
        
        String usertype=getusertype.usertype(lusername);
        String uname="";
        
        if(usertype=="Vendor") {
        	uname=lusername;
        	
        }
        else if(usertype=="Client") {
        	out.println("<script type='text/javascript'>");
			out.println("location='vendorAccessDenied.jsp'");
			out.println("</script>");
        	
        }
		
         
        
		String type=request.getParameter("type");
		String cus="service";
		String ven="venue";
		boolean cusTypeEq=(type.equals(cus));
		boolean venTypeEq=(type.equals(ven));
		
		if (cusTypeEq && uname != null && !uname.isEmpty()) {
		    // Redirect for client
			List<Package> pDetails = packageDBUtil.getDetails(uname);
			if(pDetails.isEmpty()) {
				out.println("<script type='text/javascript'>");
				out.println("alert('Service creation unsuccesful! Try Again');");
				out.println("location='package.jsp'");
				out.println("</script>");
			}
			request.setAttribute("pDetails", pDetails);
			
			RequestDispatcher dis1 = request.getRequestDispatcher("packageProfile.jsp");
			dis1.forward(request, response);
		} else if (venTypeEq && uname != null && !uname.isEmpty()) {
		    // Redirect for vendor
			List<Venue> vDetails = venueDBUtil.getDetails(uname);
			request.setAttribute("vDetails", vDetails);
			
			RequestDispatcher dis1 = request.getRequestDispatcher("venueProfile.jsp");
			dis1.forward(request, response);
		} else {
		    // Redirect to access denied
		    out.println("<script type='text/javascript'>");
		    out.println("location='vendorAccessDenied.jsp.jsp'");
		    out.println("</script>");
		}
	}

}
