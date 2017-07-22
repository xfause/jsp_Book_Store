<%@ page language="java" import="java.util.*"
	import="java.sql.*,dao.*,entity.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	response.setContentType("text/html;charset=GBK");
	request.setCharacterEncoding("GBK");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>top</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="styles/book.css">
</head>
<body background="picture/back/top.png">
	<table width="100%">
		<tr>
			<td><img src="picture/back/logo.png">
			</td>
			<td width="35%" align="center"><h1>
					<font style="font-size:80px;color:#AD5A5A">Book Store</font>
				</h1>
			</td>
			<td><table cellspacing="2px" cellpadding="2px" border="1"
					bordercolor="red" align="center">
					<tr>
						<td rowspan="2"><font style="color:red">图书分类:</font></td>
						<td><a href="center.jsp?bookType=art" target="center"
							style="text-decoration:none">艺术类</a></td>
						<td><a href="center.jsp?bookType=movie" target="center"
							style="text-decoration:none">电影类</a></td>
						<td><a href="center.jsp?bookType=encouragement"
							target="center" style="text-decoration:none">成功励志类</a></td>
					</tr>
					<tr>
						<td><a href="center.jsp?bookType=novel" target="center"
							style="text-decoration:none">小说类</a></td>
						<td><a href="center.jsp?bookType=computer" target="center"
							style="text-decoration:none">计算机类</a></td>
					</tr>
				</table>
			</td>
			<!-- 判断是否登录 ，如果已经登录则显示用户名，否则不显示  -->
			<td align="right"><b><font color="blue"> <%
 	/* 用于传给订单界面和购物车界面的id  */
 	int userId = 0;
 	String account = "";
	
	/** 点击了登陆按扭   */
 	if (session.getAttribute("loginType") != null  && session.getAttribute("loginType") != "") {
 		boolean loginSuccess = false;
 		String sql = "select * from ";
 		String loginType = (String) session.getAttribute("loginType");
 		if (loginType.equals("admin")) {
 			sql += "admin";
 		} else if (loginType.equals("user")) {
 			sql += "user";
 		}
 		account = request.getParameter("account");
 		String password = request.getParameter("password");
 		/* 连接数据库  */
 		ResultSet rs = Dao.searchDate(sql);
 		while (rs.next()) {
 			int id = rs.getInt("id");
 			String Account = rs.getString("account");
 			String Password = rs.getString("password");
 			if (Account.equals(account) && Password.equals(password)) {
 				loginSuccess = true;
 				userId = rs.getInt("id");
 				break;
 			}
 		}
 		if (loginSuccess) {
 		session.setAttribute("loginType", "");
 %> <script type="text/javascript">
		alert("登  陆  成  功  ! ! !");
	</script> <font><a href="showUserMessage.jsp?userName=<%=account%>"
							target="center" style="text-decoration:none;color:red"><%=account%></a>
					</font> <a href="userOrder.jsp?orderId=<%=userId%>" target="center"
						style="color:gray;text-decoration:none">我的订单</a> <a
						href="userCar.jsp?carId=<%=userId%>" target="center"
						style="color:gray;text-decoration:none">我的购物车</a> <a
						href="center.jsp" target="center"
						style="text-decoration:none;color:gray">首页</a> <a
						href="userRegister.jsp" target="center"
						style="text-decoration:none;color:gray">注册</a> <a
						href="Cancellation" style="text-decoration:none;color:gray">注销</a>
						<%
 			/* 登陆成功后为session给定一个对象  方便购买或者处理数据时判断是否登陆  */
 			 if (loginType.equals("user")) {
 				User user = new User(account, password);
 				/*  给页面添加对象的缓存   */
 				request.getSession().setAttribute("objectUser", user);
 				request.setAttribute("enter", "true");
 			}
 		} else {
 %><script type="text/javascript">
							alert("登  陆  失  败 ....");
						</script><a href="login.jsp?loginType=user" target="center"
						style="text-decoration:none;color:gray"><font color="#F75000">亲，请先登陆</font>
					</a> <a href="center.jsp" target="center"
						style="text-decoration:none;color:gray">首页</a> <a
						href="userRegister.jsp" target="center"
						style="text-decoration:none;color:gray">注册</a> <%
 	}
							} else {
						%> <a href="login.jsp?loginType=user" target="center"
						style="text-decoration:none;color:gray"><font color="#F75000">亲，请先登陆</font>
					</a> <a href="center.jsp" target="center"
						style="text-decoration:none;color:gray">首页</a> <a
						href="userRegister.jsp" target="center"
						style="text-decoration:none;color:gray">注册</a>
				</font> </b>
			</td>
		</tr>

		<%
			}
		%>
	</table>
</body>
</html>
