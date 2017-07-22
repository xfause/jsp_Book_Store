<%@page import="javax.swing.JSpinner.ListEditor"%>
<%@ page language="java" import="java.util.*,java.sql.*,dao.*,entity.*,java.text.*,java.util.Date"
	pageEncoding="GBK"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	response.setContentType("text/html;charset=GBK");
 	request.setCharacterEncoding("GBK");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'buy_book.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/book.css">
  </head>
  
  <body background="picture/back/center.png" style="margin-top:0px;margin-left:100px">
  <%
		String sql = "";
		int id = Integer.parseInt(request.getParameter("bookId"));
		sql = "select * from book where id =" + id;
		ResultSet rs = Dao.searchDate(sql);
			double price = 0;
			String author = "";
			String name = "";
			String imageAddress = "";
			int count = 0;
			String introduce = "";
			String bookType = "";
		while(rs.next()) {
		imageAddress = rs.getString("imageAddress");
		 	price= rs.getDouble("price");
			author = rs.getString("author");
			name = rs.getString("name");
			count  = rs.getInt("count");
			introduce = rs.getString("introduce");
			bookType = rs.getString("bookType");
		}
  	 %>
  	 <form action="deal_book.jsp?bookId=<%=id %>" method="post">
  	 <table width = "700px" height="270px" border="0" align="center">
			<tr><td rowspan="4"><img src="<%=imageAddress %>"></td>
			<td><font style="font-size:35px;color:blue">&nbsp;<%=name %></font></td></tr>
			<tr><td><font style="font-size:30px;color:red">&nbsp;￥ <%=price %></font></td></tr>
				<tr><td><font style="font-size:15px;">&nbsp;&nbsp;&nbsp;购买数量：<input size=5 type="text" name="count_buy" value="1">&nbsp;&nbsp;&nbsp;库存 <%=count %> 册</font>
					</td></tr>
			<tr align="left"><td>&nbsp;&nbsp;
  	 	<a href="deal_book.jsp"><input type="submit" style="height:30px" value="确认购买"></a>&nbsp;&nbsp;<a href="deal_car.jsp?bookId=<%=id %>"><input  style="height:30px" type="button" value="加入购物车"></a>&nbsp;&nbsp;<a href="center.jsp"><input  style="height:30px" type="button" value="返回" name="return"></a></td></tr>
  	 	</table>
			<br />
			<font style="font-size:16px;color:blue">图书简介</font>
			<hr />
			&nbsp;&nbsp;ISBN: <%=id %><br />
			&nbsp;&nbsp;书名：<%=name %><br />
			&nbsp;&nbsp;作者：<%=author %><br />
			&nbsp;&nbsp;价格：<%=price %><br />
			&nbsp;&nbsp;类型：<%=bookType %><br />
			&nbsp;&nbsp;简介:<%=introduce %><br /><br />
  	 </form>
  	 <div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
  </body>
</html>
