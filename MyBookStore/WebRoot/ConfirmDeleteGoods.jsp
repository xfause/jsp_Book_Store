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
<body class="backgroundcolor" style="margin-top:50px;align:center;" background="picture/back/Bg.png">
<div class="login" style="margin-top: 90px;margin-left: 300px">
	<%
		String sql = "";
		ResultSet rs = null;
		int id = 0;
		/* 商品的信息  */
		String bookName = "";
		String bookAuthor = "";
		String imageAddress = "";
		int bookCount = 0;
		double bookPrice = 0;
		String bookIntroduce = "";
		String bookType = "";
		id = Integer.parseInt(request.getParameter("backGoodID"));
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
			<table>
			<tr><td rowspan="3"><img src="<%=imageAddress %>"></td>
			<td><font style="font-size:35px;color:blue">&nbsp;<%=bookName %></font></td></tr>
			<tr><td><font style="font-size:30px;color:red">&nbsp;￥ <%=bookPrice %></font></td></tr>
			<tr><td><font style="font-size:15px;">&nbsp;&nbsp;&nbsp;库存 <%=bookCount %> 册</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="backGoodDelete.jsp?backGoodID=<%=id %>"
					target="backCenter" style="text-decoration:none;"><input type="button" value="确认删除" style="height:30px"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="manage.jsp?manageType=goods"
					target="backCenter" style="text-decoration:none;"><input type="button" value="取消" style="height:30px"></a></td></tr>
			</table>
			<br />
			<font style="font-size:16px;color:blue">图书简介</font>
			<hr />
			&nbsp;&nbsp;ISBN: <%=id %><br />
			&nbsp;&nbsp;书名：<%=bookName %><br />
			&nbsp;&nbsp;作者：<%=bookAuthor %><br />
			&nbsp;&nbsp;价格：￥<%=bookPrice %><br />
			&nbsp;&nbsp;类型：<%=bookType %><br />
			&nbsp;&nbsp;简介:<%=bookIntroduce %><br /><br />
			</div>
			<div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
 </body>
</html>
