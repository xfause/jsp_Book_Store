<%@page import="javax.swing.JSpinner.ListEditor"%>
<%@ page language="java" import="java.util.*,java.sql.*,dao.*,entity.*"
	pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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

<title>My JSP 'userOrder.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">

</head>
<body background="picture/back/center.png">
	<%
  		/*  获取到登陆成功的用户的id */
  		String userIdStr = request.getParameter("carId");
  		int userId = Integer.parseInt(userIdStr);
  		
  		/*  订单的ID  */
  		int orderId = 0;
  		
  		String sql = "select * from shoppingcar_" + userId;
  		
		ArrayList<Order> list = new ArrayList<Order>();
		ArrayList<OrderMessage> list2 = new ArrayList<OrderMessage>();
		
		ResultSet rs = Dao.searchDate(sql);
  		while(rs.next()) {
	  		orderId = rs.getInt("id");
	  		String time = rs.getString("time");
	  		int bookId = rs.getInt("bookId");
	  		int count = rs.getInt("count");
	  		/* 创建一个订单对象实例  */
	  		Order order = new Order(orderId,time,bookId,count);
	  		list.add(order);
  		}
  		
  		int size = list.size();
  		/* 判断是否有订单消息  */
  		if(size == 0) {
  			%><script type="text/javascript">
							alert("您 还 没 有  购 物 车 信 息....");
						</script>
	<p style="margin-left:650px;margin-top:400px">
		<font style="color:red; font-size:15px"><a href="center.jsp"
			style="text-decoration:none">返回首页</a> </font>
	</p>
	<%
  		}else {
  		/*  得到完全的购买书籍的订单信息    */
  		for(int i = 0 ; i < size ;i++) {
  		
  			int orderID = list.get(i).getId();
  			String time = list.get(i).getTime();
  			int count = list.get(i).getCount();
  			
  			sql = "select * from book where id =" + list.get(i).getBookId();	
  			rs = Dao.searchDate(sql);
  			while(rs.next()) {
  				int bookId = rs.getInt("id");
  				String bookName = rs.getString("name");
  				String bookAuthor = rs.getString("author");
  				double bookPrice = rs.getDouble("price");
  				String imageAddress = rs.getString("imageAddress");
  				/* 创建订单消息的实例 */
  				OrderMessage orderMessage = new OrderMessage(orderID,time,bookId,bookName,bookAuthor,bookPrice,imageAddress,count);
  				list2.add(orderMessage);
  			}
  		}
  		%>
	<table style="margin-left:5px;text-align:center" height="30px" width="1350px" cellspacing="0px" cellpadding="0px" align="center" border=1 bordercolor="white">
		 <tr bgcolor="#66CD00">
				<td ><font
					style="color:#FFF;font-size:20px;">图书封面</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">书名</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">作者</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">价格</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">数量</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">加入购物车时间</font>
				</td>
				<td colspan="2"><font
					style="color:#FFF;font-size:20px;">操作</font>
				</td>
			</tr>
		<%
	    		int j = 0;
	    		for(j = 0 ; j < list2.size() ; j++) {
	    			%>
		<tr>
			<td style="border:solid 1px #FFF"><a
				href="book_buy.jsp?bookId=<%=list2.get(j).getBookId() %>"><img
					src="<%=list2.get(j).getImageAddress() %>">
			</a></td>
			<td ><a href="book_buy.jsp?bookId=<%=list2.get(j).getBookId() %>" style="text-decoration:none">书名： <%=list2.get(j).getBookName() %></a></td>
			<td > <%=list2.get(j).getBookAuthor() %></td>
			<td >￥ <%=list2.get(j).getBookPrice() %></td>
			<td > <%=list2.get(j).getCount() %></td>
			<td > <%=list2.get(j).getTime() %></td>
			<td ><a href="settlementOrder.jsp?userId=<%=userId %>&orderId=<%=list2.get(j).getOrderId() %>&bookId=<%=list2.get(j).getBookId() %>" style="text-decoration:none; color:green">结算订单</a>&nbsp;&nbsp;
			<a href="deleteOrder.jsp?userId=<%=userId %>&carId=<%=list2.get(j).getOrderId() %>&type=car" style="text-decoration:none;color:red">删除订单</a></td>
		</tr>
		<%
	    			}
	    		}
	    	%>
	</table>
</body>
</html>
