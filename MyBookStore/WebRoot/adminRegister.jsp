<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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

<title>用户注册</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">
</head>

<body background="picture/back/Bg.png">
	<div class="login" style="margin-top: 40px">
		<form name="form1" method="post" action="confirmAdminRegister.jsp">
			<P class="text">&nbsp;用&nbsp;户&nbsp;注&nbsp;册</p>
			<p>
				<label>账&nbsp;&nbsp;&nbsp;&nbsp;号： <input type="text"
					name="adminAccount" placeholder="账户名" style="height:30px" /> </label>
			</p>
			<p>
				<label>密&nbsp;&nbsp;&nbsp;&nbsp;码： <input type="password"
					name="adminPassword" placeholder="账户密码" style="height:30px" /> </label>
			</p>
			<p>
				<label>确认密码： <input type="password" name="passwordConfim"
					placeholder="确认密码" style="height:30px" /> </label>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
					<input type="submit" name="Submit" value="提交" style="height:30px" />
				</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
					<input type="reset" name="Reset" value="重置" style="height:30px" />
				</label>
			</p>
		</form>
	</div>
</body>
</html>
