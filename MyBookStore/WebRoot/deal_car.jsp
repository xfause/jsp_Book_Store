<%@page import="javax.swing.JSpinner.ListEditor"%>
<%@ page language="java"
	import="java.util.*,java.sql.*,dao.*,entity.*,java.text.*,java.util.Date"
	pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 设置网页中的字符编码以及数据输入和传输的编码  -->
<%
	response.setContentType("text/html;charset=GBK");
	request.setCharacterEncoding("GBK");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'car.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">

</head>

<body background="picture/back/center.png">
	<%
		Object object = request.getSession().getAttribute("objectUser");
		int bookId = 0;
		if (object == null) {
			/* 未登录的情况 */
	out.println("<script language = 'javascript'>alert('请先登录...');window.location.href='login.jsp?loginType=user';</script>");
		} else {

			/**
			 *  获得书本的数量这里有问题   无法获取到用户输入的具体数据  此处我们默认为一本
			 */
			//int count_buy = Integer.parseInt(request.getParameter("count_buy"));
			//System.out.println("count_buy:" + count_buy);
			//int countbuy = Integer.parseInt(request.getParameter("count_buy"));

			int count_buy = 1;

			bookId = Integer.parseInt(request.getParameter("bookId"));

			/* 将 object 转换成 user 对象获取用户的 id 值  */
			User user = (User) object;
			int userId = 0;
			String sql = "select * from user where account='"
					+ user.getAccount() + "'";
			ResultSet rs = Dao.searchDate(sql);
			while (rs.next()) {
				userId = rs.getInt("id");
			}

			/*  查找到当前书的剩余量   */
			sql = "select * from book where id = " + bookId;
			int allowance = 0; /* 书的余量   */
			try {
				rs = Dao.searchDate(sql);
				while (rs.next()) {
					allowance = rs.getInt("count");
				}
				if (count_buy > allowance) {
		out.println("<script language = 'javascript'>alert('添  加  购  物  车  图  书  数  量  过  大....');window.location.href='book_buy.jsp?bookId=" + bookId + "';</script>");
		} else {
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");
					String dateNowStr = sdf.format(date);

					sql = "insert into shoppingcar_" + userId
							+ " (time,bookId,count) values ('" + dateNowStr
							+ "'," + bookId + "," + count_buy + ")";
					Dao.operateDate(sql);
					
	out.println("<script language = 'javascript'>alert('添  加  成  功  ！！！');window.location.href='book_buy.jsp?bookId=" + bookId + "';</script>");
		}
			} catch (Exception e) {
	out.println("<script language = 'javascript'>alert('添加失败...');window.location.href='book_buy.jsp?bookId=" + bookId + "';</script>");
		}
		}
	%>
</body>
</html>
