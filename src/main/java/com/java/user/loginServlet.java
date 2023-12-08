package com.java.user;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/login.do")
public class loginServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L;


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userEmail = request.getParameter("userEmail");
		String userPwd = request.getParameter("userPwd");
		
		UserDao uDao = new UserDao();
		UserDTO udto = new UserDTO(userEmail,userPwd);
		UserDTO login = uDao.login(udto);
		
		HttpSession session = request.getSession();
		if(login != null) {
			session.setAttribute("userinfo", login);
			response.sendRedirect("index.jsp");
			
		} else {
			// Login failed
            String errorMessage = "로그인에 실패했습니다.";
            session.setAttribute("loginError", errorMessage);
            
            // Set character encoding for response
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");

            // Show alert and redirect to the index page
            String alertScript = "alert('" + errorMessage + "'); window.location.href='index.jsp';";
            response.getWriter().println("<script>" + alertScript + "</script>");
		}
	}
	
}
