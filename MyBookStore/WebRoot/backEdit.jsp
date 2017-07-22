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

<title>My JSP 'manage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">

</head>
<body background="picture/back/Bg.png">
	<%
		String sql = "";
		ResultSet rs = null;
		int id = 0;
		
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
		
		/*  判断编辑的类型     */
		String editType = request.getParameter("editType");
		if(editType.equals("user")) {
			id = Integer.parseInt(request.getParameter("backID"));
			sql = "select * from user where id = " + id;
			rs = Dao.searchDate(sql);
			
			while(rs.next()) {
				account = rs.getString("account");
			    sex = rs.getString("sex");
				birthday = rs.getString("birthday");
			    telephone = rs.getString("telephone");
			    email = rs.getString("email");
				address = rs.getString("address");
				name = rs.getString("name");
			}
			%>
				<div class="login" style="margin-top: 40px">
		<form name="form1" method="post" action="backSaveMessage.jsp?saveType=user&IDD=<%=id %>">
			<P class="text">&nbsp;用&nbsp;户&nbsp;编&nbsp;辑</p>
			<p>
				<label>账&nbsp;&nbsp;&nbsp;&nbsp;号： <input type="text"
					name="account" value="<%=account %>" /> </label>
			</p>
			<p>
				<label>真实姓名： <input type="text" name="name" value="<%=name %>" /> </label>
			</p>
			<p>
				<label>性&nbsp;&nbsp;&nbsp;&nbsp;别： <input type="text" name="sex" value="<%=sex %>" /></label>
			</p>
			<p>
				<label>生&nbsp;&nbsp;&nbsp;&nbsp;日： <input type="text"
					name="birthday" value="<%=birthday %>" /> </label>
			</p>
			<p>
				<label>联系电话： <input type="text" name="tel" value="<%=telephone %>" /> </label>
			</p>
			<p>
				<label>邮政编码： <input type="text"
					name="email" value="<%=email %>" /> </label>
			</p>
			<p>
				<label>家庭地址： <input type="text" name="address" value="<%=address %>" /></label>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>
					<input type="submit" name="Submit" value="提交" style="height:30px"/> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label> <input type="reset" name="Reset" value="重置" style="height:30px"/> </label>
			</p>
		</form>
	</div>
			<% 
		}else if(editType.equals("goods")) {
			id = Integer.parseInt(request.getParameter("backID"));
			sql = "select * from book where id = " + id;
			rs = Dao.searchDate(sql);
			
			while(rs.next()) {
				bookName = rs.getString("name");
				bookAuthor = rs.getString("author");
				bookPrice = rs.getDouble("price");
				bookCount = rs.getInt("count");
				imageAddress = rs.getString("imageAddress");
				bookIntroduce = rs.getString("introduce");
				bookType = rs.getString("bookType");
			}
			
			%>
				<div class="login" style="margin-top: 40px">
		<form name="form1" method="post" action="backSaveMessage.jsp?saveType=goods&IDD=<%=id %>">
			<P class="text">&nbsp;书&nbsp;籍&nbsp;编&nbsp;辑</p>
			<p>
				<label>书&nbsp;&nbsp;&nbsp;&nbsp;名 ： <input type="text"
					name="bookName" value="<%=bookName %>" /> </label>
			</p>
			<p>
				<label>作&nbsp;&nbsp;&nbsp;&nbsp;者 ： <input type="text"
					name="bookAuthor" value="<%=bookAuthor %>" /> </label>
			</p>
			<p>
				<label>价&nbsp;&nbsp;&nbsp;&nbsp;格 ： <input type="text"
					name="bookPrice" value="<%=bookPrice %>" /> </label>
			</p>
			<p>
				<label>图片路径 ： <input type="text"
					name="imageAddress" value="<%=imageAddress %>" /> </label>
			</p>
			<p>
				<label>书籍数量 ： <input type="text"
					name="bookCount" value="<%=bookCount %>" /> </label>
			</p>
			<p>
				<label>书籍类型 ： <input type="text"
					name="bookType" value="<%=bookType %>" /> </label>
			</p>
			<p>
				<label>书籍简介 ： <input type="text"
					name="bookIntroduce" value="<%=bookIntroduce %>" /> </label>
			</p>
			<p>
				<label>图书封面 ：<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="<%=imageAddress %>"></label>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>
					<input type="submit" name="Submit" value="提交" style="height:30px" /> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label> <input type="reset" name="Reset" value="重置" style="height:30px" /> </label>
			</p>
			</form>
			</div>
			<% 
		} 
	%>
  </body>
</html>
