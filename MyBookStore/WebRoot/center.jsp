<%@ page language="java" import="java.util.*,entity.*,java.sql.*,dao.*"
	pageEncoding="GBK"%>
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
<title>网页中心</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">

</head>
<body style="margin-top:20px; margin-left:90px"
	background="picture/back/center.png">
	<div style="margin-left:920px; margin-top:0px; margin-bottom:0px">
		<form action="SearchSevlet" method="post">
			<input type="text" name="search" placeholder="输入书名进行搜索"
				style="height:30px;"><input type="submit" value="搜索"
				style="height:30px;">
		</form>

	</div>
	<br />
	<%
		ArrayList<Book> searchBook = (ArrayList<Book>)(request.getSession().getAttribute("SearchBook"));
		Object isSearch = request.getSession().getAttribute("isSearch");
		String searchName = (String)request.getSession().getAttribute("searchName");
		request.getSession().removeAttribute("isSearch");	// 删除搜索的信息缓存  否者在选择数据分类的时候会有搜索为空的提示 （因为获取到了isSearch  但是长度为空）
		request.getSession().removeAttribute("searchName");
		
		
		if(searchBook != null && searchName != null && !searchName.equals("")) {
		%><p style="margin-left:100px; margin-top:0px; margin-bottom:0px">
		搜索:<font color="red"> <%=searchName %></font>&nbsp;&nbsp;&nbsp;&nbsp;共有&nbsp;<font
			color="red"> <%=searchBook.size() %></font>&nbsp;条结果
	</p>
	<%
			for (int i = 0; i < searchBook.size(); i++) {
				if (i % 4 == 0) {
		%>
	<table style="margin-left:55px;maigin:0px" height="15px" border="0"
		width="500px" height="150px" cellspacing="20px" cellpadding="20px">
		<tr align="center">
			<td><a
				href="book_buy.jsp?bookId=<%=searchBook.get(i).getId()%>&bookType=<%=searchBook.get(i).getBookType()%>"
				target="center" style="text-decoration:none"><img
					src="<%=searchBook.get(i).getBookImageAddress()%>" border="1"><br />
					<br /> <font size="3" color="red">价格：￥<%=searchBook.get(i).getBookPrice()%></font><br />
					书名：<%=searchBook.get(i).getBookName()%></a>
			</td>
			<%
				} else if (i % 4 == 3) {
			%>
			<td><a
				href="book_buy.jsp?bookId=<%=searchBook.get(i).getId()%>&bookType=<%=searchBook.get(i).getBookType()%>"
				target="center" style="text-decoration:none"><img
					src="<%=searchBook.get(i).getBookImageAddress()%>" border="1"><br />
					<br /> <font size="3" color="red">价格：￥<%=searchBook.get(i).getBookPrice()%></font><br />
					书名：<%=searchBook.get(i).getBookName()%></a>
			</td>
		</tr>
		<%
			} else {
		%><td><a
			href="book_buy.jsp?bookId=<%=searchBook.get(i).getId()%>&bookType=<%=searchBook.get(i).getBookType()%>"
			target="center" style="text-decoration:none"><img
				src="<%=searchBook.get(i).getBookImageAddress()%>" border="1"><br />
				<br /> <font size="3" color="red">价格：￥<%=searchBook.get(i).getBookPrice()%></font><br />
				书名：<%=searchBook.get(i).getBookName()%></a>
		</td>
		<%
					}
				}
				%>
	</table>
	<% 
		}
		else {
	%>

	<table style="margin-left:55px" height="15px" border="0" width="500px"
		height="150px" cellspacing="20px" cellpadding="20px">
		<%
			String bookType = request.getParameter("bookType");
			String sql = "";
			/* 选择不同的书籍呈现不同的书信息  */
			if (bookType == null || bookType.equals("")) {
				sql = "select * from book";
				bookType = "";
			} else {
				sql = "select * from book where bookType = '" + bookType + "'";
			}
			
			String str = (String)request.getParameter("Page");
			if(str==null) {
				str = "0";
			}
			
			int pagesize = 4;
			ArrayList<Book> list = new ArrayList<Book>();
			System.out.println(sql);
			ResultSet rs = Dao.searchDate(sql);
			// 分页
			rs.last(); // 使用rs.getRow() 之前必须要先使用rs.last()
	       int RecordCount = rs.getRow();
	       int maxPage = 0;
	       maxPage = (RecordCount%pagesize == 0)?(RecordCount/pagesize):(RecordCount/pagesize + 1);
	       int Page = Integer.parseInt(str);
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
					String type = rs.getString("bookType");
					/* 创建  book 对象 */
					Book book = new Book(id, name, author, price, imageAddress,
							count, introduce, type);
					/* 将 book 对象加入到线性表中 */
					list.add(book);
	             try{
	                   if(!rs.next()){break;}
	             }catch(Exception e){
	             	e.printStackTrace();
	             }
	             }
	             for(int num = 0 ; num < list.size(); num++) {
	             if(num % 4 == 0) {
	       	%>
		<tr align="center">
			<td><a
				href="book_buy.jsp?bookId=<%=list.get(num).getId()%>&bookType=<%=bookType%>"
				target="center" style="text-decoration:none"><img
					src="<%=list.get(num).getBookImageAddress()%>" border="1"><br />
					<br /> <font size="3" color="red">价格：￥<%=list.get(num).getBookPrice()%></font><br />
					书名：<%=list.get(num).getBookName()%></a>
			</td>
			<%
				} else if (num % 4 == 3) {
			%>
			<td><a
				href="book_buy.jsp?bookId=<%=list.get(num).getId()%>&bookType=<%=bookType%>"
				target="center" style="text-decoration:none"><img
					src="<%=list.get(num).getBookImageAddress()%>" border="1"><br />
					<br /> <font size="3" color="red">价格：￥<%=list.get(num).getBookPrice()%></font><br />
					书名：<%=list.get(num).getBookName()%></a>
			</td>
		</tr>
		<%
			} else {
		%><td><a
			href="book_buy.jsp?bookId=<%=list.get(num).getId()%>&bookType=<%=bookType%>"
			target="center" style="text-decoration:none"><img
				src="<%=list.get(num).getBookImageAddress()%>" border="1"><br />
				<br /> <font size="3" color="red">价格：￥<%=list.get(num).getBookPrice()%></font><br />
				书名：<%=list.get(num).getBookName()%></a>
		</td>
		<%
					}
			}
		%>
	</table>
	<div class = "floatYe" align="center">
			当前页数：[<%=Page%>/<%=maxPage%>]&nbsp; <%if(Page > 1){ %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="center.jsp?Page=1&bookType=<%=bookType%>"><img src="picture/buttonImage/first.png"></a>&nbsp;&nbsp; <a
				href="center.jsp?Page=<%=Page-1%>&bookType=<%=bookType%>"><img src="picture/buttonImage/left.png"></a> &nbsp;&nbsp;<% 
         }
         if(Page < maxPage){
         %> &nbsp;&nbsp;&nbsp;&nbsp;<a href="center.jsp?Page=<%=Page+1%>&bookType=<%=bookType%>"><img src="picture/buttonImage/right.png"></a>&nbsp;&nbsp; <a
				href="center.jsp?Page=<%=maxPage%>&bookType=<%=bookType%>"><img src="picture/buttonImage/last.png"></a> <%
          }
          }
        %>
		</div>
</body>
</html>
