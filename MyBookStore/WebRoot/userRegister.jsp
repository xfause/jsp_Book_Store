<%@ page language="java" import="java.util.*,entity.*" pageEncoding="GBK"%>
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

<title>用户注册</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">
</head>

<body background="picture/back/center.png">
	<div class="login" style="margin-top: 5px">
		<form name="form1" method="post" action="confirmRegister.jsp">
			<P class="text">&nbsp;用&nbsp;户&nbsp;注&nbsp;册</p>
			<p>
				<label>账&nbsp;&nbsp;&nbsp;&nbsp;号： <input type="text"
					name="userAccount" placeholder="必填信息" style="height:30px;"/> </label>
			</p>
			<p>
				<label>密&nbsp;&nbsp;&nbsp;&nbsp;码： <input type="password"
					name="userPassword" placeholder="必填信息" style="height:30px;"/> </label>
			</p>
			<p>
				<label>确认密码： <input type="password" name="passwordConfim" style="height:30px;" placeholder="必填信息"/>
				</label>
			</p>
			<p>
				<label>账户充值： <input type="text" name="money" /> </label>
			</p>
			<p>
				<label>真实姓名： <input type="text" name="name" placeholder="必填信息" style="height:30px;"/> </label>
			</p>
			<p>
				<label>性&nbsp;&nbsp;&nbsp;&nbsp;别： <input type="radio"
					checked="checked" name="sex" value="男">男 <input
					type="radio" name="sex" value="女">女 </label>
			</p>
			<p>
				<label>生&nbsp;&nbsp;&nbsp;&nbsp;日： <input type="text"
					name="birthday" /> </label>
			</p>
			<p>
				<label>联系电话： <input type="text" name="tel" placeholder="必填信息"/> </label>
			</p>
			<p>
				<label>邮政编码： <input type="text"
					name="email" style="height:30px;"/> </label>
			</p>
			<p>
				<label>家庭地址： <input type="text" name="address" placeholder="必填信息" style="height:30px;"/> </label>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
					<input type="submit" name="Submit" value="提交" style="height:30px;"/> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label> <input type="reset" name="Reset" value="重置" style="height:30px;"/> </label>
			</p>
			<p><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
					style="color:red; font-size:15px"><a href="center.jsp"
					style="text-decoration:none">返回首页</a> </font>
			</p>
		</form>
	</div>
	<div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
</body>
</html>
