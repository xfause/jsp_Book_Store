<%@ page language="java" import="java.util.*,java.sql.*,dao.*,entity.*" pageEncoding="GBK"%>
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
    
    <title>My JSP 'confirmRegister.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/book.css">

  </head>
  
  <body background="picture/back/center.png">
  <%
 	 /*  获取从注册页面的表单中传回来的信息   */
  	String newAccount = request.getParameter("userAccount");
  	String password = request.getParameter("userPassword");
  	String confirmPassword = request.getParameter("passwordConfim");
  	String name = request.getParameter("name");
  	String birthday = request.getParameter("birthday");
  	String sex = request.getParameter("sex");
  	String telephoneNumber = request.getParameter("tel");
  	String address = request.getParameter("address");
  	String email = request.getParameter("email");
  	String moneyStr = request.getParameter("money");
  	double money = Double.parseDouble(moneyStr);
  	
  	
  		if(newAccount.equals("")||password.equals("")||confirmPassword.equals("")||name.equals("")||telephoneNumber.equals("")||address.equals("")||email.equals("")||moneyStr.equals("")) {
  		out.println("<script language = 'javascript'>alert('信息未完善,注 册 失 败 ！！！');window.location.href='userRegister.jsp';</script>");
  	}else {
  	/*  判断是否密码和确认密码相同  */
  	if(!password.equals(confirmPassword)) {
  	out.println("<script language = 'javascript'>alert('确 认 密 码 错 误 ,注 册 失 败...');window.location.href='userRegister.jsp';</script>");
  	}else {
  		/* 检测是否与已有账号重复  */
  		String sql = "select * from user";
  		ResultSet rs = Dao.searchDate(sql);
  		boolean exit = false;
  		while(rs.next()) {
  			String oldAccount = rs.getString("account");
  			if(newAccount.equals(oldAccount)) {
  				exit = true;
  				break;
  			} 
  		}
  		/* 如果账号已经存在  */
 		if(exit) {
 		out.println("<script language = 'javascript'>alert('账 号 已 经 存 在 ,注 册 失 败...');window.location.href='userRegister.jsp';</script>");
 			
  		}else {
	  		try{
	  			/* 注册成功  */
	 			sql = "INSERT INTO USER (account,password,name,birthday,sex,telephone,address,email,money) values ('" + newAccount + "','" + password + "','" + name + "','" + birthday + "','" + sex + "','" + telephoneNumber + "','" + address + "','" + email + "'," + money + ")";
	 			System.out.println("Sql :" + sql);
	 			Dao.operateDate(sql);
	 			sql = "SELECT * FROM USER where account='" + newAccount + "'";
	 			int id = 0;
	 			rs = Dao.searchDate(sql);
	 			while(rs.next()){
	 				id = rs.getInt("id");
	 			}
	 			/**
	 			 * 注册成功之后为该用户创建一个 存订单 和  购物车 信息的表 
	 			 */
	 			String sqlOrderForm = "CREATE TABLE orderform_" + id + " (id INT PRIMARY KEY NOT NULL auto_increment, time VARCHAR(50) NOT NULL, bookId INT(20) NOT NULL, count INT(20) NOT NULL)";
	 			Dao.operateDate(sqlOrderForm);
	 			String sqlShoppingCar = "CREATE TABLE shoppingcar_" + id + " (id INT PRIMARY KEY NOT NULL auto_increment, time VARCHAR(50) NOT NULL, bookId INT(20) NOT NULL, count INT(20) NOT NULL)";
	 			Dao.operateDate(sqlShoppingCar);
	 			out.println("<script language = 'javascript'>alert('注 册 成 功 ！！！');window.location.href='center.jsp';</script>");
	 			}catch(Exception e) {
	 			out.println("<script language = 'javascript'>alert('注 册失败...');window.location.href='center.jsp';</script>");
	 			}
	 		}
  		}
  	}
   %>
  <%--  <div class="login" style="margin-top: 90px;margin-left: 600px"><div style="font-size:30px;font-color:blue">注册信息</div>
   <from>
    	<p>账&nbsp;&nbsp;&nbsp;&nbsp;号：<%=newAccount %></p>
    	<p>密&nbsp;&nbsp;&nbsp;&nbsp;码：<%=password %></p>
    	<p>确认密码：<%=confirmPassword %></p>
    	<p>真实姓名：<%=name %></p>
    	<p>账户充值：<%=money %></p>
    	<p>生&nbsp;&nbsp;&nbsp;&nbsp;日：<%=birthday %></p>
    	<p>性&nbsp;&nbsp;&nbsp;&nbsp;别：<%=sex %></p>
    	<p>联系电话：<%=telephoneNumber %></p>
    	<p>邮政编码：<%=email %></p>
    	<p>家庭住址：<%=address %></p>
    	<br/><br/>
    	<p><font style="color:red; font-size:15px"><a href="userRegister.jsp" target="center"  style="text-decoration:none">返回注册</a>&nbsp;&nbsp;
    	<a href="center.jsp" style="text-decoration:none">返回首页</a></font></p>
    </from>
    </div> --%>
    <div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
  </body>
</html>
