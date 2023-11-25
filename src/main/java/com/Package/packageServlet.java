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

@WebServlet("/packageServlet")
public class packageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String pname = request.getParameter("pname");
		String pcategory = request.getParameter("pcategory");
		String ptype = request.getParameter("ptype");
		String price = request.getParameter("pprice");
		String description = request.getParameter("pdes");
		
		boolean isTrue;
		
		HttpSession session = request.getSession(false);
        String lusername = (String) session.getAttribute("username");
        
        String usertype=getusertype.usertype(lusername);
        String Vname="";
        
       if(usertype=="Vendor") {
        	Vname=lusername;
        }
		
		isTrue = packageDBUtil.insertDetails(pname, pcategory, ptype, price, description,Vname);
		
		if(isTrue == true) {
			
			
			List<Package> pDetails = packageDBUtil.getDetails(Vname);
			
			request.setAttribute("pDetails", pDetails);
			
			String successMessage="Package Creation Successfully.";
			request.setAttribute("successMessage", successMessage);
			
			RequestDispatcher dis1 = request.getRequestDispatcher("packageProfile.jsp");
			dis1.forward(request, response);
		}
		else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Service creation unsuccesful! Try Again');");
			out.println("location='package.jsp'");
			out.println("</script>");
			
		}
		
	}

}
