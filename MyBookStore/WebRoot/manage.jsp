<%@page import="javax.swing.JSpinner.ListEditor"%>
<%@ page language="java" import="java.util.*,java.sql.*,dao.*,entity.*"
	pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

<title>My JSP 'manage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">

</head>
<body class="backgroundcolor" background="picture/back/Bg.png">
	<%
		String manageType = request.getParameter("manageType");
		/** 通过点击搜索按钮之后在上方商品管理的数据类型信息就获取不到了  就通过searchSevlet来获取  */
		if(manageType==null) {
			manageType = (String)request.getSession().getAttribute("manageType");
		} 
		/*  判断管理的类型    是用户还是商品  */
		String sql = "";
		ResultSet rs = null;
		String messageType = "";
		/* if(manageType.equals("user")){
			messageType = "用户";
		}else {
			messageType = "商品";
		} */
		if (manageType.equals("user")) {
			ArrayList<User> list = new ArrayList<User>();
			ArrayList<User> searchList = new ArrayList<User>();
		
			searchList = (ArrayList<User>)(request.getSession().getAttribute("SearchUser"));
			
			if(searchList!=null) {
				list = searchList;
				request.getSession().removeAttribute("SearchUser");
			}else {
			
			sql = "select * from user";
			rs = Dao.searchDate(sql);
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
			}
	%>
	<div style="margin-left:230px;margin-top:0px">
		<form action="BackSearch?is=user" method="post">
			<b><font size="50px" color="#AD5A5A">用户信息</font> </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			关键字：<input type="text" name="search" style="height:30px" size="15"
				placeholder="请输入搜索条件">&nbsp;&nbsp;类型：<select name="type"
				style="height:30px;">
				<option selected value='all'>所有类型</option>
				<option value='sex'>性别</option>
				<option value='birthday'>生日</option>
				<option value='telephone'>电话</option>
				<option value='address'>地址</option>
				<option value='account'>账户名</option>
				<option value='name'>真实姓名</option>
				<option value='email'>邮政编码</option>
			</select> <input type="submit" value="搜索" style="height:30px">
		</form>
	</div>
	<div align="center" style="margin-top:50px">
		<table width="900px"
			cellspacing="0px" cellpadding="0px" align="center" border=1 bordercolor="white">
			<tr bgcolor="#66CD00" align="center">
				<td ><font
					style="color:#FFF;font-size:20px;">账户名</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">性别</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">生日</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">电话</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">邮编</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">地址</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">真实姓名</font>
				</td>
				<td colspan="2"><font
					style="color:#FFF;font-size:20px;">操作</font>
				</td>
			</tr>
			<%
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr align="center">
				<td ><font color="#408080"><%=list.get(i).getAccount()%></font></td>
				<td ><%=list.get(i).getSex()%></td>
				<td ><%=list.get(i).getBirthday()%></td>
				<td ><%=list.get(i).getTelephoneNumber()%></td>
				<td ><%=list.get(i).getEmail()%></td>
				<td ><font color="#8F4586"><%=list.get(i).getAddress()%></font></td>
				<td ><font color="#5A5AAD"><%=list.get(i).getName()%></font></td>
				<td ><a
					href="backEdit.jsp?editType=user&backID=<%=list.get(i).getId()%>"
					target="backCenter" style="text-decoration:none;color:blue">编辑<!-- <img src="picture/buttonImage/modify.png"> --></a>
				</td>
				<td ><a
					href="backUserDelete.jsp?backUserID=<%=list.get(i).getId()%>"
					target="backCenter" style="text-decoration:none;color:red">删除<!-- <img src="picture/buttonImage/delete.png"> --></a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<%} else if (manageType.equals("goods")) {
			ArrayList<Book> list = new ArrayList<Book>();
			ArrayList<Book> searchList = new ArrayList<Book>();
		 int maxPage = 0;
		 int Page = 0;
			searchList = (ArrayList<Book>)(request.getSession().getAttribute("SearchBook"));
			
			if(searchList!=null) {
				list = searchList;
				request.getSession().removeAttribute("SearchBook");
			}else {
			
			sql = "select * from book";
			String str = (String)request.getParameter("Page");
			if(str==null) {
				str = "0";
			}
			
			int pagesize = 13;
			rs = Dao.searchDate(sql);
			// 分页
			rs.last(); // 使用rs.getRow() 之前必须要先使用rs.last()
	       int RecordCount = rs.getRow();
	      
	       maxPage = (RecordCount%pagesize == 0)?(RecordCount/pagesize):(RecordCount/pagesize + 1);
	       Page = Integer.parseInt(str);
	       if(Page < 1){
	          Page = 1;
	       }else{
	          if(Page > maxPage){
	             Page = maxPage;
	          }
	       }
	       rs.absolute((Page - 1)*pagesize + 1);
	       for(int i = 1;i <= pagesize;i++){
	             	int id = rs.getInt("id");
					String name = rs.getString("name");
					String author = rs.getString("author");
					double price = rs.getDouble("price");
					String imageAddress = rs.getString("imageAddress");
					int count = rs.getInt("count");
					String introduce = rs.getString("introduce");
					String bookType = rs.getString("bookType");
					Book book = new Book(id, name, author, price, imageAddress,
							count, introduce, bookType);
					list.add(book);
	             try{
	                   if(!rs.next()){break;}
	             }catch(Exception e){
	             	e.printStackTrace();
	             }
	             }
	             }
	%>
	<div style="margin-left:60px;margin-top:0px">
		<form action="BackSearch?is=book" method="post">
			书名：<input type="text" name="search" style="height:30px" size="15"
				placeholder="请输入搜索条件">&nbsp;&nbsp;类型：<select name="type"
				style="height:30px;">
				<option selected value='all'>所有分类</option>
				<option value='novel'>小说类</option>
				<option value='art'>艺术类</option>
				<option value='movie'>电影类</option>
				<option value='computer'>计算机类</option>
				<option value='encouragement'>成功励志类</option>
			</select> <input type="submit" value="搜索" style="height:30px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b><font size="50px" color="#AD5A5A">商品信息</font> </b>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="backGoodAdd.jsp?" target="backCenter"
				style="text-decoration:none;color:#FF7F00;font-size:20px"><b>添加</b>
			</a>
		</form>
	</div>
	<div align="center" style="margin-top:50px">
		<table width="1230px"
			cellspacing="0px" cellpadding="0px" align="center" border="1" bordercolor="white">
			<tr bgcolor="#66CD00"  align="center">
				<!-- <td><font style="color:#D94600;font-size:20px;">图书封面</font>
				</td> -->
				<td ><font
					style="color:#FFF;font-size:20px;">ISBN</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">书名</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">作者</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">单价</font>
				</td>
				<td ><font
					style="color:#FFF;font-size:20px;">余量</font>
				</td>
				<!-- <td><font style="color:#D94600;font-size:20px;">图片地址</font>
				</td>
				<td><font style="color:#D94600;font-size:20px;">书籍简介</font>
				</td> -->
				<td ><font
					style="color:#FFF;font-size:20px;">书籍类型</font>
				</td>
				<td  colspan="3"><font
					style="color:#FFF;font-size:20px;">操作</font></td>
			</tr>
			<%
				for (int j = 0; j < list.size(); j++) {
			%>
			<tr align="center">
				<td ><%=list.get(j).getId()%></td>
				<td ><font color="#408080"><%=list.get(j).getBookName()%></font></td>
				<td ><font color="#5A5AAD"><%=list.get(j).getBookAuthor()%></font></td>
				<td ><%=list.get(j).getBookPrice()%></td>
				<td><%=list.get(j).getBookCount()%></td>
				<td ><font color="#8F4586"><%=list.get(j).getBookType()%></font></td>
				<td ><a
					href="backEdit.jsp?editType=goods&backID=<%=list.get(j).getId()%>"
					target="backCenter" style="text-decoration:none;color:blue">编辑</a>
				</td>
				<td ><a
					href="ConfirmDeleteGoods.jsp?backGoodID=<%=list.get(j).getId()%>"
					target="backCenter" style="text-decoration:none;color:red">删除</a>
				</td>
				<td ><a
					href="backView.jsp?backGoodID=<%=list.get(j).getId() %>"
					target="backCenter" style="text-decoration:none;color:green">查看</a>
				</td>

			</tr>
			<%
			}
			%>
		</table>
	</div>
	<div class = "floatYe" align="center">
			当前页数：[<%=Page%>/<%=maxPage%>]&nbsp; <%if(Page > 1){ %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="manage.jsp?manageType=goods&Page=1"><img src="picture/buttonImage/first.png"></a>&nbsp;&nbsp; <a
				href="manage.jsp?manageType=goods&Page=<%=Page-1%>"><img src="picture/buttonImage/left.png"></a> &nbsp;&nbsp;<% 
         }
         if(Page < maxPage){
         %> &nbsp;&nbsp;&nbsp;&nbsp;<a href="manage.jsp?manageType=goods&Page=<%=Page+1%>"><img src="picture/buttonImage/right.png"></a>&nbsp;&nbsp; <a
				href="manage.jsp?manageType=goods&Page=<%=maxPage%>"><img src="picture/buttonImage/last.png"></a> <%
          }
          }
        %>
		</div>
</body>
</html>
