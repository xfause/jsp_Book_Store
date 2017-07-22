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

<title>My JSP 'backSaveMessage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">
</head>

<body class="backgroundcolor" style="margin-top:220px;margin-left:600px"
	background="picture/back/Bg.png">
	<%
  	String saveType = "";
  	String sql = "";
  	ResultSet rs = null;
  	int id = 0 ;
  	
  	/* 用户的信息  */
		String account = "";
		String sex = "";
		String birthday = "";
		String telephone = "";
		String email = "";
		String address = "";
		String name = "";
		
		/* 商品的信息  */
		String bookName = "";
		String bookAuthor = "";
		String imageAddress = "";
		int bookCount = 0;
		double bookPrice = 0;
		String bookIntroduce = "";
		String bookType = "";
		
  	saveType = request.getParameter("saveType");
  	id = Integer.parseInt(request.getParameter("IDD"));
  	try {
  	if(saveType.equals("user")) {
  		account = request.getParameter("account");
  		sex = request.getParameter("sex");
  		birthday = request.getParameter("birthday");
  		telephone = request.getParameter("tel");
  		email = request.getParameter("email");
  		name = request.getParameter("name");
  		address = request.getParameter("address");
  		sql = "update user set account='" + account + "',name='" + name + "',birthday='" + birthday + "',sex='" + sex + "',telephone='" + telephone + "',email='" + email + "',address='" + address + "' where id="+ id;
  		Dao.operateDate(sql);
  	}else if(saveType.equals("goods")) {
  		bookName = request.getParameter("bookName");
  		bookAuthor = request.getParameter("bookAuthor");
  		bookPrice = Double.parseDouble(request.getParameter("bookPrice"));
  		bookCount = Integer.parseInt(request.getParameter("bookCount"));
  		imageAddress = request.getParameter("imageAddress");
  		bookIntroduce = request.getParameter("bookIntroduce");
  		bookType = request.getParameter("bookType");
  		sql = "update book set name='" + bookName + "',author='" + bookAuthor + "',price=" + bookPrice + ",count=" + bookCount + ",imageAddress='" + imageAddress + "',introduce='" + bookIntroduce + "',bookType='" + bookType + "' where id = " + id;
  		Dao.operateDate(sql);
  		System.out.println(sql);
		}
		out.println("<script language = 'javascript'>alert('信 息 保 存 成 功 ！！！');window.location.href='manage.jsp?manageType=" + saveType + "';</script>");
  	}catch(Exception e) {
  		out.println("<script language = 'javascript'>alert('信 息 保 存 失 败....');window.location.href='backEdit.jsp?id=?editType=" + saveType + "&backID=" + id + "';</script>");
  		e.printStackTrace();
  	}
  %>
	<div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
</body>
</html>
