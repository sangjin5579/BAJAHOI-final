package com.bajahoi.jspweb.controller.member.purchase;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tiles.TilesContainer;
import org.apache.tiles.access.TilesAccess;
import org.apache.tiles.request.ApplicationContext;
import org.apache.tiles.request.servlet.ServletRequest;
import org.apache.tiles.request.servlet.ServletUtil;

import com.bajahoi.jspweb.dao.WishListDao;
import com.bajahoi.jspweb.entity.WishListView;
import com.bajahoi.jspweb.jdbc.JdbcWishListDao;

@WebServlet("/member/purchase/wishlist")
public class WishlistController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int page = 1;
		int lastPage = 1;
		
		String page_ = request.getParameter("p");
		if(page_!=null && !page_.equals(""))
			page = Integer.parseInt(page_);
		
		String id = (String)request.getSession().getAttribute("id");
		WishListDao wishListDao = new JdbcWishListDao();		
		WishListView wishListView = wishListDao.get(id);

		List<WishListView> list = wishListDao.getList(id,page);
		int count = wishListDao.getCount(id);
		
			lastPage = count / 3;
			if(count%3>0)
				lastPage++;
				
		int off = (page-1)%3;
		int startNum = page - off;	
		
		request.setAttribute("wishListView", wishListView);
		request.setAttribute("list",list);
		request.setAttribute("count", count);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("startNum", startNum);
		
		
/*		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/member/purchase/wishlist.jsp");
		dispatcher.forward(request, response);*/
		
		 ApplicationContext applicationContext = ServletUtil .getApplicationContext(request.getSession().getServletContext());
	        TilesContainer container = TilesAccess.getContainer(applicationContext);
	        ServletRequest servletRequest = new ServletRequest(applicationContext, request, response);
	        container.render("member.purchase.home.wishlist", servletRequest);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8;");
		request.setCharacterEncoding("UTF-8");
		
		String mid = (String)request.getSession().getAttribute("id");
		String pid =request.getParameter("pid");
		
		WishListDao wishListDao = new JdbcWishListDao();
		wishListDao.delete(mid, pid);
		
		response.sendRedirect("wishlist");
		
		
	}
	
}
