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
<body class="backgroundcolor" background="picture/back/backTop.png" style="margin:0">
	<table width="100%">
		<tr>
			<td width="48%" align="center"><h1>
					<b><font style="font-size:80px;color:#AD5A5A">Book Store</font></b>&nbsp;&nbsp;<font style="font-size:30px;color:#FF8000">后台管理</font>
				</h1></td>
			<!-- 判断是否登录 ，如果已经登录则显示用户名，否则不显示  -->
			<td align="right"><b><font color="blue"> <%
 	/* 用于传给订单界面和购物车界面的id  */
 	int userId = 0;
 	String account = "";
	Object obj = request.getSession().getAttribute("login");
 	if (obj != null) {
 		
 		boolean loginSuccess = false;
 		String sql = "select * from ";
 		String loginType = (String) session.getAttribute("loginType");
 		sql += "admin";
 		//	account =new String(request.getParameter("account").getBytes("ISO-8859-1"),"utf-8");
 		account = request.getParameter("account");
 		//	System.out.println("客户输入的：" + account);
 		String password = request.getParameter("password");
 		//	String password =new String(request.getParameter("password").getBytes("ISO-8859-1"),"utf-8");
 		/* 连接数据库  */
 		ResultSet rs = Dao.searchDate(sql);
 		while (rs.next()) {
 			int id = rs.getInt("id");
 			String Account = rs.getString("account");
 			//	System.out.println("数据库里面的：" + Account);
 			String Password = rs.getString("password");
 			if (Account.equals(account) && Password.equals(password)) {
 				loginSuccess = true;
 				userId = rs.getInt("id");
 				break;
 			}
 		}
 		if (loginSuccess) {
 %> <script type="text/javascript">
		alert("登  陆  成  功  ! ! !");
	</script> 
	<a href="manage.jsp?manageType=user" target="backCenter"
						style="color:#FF8000;text-decoration:none">用户管理</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="manage.jsp?manageType=goods" target="backCenter"
						style="color:#FF8000;text-decoration:none">商品管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font style="color:red"><%=account%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</font> <%
 			/* 登陆成功后为session给定一个对象  方便购买或者处理数据时判断是否登陆  */
 				Admin admin = new Admin(account, password);
 				/*  给页面添加对象的缓存   */
 				request.getSession().setAttribute("objectAdmin", admin);
 		} else {
 %> <script type="text/javascript">
		alert("登  陆 失 败...");
	</script> <a href="backLogin.jsp?loginType=admin" target="backCenter"
						style="color:#F75000;text-decoration:none">登陆</a>
					 <%
 	}
 %>
 						<a	href="adminRegister.jsp" target="backCenter"
						style="text-decoration:none;color:gray">注册</a> <a href="backStage.jsp"
						target="backStage.jsp" style="text-decoration:none;color:gray">注销</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%
							} else {
						%> <a href="backLogin.jsp?loginType=admin" target="backCenter"
						style="text-decoration:none;color:#F75000">登陆</a>
					  <a href="adminRegister.jsp" target="backCenter"
						style="text-decoration:none;color:gray">注册</a> <a href="backStage.jsp"
						target="backStage.jsp" style="text-decoration:none;color:gray">注销</a>
				</font> </b></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
