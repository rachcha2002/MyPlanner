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

@WebServlet("/updateProfileServlet")
public class updateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String pid = request.getParameter("pid");
		String pname = request.getParameter("Pname");
		String pcategory = request.getParameter("pcategory");
		String ptype = request.getParameter("ptype");
		String price = request.getParameter("Pprice");
		String description = request.getParameter("Pdes");
		
		HttpSession session = request.getSession(false);
        String lusername = (String) session.getAttribute("username");
        
        String usertype=getusertype.usertype(lusername);
        String Vname="";
        
       if(usertype=="Vendor") {
        	Vname=lusername;
        }
		
		boolean isTrue;
		isTrue = packageDBUtil.updateProfile(pid,pname, pcategory, ptype, price, description);
		
		if(isTrue == true) {
			
			List<Package> pDetails = packageDBUtil.getDetails(Vname);
			request.setAttribute("pDetails", pDetails);
			
			String successMessage="Package Update Successfully.";
			request.setAttribute("successMessage", successMessage);
			
			RequestDispatcher dis1 = request.getRequestDispatcher("packageProfile.jsp");
			dis1.forward(request, response);
		}
		else {
			List<Package> pDetails = packageDBUtil.getDetails(Vname);
			request.setAttribute("pDetails", pDetails);

			String unsuccessMessage="Error,Package details updation failed.";
			request.setAttribute("unsuccessMessage", unsuccessMessage);
			
			RequestDispatcher dis1 = request.getRequestDispatcher("packageProfile.jsp");
			dis1.forward(request, response);
		}
	}

}
