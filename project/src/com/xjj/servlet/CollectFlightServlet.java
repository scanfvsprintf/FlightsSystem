package com.xjj.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xjj.service.impl.CancelCollectFlightServiceImpl;
import com.xjj.service.impl.CollectFlightServiceImpl;
import com.xjj.pojo.*;
/**
 * Servlet implementation class CollectFlightServlet
 */
@WebServlet("/collect")
public class CollectFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollectFlightServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int uid=((User)(request.getSession().getAttribute("user"))).getUid();
		int tid=Integer.valueOf(request.getParameter("tid"));
		if(request.getParameter("type").equals("collect")) {
			collect(uid,tid);
		}
		else {
			cancelCollect(uid,tid);
		}
		response.getWriter().write("1");
	}
	public void collect(int uid,int tid) {
		new CollectFlightServiceImpl().collect(uid, tid);
	}
	public void cancelCollect(int uid,int tid) {
		new CancelCollectFlightServiceImpl().collect(uid, tid);
	}

}
