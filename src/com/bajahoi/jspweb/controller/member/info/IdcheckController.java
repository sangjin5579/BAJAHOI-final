package com.bajahoi.jspweb.controller.member.info;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bajahoi.jspweb.dao.MemberDao;
import com.bajahoi.jspweb.entity.Member;
import com.bajahoi.jspweb.jdbc.JdbcMemberDao;
import com.google.gson.Gson;




@WebServlet("/member/info/idcheck")
public class IdcheckController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		
		String memberId = request.getParameter("id");
		PrintWriter out = response.getWriter();
		MemberDao memberDao = new JdbcMemberDao();
		Member member = memberDao.get(memberId);
		
		Gson gson = new Gson();
		String json = gson.toJson(member);
		
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		
		out.println(json);

	}
	
}
