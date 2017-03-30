<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="net.hncu.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台首页</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script>
	function del(uid){
		if(confirm("确认删除？"))
		  window.location.href="User_login?flag=delete&useID="+uid;
		}
	
</script>

</head>


<body>
	<center>
		<table width="650" cellspacing="0" cellpadding="0" border="0"
			height="300">
			<tbody>
				<tr>
					<td align="center">用户id</td>
					<td>用户名</td>
					<td>操作</td>
				</tr>
					<c:forEach items="${user }" var="ur">
					<tr id="trdel">
					<td align="center">${ur.id }</td>
					<td>${ur.user_name }</td>
					<td><a href="User_login?flag=toupdate&id=${ur.id }">修改</a>|<a href="#" onClick="del(${ur.id })">删除</a></td>
				</tr>
					</c:forEach>
				<tr>
					<td align="center" colspan="3">
					<c:if test="${page!=1 }"><a href="User_login?flag=userlist&page=${page-1}">上一页</a></c:if>|
					<c:if test="${page!=ends }">	<a href="User_login?flag=userlist&page=${page+1}">下一页</a></c:if></td>
				</tr>
			</tbody>
		</table>
	</center>

	<!--
           		<tr><td align="center">2015</td><td>a2015</td><td><a href="userUpdate.html">修改</a>|<a  onClick="del()">删除</a></td></tr>
           	
           	           		<tr><td align="center">2016</td><td>a2016</td><td><a href="userUpdate.html">修改</a>|<a  onClick="del()">删除</a></td></tr>
           		<tr><td align="center">2017</td><td>a2017</td><td><a href="userUpdate.html">修改</a>|<a  onClick="del()">删除</a></td></tr>
           		<tr><td align="center">2018</td><td>a2018</td><td><a href="userUpdate.html">修改</a>|<a  onClick="del()">删除</a></td></tr>

        -->

</body>
</html>