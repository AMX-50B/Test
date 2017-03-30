<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台首页</title><link href="../css/style.css" rel="stylesheet" type="text/css"></head>
  <script type="text/javascript">
  window.onload=function(){
	  var sub=document.getElementById("sub");
	  sub.onclick=function(){
		  return confirm("确认修改？");
	  }
  }
  </script>
<body>
    <center>
    	<form method="post" action="User_login?flag=userUpdate">
        <table width="650" cellspacing="0" cellpadding="0" border="0" height="300">
           	
           	<tbody><tr><td align='right'>用户id:&nbsp;&nbsp;</td><td><input type="text" readonly="readonly" value="${user.id }" name="userid"></td></tr>
           	<tr><td align='right'>用户名:&nbsp;&nbsp;</td><td><input type="text" readonly="readonly" value="${user.user_name }" name="username"></td></tr>
           	<tr><td align='right'>用户密码:&nbsp;&nbsp;</td><td><input type="password" value="${user.user_password }" name="password"></td></tr>
           	<tr><td></td><td><input type="submit" value="修改" id="sub"></td></tr>
        </tbody></table>
        </form>
    </center>

</body></html>