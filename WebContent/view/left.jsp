<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>侧栏</title>
	<link type="text/css" rel="stylesheet" href="../css/style.css">
	

</head>
<body>
<script type="text/javascript">
var va=document.getElementById("info_SearchShow_action_searchInfo_sqlvalue")
function check(){
	var value=va.value;
	alert(value);
	if(value==null){
		alert("关键词不能为空！");
		return false;
	}else{
		return true;
	}
}
</script>
	<table border="0" width="225" height="100%" cellspacing="0" cellpadding="0">
		<tr height="30"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>■日历</b></font></td></tr>            
		<tr height="1"><td></td></tr>
		<!-- 日历 -->
		<tr height="180">
			<td valign="top"  align="center" >	<br />
					<iframe src="rili.htm" frameBorder="0"   width="245" scrolling="no" height="180" ></iframe>
			</td>
		</tr>
	
		<tr height="1"><td></td></tr>
		<tr height="30"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>■信息快速搜索</b></font></td></tr>
		<tr height="1"><td></td></tr>
		<tr height="103">
			<td align="center" valign="top" background="../images/leftS.jpg">
				<table border="0" width="99%" height="100%" cellspacing="0" style="font-size:13px">
				<form id="info_SearchShow_action" name="SearchShow" action="../User_index?flag=search" method="post" target="default" ">                        
					<tr height="10"><td colspan="3"></td></tr>
					<tr>
						<td align="right" width="70">关键字：</td>
						<td colspan="2" width="200" align="left"><input type="text" name="sqlvalue" size="21" id="info_SearchShow_action_searchInfo_sqlvalue"/></td>
					</tr>
					<tr>
						<td align="right">条&nbsp;&nbsp;件：</td>
						<td colspan="2" align="left">
							<select name="subsql" id="info_SearchShow_action_searchInfo_subsql" >
								<option value="info_text">信息内容</option>
								<option value="info_phone">联系电话</option>
								<option value="info_mail">E-mail地址</option>
								<option value="id">ID值</option>
								<option value="info_title">信息标题</option>
								<option value="info_name">联系人</option>
							</select>

						</td>
						
					</tr>
					<tr>
						<td align="right">搜索类型：</td>
						<td align="left">
							<input type="radio" name="searchtype" id="info_SearchShow_action_searchInfo_typeall" value="all"/>全字匹配
							<input type="radio" name="searchtype" id="info_SearchShow_action_searchInfo_typelike" checked="checked" value="like"/>模糊搜索
						</td>
						<td align="center" >
							<input type="submit" id="info_SearchShow_action_0" value="搜索" onclick="check()"/>
						</td>
					</tr>
					<tr height="10"><td colspan="3"></td></tr>
				</form>




				</table>
			</td>
		</tr>
		<tr><td></td></tr>
	</table>                

</body>
</html>
</html>