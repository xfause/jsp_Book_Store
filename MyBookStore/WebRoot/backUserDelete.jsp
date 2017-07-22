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
    <title>删除用户信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles/book.css">
	</head>
  
  <body class="backgroundcolor" background="picture/back/Bg.png">
  <%
  	String userIDStr = request.getParameter("backUserID");
  	int userID = Integer.parseInt(userIDStr);
  	String sql = "";
  	ResultSet rs = null;
  	sql = "delete from user where id = " + userID;
  	%>
  		<script type="text/javascript">
  			alert("删 除 成 功 ！！！");
  		</script>
  	<%
  	try {
  		Dao.operateDate(sql);
  		sql = "select * from user";
			rs = Dao.searchDate(sql);
			ArrayList<User> list = new ArrayList<User>();
			while (rs.next()) {
				int id = rs.getInt("id");
				String account = rs.getString("account");
				String sex = rs.getString("sex");
				String birthday = rs.getString("birthday");
				String telephoneNumber = rs.getString("telephone");
				String email = rs.getString("email");
				String address = rs.getString("address");
				String name = rs.getString("name");
				double money = rs.getDouble("money");
				User user = new User(id, account, name, birthday, sex,
						telephoneNumber, address, email, money);
				list.add(user);
			}
				
	%>
	<div align="center" style="margin-top:50px">
		<table width="900px"
			style="cellspacing:3px;cellpadding:3px;text-align:center" border="1">
			<tr>
				<td><font style="color:#D94600;font-size:20px;">账户名</font>
				</td>
				<td><font style="color:#D94600;font-size:20px;">性别</font>
				</td>
				<td><font style="color:#D94600;font-size:20px;">生日</font>
				</td>
				<td><font style="color:#D94600;font-size:20px;">电话</font>
				</td>
				<td><font style="color:#D94600;font-size:20px;">邮编</font>
				</td>
				<td><font style="color:#D94600;font-size:20px;">地址</font>
				</td>
				<td><font style="color:#D94600;font-size:20px;">真实姓名</font>
				</td>
				<td><font style="color:#D94600;font-size:20px;">账户余额</font>
				</td>
				<td colspan="2"><font
					style="color:#D94600;font-size:20px;color:#D94600">操作</font>
				</td>
			</tr>
			<%
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><%=list.get(i).getAccount()%></td>
				<td><%=list.get(i).getSex()%></td>
				<td><%=list.get(i).getBirthday()%></td>
				<td><%=list.get(i).getTelephoneNumber()%></td>
				<td><%=list.get(i).getEmail()%></td>
				<td><%=list.get(i).getAddress()%></td>
				<td><%=list.get(i).getName()%></td>
				<td><%=list.get(i).getMoney()%></td>
				<td><a
					href="backUserEdit.jsp?backUserID=<%=list.get(i).getId()%>"
					target="backCenter" style="text-decoration:none;">编辑</a>
				</td>
				<td><a
					href="backUserDelete.jsp?backUserID=<%=list.get(i).getId()%>"
					target="backCenter" style="text-decoration:none;">删除</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div><%
  	}catch(Exception e) {
  		e.printStackTrace();
  	%>
  		<script type="text/javascript">
  			alert("删 除 失 败 ...");
  		</script>
  	<%
  	}
  %>
  <div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
  </body>
</html>
