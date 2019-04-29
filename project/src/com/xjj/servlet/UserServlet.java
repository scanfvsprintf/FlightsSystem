package com.xjj.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xjj.pojo.User;
import com.xjj.service.UserService;
import com.xjj.service.impl.FixPassWordImpl;
import com.xjj.service.impl.RegisterServiceImpl;
import com.xjj.service.impl.UserServiceImpl;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/user")
public class UserServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if(request.getParameter("type").equals("login"))
			login(request, response);
		else if(request.getParameter("type").equals("register"))
			register(request, response);
		else if(request.getParameter("type").equals("fixpassword"))
			fixPassWord(request, response);
	}
	private void login(HttpServletRequest request, HttpServletResponse response) {
		User user=null;
		HttpSession session=request.getSession();
		UserService us=new UserServiceImpl();
		user=us.checkUser(request.getParameter("uname"),request.getParameter("pwd"));
		if(user!=null) {
			session.setAttribute("user", user);
			session.setAttribute("loginFail", null);
			try {
				response.sendRedirect("/project/main.jsp");
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			session.setAttribute("loginFail", "1");
			try {
				response.sendRedirect("/project/login.jsp");
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	private void register(HttpServletRequest request, HttpServletResponse response) {
		User user=null;
		HttpSession session=request.getSession();
		UserService us=new RegisterServiceImpl();
		user=us.checkUser(request.getParameter("uname"),request.getParameter("pwd"));
		if(user!=null) {
			session.setAttribute("user", user);
			session.setAttribute("RegisterFail", null);
			try {
				response.sendRedirect("/project/main.jsp");
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			session.setAttribute("RegisterFail", "1");
			try {
				response.sendRedirect("/project/register.jsp");
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	private void fixPassWord(HttpServletRequest request, HttpServletResponse response) {
		User user=null;
		HttpSession session=request.getSession();
		UserService us=new RegisterServiceImpl();
		if(!(((String)request.getParameter("pwd")).equals((String)request.getParameter("pwd2")))) {
			try {
				response.sendRedirect("/project/fixPassWordFail.jsp");
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		user=(User) session.getAttribute("user");
		user.setPwd(request.getParameter("pwd"));
		new FixPassWordImpl().checkUser(user);
		try {
			response.sendRedirect("/project/fixPassWordSuc.jsp");
			return;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
