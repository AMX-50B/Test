<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>都市信息网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css">
</head>
<body background="../images/back.gif">
	<center>
		<table border="0" width="670" cellspacing="0" cellpadding="0"
			style="margin-top: 5">

			<tr height="30">
				<td style="text-indent: 5" valign="bottom"><font
					color="#004790"><b>■查询结果</b></font></td>
			</tr>
			<tr height="1">
				<td></td>
			</tr>
			<tr>
				<td align="center" style="border: 1 solid">
					<table border="0" width="100%" rules="rows" cellspacing="0">
						<tr align="center" height="30" bgcolor="#F0F0F0">
							<td width="6%"><b>序号</b></td>
							<td width="11%"><b>信息类别</b></td>
							<td width="8%"><b>ID值</b></td>
							<td width="38%"><b>信息标题</b></td>
							<td width="22%"><b>发布时间</b></td>
							<td width="15%"><b>联系人</b></td>
						</tr>
						<c:forEach items="${list }" var="m">
							<%!int j=0; %>
							<tr height="30">
								<%j=j+1; %>
								<td align="center"><b><%=j %></b></td>
								<td align="center">${m.typename }</td>
								<td style="text-indent: 10">&nbsp;&nbsp;${m.id }</td>
								<td align="center"><a href="User_index?flag=singleshow&mid=${m.id }">${m.title }</a></td>
								<td align="center">${m.date }</td>
								<td align="center">${m.name }</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr height="1">
				<td></td>
			</tr>
			<tr height="30">
				<td align="center">

					<table border="0" width="100%" cellspacing="0">
						<tr>
							<td width="60%"><table border='0' cellpadding='3'>
									<tr>
										<td>每页显示：5/${end } 条记录！当前页：${page }/${ends } 页！</td>
									</tr>
								</table></td>
							<td align="center" width="40%"><table border='0'
									cellpadding='3'>
									<tr>
										<td><c:if test="${page!=1 }">
												<a href='User_index?flag=search&page=${page-1 }&subsql=${subsql }&sqlvalue=${sqlvalue}&searchtype=${searchtype}'>上一页</a>
											</c:if>&nbsp;
											 <c:if test="${page<ends }">
												<a href='User_index?flag=search&page=${page+1 }&subsql=${subsql }&sqlvalue=${sqlvalue}&searchtype=${searchtype}'>下一页</a>
											</c:if></td>
									</tr>
								</table></td>
						</tr>
					</table>

				</td>
			</tr>
		</table>
		<br>
	</center>
</body>
</html>