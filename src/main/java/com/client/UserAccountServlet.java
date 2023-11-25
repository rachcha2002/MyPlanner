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

/**
 * Servlet implementation class UserAccountServlet
 */

@WebServlet("/UserAccountServlet")
public class UserAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    
    
    
    @Override
    	
       
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String lusername = (String) session.getAttribute("username");

        List<Client> clientDetails = ClientDBUtil.getClientDetailsbyusername(lusername);
        request.setAttribute("clientDetails", clientDetails);

        RequestDispatcher dis1 = request.getRequestDispatcher("useraccount.jsp");
        dis1.forward(request, response);
    }


		
		
	}


