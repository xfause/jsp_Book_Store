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
    
    <title>My JSP 'confirmAdminRegister.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/book.css">

  </head>
  
  <body background="picture/back/Bg.png">
  <%
  	String adminAccount = request.getParameter("adminAccount");
  	String password = request.getParameter("adminPassword");
  	String confirmPassword = request.getParameter("passwordConfim");
  	if(adminAccount.equals("")||password.equals("")||confirmPassword.equals("")) {
  	out.println("<script language = 'javascript'>alert('信息未完善,注 册 失 败 ！！！');window.location.href='adminRegister.jsp';</script>");
  	
  	}else {
  	/*  判断是否密码和确认密码相同  */
  	if(!password.equals(confirmPassword)) {
  	out.println("<script language = 'javascript'>alert('确 认 密 码 错 误 ,注 册 失 败...');window.location.href='adminRegister.jsp';</script>");
  		
  	}else {
  		/* 检测是否与已有账号重复  */
  		String sql = "select * from admin";
  		ResultSet rs = Dao.searchDate(sql);
  		boolean exit = false;
  		while(rs.next()) {
  			String oldAccount = rs.getString("account");
  			if(adminAccount.equals(oldAccount)) {
  				exit = true;
  				break;
  			} 
  		}
  		/* 如果账号已经存在  */
 		if(exit) {
 		out.println("<script language = 'javascript'>alert('账 号 已 经 存 在 ,注 册 失 败...');window.location.href='adminRegister.jsp';</script>");
  		}else {
  		try{
	  			/* 注册成功  */
	 			sql = "INSERT INTO admin (account,password) values ('" + adminAccount + "','" + password +  "')";
	 			Dao.operateDate(sql);
	 			out.println("<script language = 'javascript'>alert('注 册 成 功 ！！！');window.location.href='adminRegister';</script>");
	 			
	 			}catch(Exception e) {
	 			e.printStackTrace();
	 			out.println("<script language = 'javascript'>alert('注 册 失 败...');window.location.href='adminRegister.jsp';</script>");
	 			}}}}
  %>
  </body>
</html>
