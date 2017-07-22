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
    
    <title>My JSP 'settlementOrder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/book.css">

  </head>
  
  <body background="picture/back/center.png">
  <%
  	String userIdString = request.getParameter("userId");
  	int userId = Integer.parseInt(userIdString);
  	String orderIdString = request.getParameter("orderId");
  	int orderId = Integer.parseInt(orderIdString);
  	String bookIdString = request.getParameter("bookId");
  	int bookId = Integer.parseInt(bookIdString);
  	int count = 0;
 // 	double bookPrice = 0;
  	
  	/* 查询出购物车中该订单的书本数量  */
  	String sql = "select * from shoppingcar_" + userId + " where id=" + orderId;
  	ResultSet rs = Dao.searchDate(sql);
  	
  	while(rs.next()) {
  		count = rs.getInt("count");
  		
  	}
  	/* 判断用户的余额是否能够买书   */
/* 	  	sql = "select * from user where id = " + userId;
	  	rs = Dao.searchDate(sql);
	  	double userMoney = 0;
	  	while(rs.next()){
	  		userMoney = rs.getDouble("money");
	  	} */
  	
  	/*  查询并修改数据库中该书本信息的数量    */
  	try {
  		/* 数据库中该书的容量   */
  		int allowance = 0;
  		sql = "select * from book where id=" + bookId;
  		System.out.println(sql);
	  	rs = Dao.searchDate(sql);
	  	
	  	while(rs.next()) {
	  		allowance = rs.getInt("count");
	  	}
	  	
	  	System.out.println("余量;" + allowance);
	  	System.out.println("购买：" + count);
	  	if(count > allowance) {
	  	%><script type="text/javascript">
					alert("无  法  结  算  ，卖   家   图  书  数  量  不  足 ....");
				  </script>
				  <%
	  	}/*  如果钱不够    */
	//  	if(userMoney < (count_buy*bookPrice)){
	 	
	//  	}
	  	else {
	  	/*  将该书的数量从数据库中进行修改    */
	 	sql = "update book set count = " + (allowance-count) + " where id = " + bookId;
	 	Dao.operateDate(sql);
	 	
	 	/*  将该订单信息添加到相对应用户订单表的订单记录中    */
	 	/*  交易时间     */
	 	Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateNowStr = sdf.format(date);
		
	 	sql = "insert into orderform_" + userId + " (time,bookId,count) values ('" + dateNowStr + "'," + bookId + "," + count + ")";
	 	Dao.operateDate(sql);
	 	
	 	/* 删除购物车中的该订单信息   */
	 	sql = "delete from shoppingcar_" + userId + " where id=" + orderId;
	 	Dao.operateDate(sql);
	 	
	 	%><script type="text/javascript">
					alert("结  算   成   功 ! ! !");
				  </script><%}
	 }catch(Exception e) {
		 e.printStackTrace();
	 	%><script type="text/javascript">
					alert("结  算  失  败....");
				  </script><%
	 	}
  %>
  <%
  /*  获取到登陆成功的用户的id */
  		/* String userIdStr = request.getParameter("carId");
  		System.out.println("UserId: " + userIdStr);
  		int userId = Integer.parseInt(userIdStr);  */
  		
  		/*  订单的ID  */
  		orderId = 0;
  		
  		sql = "select * from shoppingcar_" + userId;
  		
		ArrayList<Order> list = new ArrayList<Order>();
		ArrayList<OrderMessage> list2 = new ArrayList<OrderMessage>();
		
		rs = Dao.searchDate(sql);
  		while(rs.next()) {
	  		orderId = rs.getInt("id");
	  		String time = rs.getString("time");
	  		bookId = rs.getInt("bookId");
	  		count = rs.getInt("count");
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
  			count = list.get(i).getCount();
  			
  			sql = "select * from book where id =" + list.get(i).getBookId();	
  			rs = Dao.searchDate(sql);
  			while(rs.next()) {
  				bookId = rs.getInt("id");
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
	<table style="margin-left:3px" height="30px" border="0" width="1320px"
		 cellspacing="3px" cellpadding="3px">
		<%
	    		int j = 0;
	    		for(j = 0 ; j < list2.size() ; j++) {
	    			%>
		<tr>
			<td><a
				href="book_buy.jsp?bookId=<%=list2.get(j).getBookId() %>"><img
					src="<%=list2.get(j).getImageAddress() %>">
			</a></td>
			<td><a href="book_buy.jsp?bookId=<%=list2.get(j).getBookId() %>" style="text-decoration:none">书名： <%=list2.get(j).getBookName() %></a></td>
			<td>作者： <%=list2.get(j).getBookAuthor() %></td>
			<td>价格：￥ <%=list2.get(j).getBookPrice() %></td>
			<td>数量： <%=list2.get(j).getCount() %></td>
			<td>加入购物车时间： <%=list2.get(j).getTime() %></td>
			<td><a href="settlementOrder.jsp?userId=<%=userId %>&orderId=<%=list2.get(j).getOrderId() %>&bookId=<%=list2.get(j).getBookId() %>" style="text-decoration:none">结算订单</a>&nbsp;
			<a href="deleteOrder.jsp?userId=<%=userId %>&carId=<%=list2.get(j).getOrderId() %>&type=car" style="text-decoration:none">删除订单</a></td>
		</tr>
		<%
	    			}
	    		}
	    	%>
	</table>
  <p style="margin-left:600px;margin-top:400px">
		<font style="color:red; font-size:15px"><a href="center.jsp"
			style="text-decoration:none">返回首页</a> </font>
	</p>
	<div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
  </body>
</html>
