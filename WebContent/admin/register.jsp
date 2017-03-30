<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <title>用户注册</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css;">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <base href="${pageContext.request.contextPath }/">
</head>
<script type="text/javascript">
window.onload=function(){
	var name = document.getElementById("username");
	var pass= document.getElementById("password");
	var sub=document.getElementById("sub");
	var ns= document.getElementById("ns");
	var ps=document.getElementById("ps");
	var nst=false;
	var pst=false;
	name.onfocus=function(){
		 ns.innerHTML = '请输入一个邮箱名';
	}
	name.onblur=function(){
		var uname=name.value;
		if(uname==""||uname==null){
			ns.innerHTML = '用户名不能为空';
		}else if(!isEmail(uname)){
			ns.innerHTML = '用户名格式不合法';
		}else {
			ns.innerHTML = 'OK';
			nst=true;
		}	
	}
	pass.onfocus=function(){
		 ps.innerHTML = '6-10位数字或字母';
	}
	pass.onblur=function(){
		var pa=pass.value;
		if(pa.length>10||pa.length<6){
			ps.innerHTML = '密码长度不合法';
		}else if(!isNumberOrLetter(pa)){
			ps.innerHTML = '密码格式不合法';
		}else{
			ps.innerHTML = 'OK';
			pst=true;
		}
	}
	
	sub.onclick =function(){
		if(pst==true&&bst==true){
			return true;
		}else
			{
			alert("请先输入好用户资料");
			return false;
			}
	}
}
function isNumberOrLetter( s ){//判断是否是数字或字母 

	var regu = "^[0-9a-zA-Z]+$"; 
	var re = new RegExp(regu); 
	if (re.test(s)) { 
	return true; 
	}else{ 
	return false; 
	} 
	} 
function isEmail( str ){  
	var myReg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/; 
	if(myReg.test(str)) return true; 
	return false; 
	} 

</script>

<body bgcolor="#E7ECEF">
    <center>
        <form action="User_login?flag=reg" method="post" onsubmit="pass()" >
            <table border="0" cellspacing="0" cellpadding="0" style="margin-top:130">
                <tr><td><img src="images/logon_top.gif"></td></tr>                
                <tr height="180">
                    <td background="images/logon_middle.gif" align="center" valign="top">
                         <table border="0" width="90%" cellspacing="0" cellpadding="0">
                             <tr height="50"><td colspan="2"></td></tr>
                             <tr height="30">
                                 <td align="right" width="40%">用户名：&nbsp;&nbsp;</td>
                                 <td style="text-indent:5"><input type="text" name="username" size="20" value="" id="username" onblur="checkusername()" />
                             	<span id="ns"></span></td>
                             </tr>                
                             <tr height="30">
                                 <td align="right">密&nbsp;&nbsp;码：&nbsp;&nbsp;</td>
                                 <td style="text-indent:5"><input type="password" name="password" size="20" id="password" onblur="checkpassword()" />
                             	<span id="ps"></span></td>
                             </tr>
                             <tr height="60">
                                 <td></td>
                                 <td>
								
                                     <input type="submit" id="sub"  value="注册"/>

                                     <input type="reset" value="重置"/>

                                     <a id="log_Login_action_" href="../view/indextemp.html">[返回首页]</a>
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