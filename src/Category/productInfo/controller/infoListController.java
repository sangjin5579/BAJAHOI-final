package Category.productInfo.controller;

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


import com.bajahoi.jspweb.dao.ProductDao;
import com.bajahoi.jspweb.entity.Product;
import com.bajahoi.jspweb.jdbc.JdbcProductDao;

@WebServlet("/Category/productInfo/infoList")
public class infoListController extends HttpServlet 
{
	@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException 
	{	
		String id = request.getParameter("id");
		ProductDao productDao = new JdbcProductDao();

		Product product = productDao.get(id);
		

		request.setAttribute("product",product);
		request.getContextPath();
		
		ApplicationContext applicationContext = ServletUtil
	            .getApplicationContext(request.getSession().getServletContext());
	      TilesContainer container = TilesAccess.getContainer(applicationContext);
	      ServletRequest servletRequest = new ServletRequest(applicationContext, request, response);
	      container.render("Category.productInfo.infoList", servletRequest);
		
	      
	}
	
	

}
