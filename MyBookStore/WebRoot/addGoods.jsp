<%@page import="javax.swing.JSpinner.ListEditor"%>
<%@ page language="java" import="java.util.*,java.sql.*,dao.*,entity.*"
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
    
    <title>My JSP 'addGoods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/book.css">

  </head>
  
  <body>
  	<%
  	try {
  		String bookName = request.getParameter("bookName");
  		String bookAuthor = request.getParameter("bookAuthor");
  		String imageAddress = request.getParameter("imageAddress");
  		double price = Double.parseDouble(request.getParameter("price"));
  		int count = Integer.parseInt(request.getParameter("count"));
  		String type = request.getParameter("bookType");
  		String introduce = request.getParameter("introduce");
  		
  		String sql = "insert into book (name,author,price,imageAddress,count,introduce,bookType) values ('" + bookName + "','" + bookAuthor + "'," + price + ",'" + imageAddress + "'," + count + ",'" + introduce + "','" + type + "')";
  		Dao.operateDate(sql);
  		out.println("<script language = 'javascript'>alert('上 架 成 功  ！！！');window.location.href='manage.jsp?manageType=goods';</script>");
  		}catch(Exception e) {
  		out.println("<script language = 'javascript'>alert('上架失败...');window.location.href='manage.jsp?manageType=goods';</script>");
  		}
  	%>
  </body>
</html>
