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
    
    <title>My JSP 'backGoodAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/book.css">

  </head>
  
  <body class="backgroundcolor" background="picture/back/Bg.png">
  		<div class="login" style="margin-top: 40px">
		<form name="form1" method="post" action="addGoods.jsp">
			<P class="text">&nbsp;图&nbsp;书&nbsp;上&nbsp;架</p>
			<p>
				<label>书籍名称： <input type="text"
					name="bookName" style="height:30px"/> </label>
			</p>
			<p>
				<label>书籍作者： <input type="text"
					name="bookAuthor"  style="height:30px"/> </label>
			</p>
			<p>
				<label>封面路径： <input type="text" name="imageAddress"  style="height:30px"/>
				</label>
			</p>
			<p>
				<label>书籍单价： <input type="text" name="price"  style="height:30px"/> </label>
			</p>
			<p>
				<label>上架数量： <input type="text" name="count"  style="height:30px"/> </label>
			</p>
			<p>
				<label>书籍类型： <input type="text" name="bookType"  style="height:30px"/></label>
			</p>
			<p>
				<label>书籍简介： <input type="text" name="introduce"  style="height:30px"/></label>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
					<input type="submit" name="Submit" value="提交"  style="height:30px"/> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label> <input type="reset" name="Reset" value="重置"  style="height:30px"/> </label>
			</p>
		</form>
	</div>
  </body>
</html>
