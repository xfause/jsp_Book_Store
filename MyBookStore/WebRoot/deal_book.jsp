<%@page import="javax.swing.JSpinner.ListEditor"%>
<%@ page language="java"
	import="java.util.*,java.sql.*,dao.*,entity.*,java.text.*,java.util.Date"
	pageEncoding="GBK"%>
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

<title>My JSP 'del_book.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/book.css">
</head>

<body background="picture/back/center.png">
	<%
		/* 获取网页中的对象缓存  查看 */
		Object object = request.getSession().getAttribute("objectUser");
		int bookId = 0;
		if (object == null) {
			/* 未登录的情况 */
		out.println("<script language = 'javascript'>alert('请先登录...');window.location.href='login.jsp?loginType=user';</script>");
		} else {

			int count_buy = Integer.parseInt(request
					.getParameter("count_buy"));
			bookId = Integer.parseInt(request.getParameter("bookId"));

			/* 将 object 转换成 user 对象获取用户的 id 值  */
			User user = (User) object;
			int userId = 0;
			String sql = "select * from user where account='"
					+ user.getAccount() + "'";
			ResultSet rs = Dao.searchDate(sql);
			while (rs.next()) {
				userId = rs.getInt("id");
			}

			/* 判断用户的余额是否能够买书   */
			sql = "select * from user where id = " + userId;
			rs = Dao.searchDate(sql);
			double userMoney = 0;
			while (rs.next()) {
				userMoney = rs.getDouble("money");
			}

			/*  查找到当前书的剩余量   */

			sql = "select * from book where id = " + bookId;
			int allowance = 0; /* 书的余量   */
			double bookPrice = 0; /* 书的单价   */

			try {
				rs = Dao.searchDate(sql);
				while (rs.next()) {
					allowance = rs.getInt("count");
					bookPrice = rs.getDouble("price");

				}
				boolean canBuy = true;
				if (count_buy > allowance) {
					canBuy = false;
					out.println("<script language = 'javascript'>alert('购  买  图  书  数  量  过  大....');window.location.href='book_buy.jsp?bookId=" + bookId + "';</script>");
		}
				/*  如果钱不够    */
				if (userMoney < (count_buy * bookPrice)) {
					canBuy = false;
	out.println("<script language = 'javascript'>alert('账户余额不足...');window.location.href='book_buy.jsp?bookId=" + bookId + "';</script>");
		}
				if (canBuy == true) {
					/*  将该书的数量从数据库中进行修改   和用户的余额    */
					sql = "update book set count = "
							+ (allowance - count_buy) + " where id = "
							+ bookId;
					Dao.operateDate(sql);

					sql = "update user set money = "
							+ (userMoney - (count_buy * bookPrice))
							+ " where id = " + userId;
					Dao.operateDate(sql);
					/*  将该订单信息添加到相对应用户订单表的订单记录中    */
					/*  交易时间     */
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");
					String dateNowStr = sdf.format(date);

					sql = "insert into orderform_" + userId
							+ " (time,bookId,count) values ('" + dateNowStr
							+ "'," + bookId + "," + count_buy + ")";
					Dao.operateDate(sql);
	%><script type="text/javascript">
				alert("购  买  成  功 ! ! !");
			</script>
	<%
		} else {
	out.println("<script language = 'javascript'>alert('购买失败...');window.location.href='book_buy.jsp?bookId=" + bookId + "';</script>");
		}
			} catch (Exception e) {
	out.println("<script language = 'javascript'>alert(''购买失败...');window.location.href='book_buy.jsp?bookId=" + bookId + "';</script>");
		}
		}
	%>
	<div class="floatLogo">
		<img src="picture/back/logo2.png">
	</div>
</body>
</html>
