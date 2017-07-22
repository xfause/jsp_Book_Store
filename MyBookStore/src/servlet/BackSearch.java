package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import entity.*;

public class BackSearch extends HttpServlet {

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

		String is = request.getParameter("is");
		String name = request.getParameter("search");
		
		if (is.equals("book")) {
			ArrayList<Book> list = new ArrayList<Book>();

			String bookType = request.getParameter("type");
			System.out.println("book select:" + bookType);
			String sql = "";
			if (bookType.equals("all")) {
				sql = "select * from book";
			} else {
				sql = "select * from book where bookType='" + bookType + "'";
			}

			try {
				ResultSet rs = Dao.searchDate(sql);
				while(rs.next()) {
					int id = rs.getInt("id");
					String Bookname = rs.getString("name");
					String author = rs.getString("author");
					double price = rs.getDouble("price");
					String imageAddress = rs.getString("imageAddress");
					int count = rs.getInt("count");
					String introduce = rs.getString("introduce");
					String booktype = rs.getString("bookType");
					Book book = new Book(id, Bookname, author, price, imageAddress,
							count, introduce, booktype);
					list.add(book);
				}
				
				if (name.equals("")) {
					// 将按照选择的类型查找 否则还要在类型中查找相关名字的书籍
					System.out.println("输入为空 list的长度 ：" + list.size());
					request.getSession().setAttribute("manageType","goods");
					request.getSession().setAttribute("SearchBook", list);
					request.getSession().setAttribute("isSearch", true);
				} else {
					ArrayList<Book> list2 = new ArrayList<Book>();
					for(int i = 0; i < list.size(); i++) {
						String BN = list.get(i).getBookName();
						if(BN.contains(name)) {
							list2.add(list.get(i));
						}
					}
					request.getSession().setAttribute("SearchBook", list2);
					request.getSession().setAttribute("isSearch", true);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			ArrayList<User> list = new ArrayList<User>();
			String type = request.getParameter("type");
			String sql = "";
			sql = "select * from user";
			ResultSet rs;
			try {
				rs = Dao.searchDate(sql);
				while (rs.next()) {
					int id = rs.getInt("id");
					String account = rs.getString("account");
					String sex = rs.getString("sex");
					String birthday = rs.getString("birthday");
					String telephoneNumber = rs.getString("telephone");
					String email = rs.getString("email");
					String address = rs.getString("address");
					String Rename = rs.getString("name");
					double money = rs.getDouble("money");
					User user = new User(id, account, Rename, birthday, sex,
							telephoneNumber, address, email, money);
					list.add(user);
				}
				
				if(name.equals("")||type.equals("all")) {
					request.getSession().setAttribute("manageType","user");
					request.getSession().setAttribute("SearchUser", list);
					request.getSession().setAttribute("isSearch", true);
				}else {
					ArrayList<User> list2 = new ArrayList<User>();
					for(int i = 0; i < list.size(); i++) {
						String str = "";
						if(type.equals("sex")) {
							str = list.get(i).getSex();
						}else if(type.equals("birthday")) {
							str = list.get(i).getBirthday();
						}else if(type.equals("telephone")) {
							str = list.get(i).getTelephoneNumber();
						}else if(type.equals("address")) {
							str = list.get(i).getAddress();
						}else if(type.equals("account")) {
							str = list.get(i).getAccount();
						}else if(type.equals("name")) {
							str = list.get(i).getName();
						}else if(type.equals("email")) {
							str = list.get(i).getEmail();
						}
						if(str.contains(name)) {
							list2.add(list.get(i));
						}
					}
					request.getSession().setAttribute("SearchUser", list2);
					request.getSession().setAttribute("isSearch", true);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 跳转到manager页面
		response.sendRedirect("manage.jsp");
	}
}
