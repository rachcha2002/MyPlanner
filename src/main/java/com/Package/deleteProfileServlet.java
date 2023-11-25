package com.Package;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.client.getusertype;

@WebServlet("/deleteProfileServlet")
public class deleteProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pid = request.getParameter("pid");
		
		boolean isTrue;
		HttpSession session = request.getSession(false);
        String lusername = (String) session.getAttribute("username");
        
        String usertype=getusertype.usertype(lusername);
        String Vname="";
        
       if(usertype=="Vendor") {
        	Vname=lusername;
        }
		
		isTrue = packageDBUtil.deleteProfile(pid);
		
		if(isTrue == true) {
			List<Package> pDetails = packageDBUtil.getDetails(Vname);
			request.setAttribute("pDetails", pDetails);
			
			String successMessage="Package Deletion Successfully.";
			request.setAttribute("successMessage", successMessage);
			
			RequestDispatcher dis1 = request.getRequestDispatcher("packageProfile.jsp");
			dis1.forward(request, response);
		}
		else {
			
			
			
			List<Package> pDetails = packageDBUtil.getDetails(Vname);
			request.setAttribute("pDetails", pDetails);
			
			String unsuccessMessage="Error,Package details deletion failed.";
			request.setAttribute("unsuccessMessage", unsuccessMessage);
			
			RequestDispatcher dis2 = request.getRequestDispatcher("packageProfile.jsp");
			dis2.forward(request, response);
		}
		
	
	}

}
