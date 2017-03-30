<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>管理员登录</title>
    <link type="text/css" rel="stylesheet" href="css/style.css;">
</head>
<body bgcolor="#E7ECEF">
<%
Cookie c[]=request.getCookies();
String un="",pw="";
if(c!=null)
{
	for(Cookie ck:c )
	{
		if("userName".equals(ck.getName()))
			un= ck.getValue();
		if("userPassword".equals(ck.getName()))
			pw=ck.getValue();
	}
}
%>
    <center>
        <form id="log_Login_action" name="log_Login_action" action="User_login?flag=login" method="post">
            <table border="0" cellspacing="0" cellpadding="0" style="margin-top:130">
                <tr><td><img src="images/logon_top.gif"></td></tr>                
                <tr height="180">
                    <td background="images/logon_middle.gif" align="center" valign="top">
                         <table border="0" width="90%" cellspacing="0" cellpadding="0">
                             <tr height="50"><td colspan="2"></td></tr>
                             <tr height="30">
                                 <td align="right" width="30%">用户名：&nbsp;&nbsp;</td>
                                 <td style="text-indent:5"><input type="text" name="userName" size="30" value="<%=un %>" id="log_Login_action_user_userName"/></td>
                             </tr>                
                             <tr height="30">
                                 <td align="right">密&nbsp;&nbsp;码：&nbsp;&nbsp;</td>
                                 <td style="text-indent:5"><input type="password" name="userPassword" size="30" value="<%=pw %>" id="log_Login_action_user_userPassword"/></td>
                             </tr>
                             <tr height="30">
                                 <td ></td>
                                 <td "><input type="checkbox" name="ck" />记住密码</td>
                             </tr>
                             <tr height="60">
                                 <td></td>
                                 <td>
								
                                    <input type="submit" id="" value="登录" />

                                     <input type="reset" value="重置"/>

                                     <a id="log_Login_action_" href="view/indextemp.jsp">[返回首页]</a>
                                     <a  href="admin/register.jsp">[注册]</a>
                                 </td>
                             </tr>
                         </table>
                    </td>
                </tr>
                <tr><td><img src="images/logon_end.gif"></td></tr>
            </table>
        </form>



     
    </center>
</body>
</html>