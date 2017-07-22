package servlet;

import java.io.IOException;

import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import entity.Book;

public class SearchSevlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("GBK");
		
		ArrayList<Book> list = new ArrayList<Book>();
		String searchName = request.getParameter("search").trim();
		searchName =new String(searchName.getBytes(),"GBK");
		String sql = "select * from book";
		try {
			ResultSet rs = Dao.searchDate(sql);
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String author = rs.getString("author");
				double price = rs.getDouble("price");
				String imageAddress = rs.getString("imageAddress");
				int count = rs.getInt("count");
				String introduce = rs.getString("introduce");
				String type = rs.getString("bookType");
				System.out.println("book:" + name);
				System.out.println("search:" + searchName);
				if (name.contains(searchName)) {
					/* 创建 book 对象 */
					Book book = new Book(id, name, author, price, imageAddress,
							count, introduce, type);
					/* 将 book 对象加入到线性表中 */
					list.add(book);
				}
			}
				request.getSession().setAttribute("SearchBook", list);
				request.getSession().setAttribute("isSearch", true);
				request.getSession().setAttribute("searchName", searchName);
				response.sendRedirect("center.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
