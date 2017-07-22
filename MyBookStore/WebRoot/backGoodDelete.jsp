<%@ page language="java" import="java.util.*"
	import="java.sql.*,dao.*,entity.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setContentType("text/html;charset=GBK");
request.setCharacterEncoding("GBK");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>É¾³ýÓÃ»§ÐÅÏ¢</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/book.css">
	</head>
  
  <body class="backgroundcolor">
  <%
  	String goodIDStr = request.getParameter("backGoodID");
  	int goodID = Integer.parseInt(goodIDStr);
  	String sql = "";
  	ResultSet rs = null;
  	sql = "delete from book where id = " + goodID;
  	try {
  	Dao.operateDate(sql);
  	out.println("<script language = 'javascript'>alert('É¾  ³ý  ³É  ¹¦  £¡£¡£¡');window.location.href='manage.jsp?manageType=goods';</script>");
  	}catch(Exception e) {
 	 out.println("<script language = 'javascript'>alert('É¾ ³ý Ê§ °Ü ...');window.location.href='manage.jsp?manageType=goods';</script>");
  	}
  %>
  </body>
</html>
