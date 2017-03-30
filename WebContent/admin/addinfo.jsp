<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>都市信息网</title>
<link type="text/css" rel="stylesheet" href="../css/style.css">
<base href="${pageContext.request.contextPath }/">
</head>
<body background="images/back.gif">
<script type="text/javascript">
var titleS=false;
var textS=false;
var phoneS=false;
var nameS=false;
var mailS=false;
window.onload=function(){
	var title=document.getElementById("info_Add_action_infoSingle_infoTitle");
	var bt=document.getElementById("bt");
	title.onfocus=function(){		
		bt.innerHTML= '[不超过20个字符]';
	}
	title.onblur=function(){
		var te=title.value;
		if(te.length>20){
			bt.innerHTML= '[超过20个字符];';
		}else if(te.length==0){
			bt.innerHTML= '[标题不能为空]';
		}else{
			bt.innerHTML= '[OK]&nbsp;&nbsp;';
			titleS=true;
		}
	}
}
function check(content,ContentUse,ContentRem,time){
	
	if(content.value.length>time){
		ContentUse.value=time;
		ContentRem.value=0;
		
	}else{
		ContentRem.value=time-content.value.length;
		ContentUse.value=content.value.length;
	}	
}
function tchef(content,lr){
	lr.innerHTML = '[不超过500个字符]';
}
function tcheb(content,lr,time){
	var i=content.value.length;
	if(i==0){		
	lr.innerHTML = '[信息不能为空]';
	}else if(i>time){
		lr.innerHTML = '[信息超长]';
	}else{
		lr.innerHTML = '[OK]';
		textS=true;
	}
}
function phf(dh){
	dh.innerHTML= '';
}
function phb(p,dh){
	var ss=p.value
	if(ss==""){
		dh.innerHTML= '[不能为空]';
	}else if(!isNumberOrLetter(ss)||ss.length>11||ss.length<6){
		dh.innerHTML= '[格式不合法]';
	}else{
		dh.innerHTML= '[OK]';
		phoneS=true;
	}
}
function isNumberOrLetter(s){//判断是否是数字或字母 

	var regu = "^[0-9]+$"; 
	var re = new RegExp(regu); 
	if (re.test(s)) { 
	return true; 
	}else{ 
	return false; 
	} 
	} 
	
function manb(x,y){
	var name = x.value;
	if(name.length>4||name.length<2){
		y.innerHTML = '[格式不合法]';
	}else if(!ischinese(name)){
		y.innerHTML = '[仅支持中文]';
	}else{
		y.innerHTML= '[OK]';
		nameS=true;
	}
}
function ischinese(s){ 
	var ret=true; 
	for(var i=0;i<s.length;i++) 
	ret=ret && (s.charCodeAt(i)>=10000); 
	return ret; 
	}
function mail(ma,em){
	var m=ma.value;
	if(!isEmail(m)){
	em.innerHTML = '[格式不合法]';	
	}else{
		em.innerHTML = '[OK]';
		mailS=true;
	}
}
function pass(){
	if(titleS==true&&textS==true&&phoneS==true&&nameS==true&&mailS==true){
		return true;
	}else{
		alert("信息不完整！");
		return false;
}
}
function isEmail( str ){  
	var myReg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/; 
	if(myReg.test(str)) return true; 
	return false; 
	} 

</script>
	<center>
		<table border="0" width="920" cellspacing="0" cellpadding="0"
			bgcolor="white">
			<tr>
				<td colspan="2">
					<!-- 页眉 --> <iframe src="view/top.jsp" frameBorder="0"
						width="920" scrolling="no" height="200"></iframe>

				</td>
			</tr>
			<tr>
				<td width="230" valign="top" align="center">
					<!-- 左边 --> <iframe src="view/left.jsp" frameBorder="0"
						width="225" scrolling="no" height="400"></iframe>
				</td>
				<td width="690" height="400" align="center" valign="top"
					bgcolor="#FFFFFF">
					<table border="0" cellpadding="0" cellspacing="0" width="688"
						height="100%">
						<tr height="20">
							<td><img src="images/default_t.jpg"></td>
						</tr>
						<tr>
							<td background="images/default_m.jpg" valign="top"
								align="center">
								<form id="addinfo" name="info_Add_action"
									action="User_view?flag=addinfo" onsubmit="return pass();" method="post">
									<input type="hidden" name="addType" value="add" />
									<table border="0" width="650" height="300" cellspacing="0">
										<tr height="30">
											<td style="text-indent: 10"><font color="#004790"><b>■发布信息</b></font></td>
										</tr>
										<tr>
											<td align="center">
												<table border="0" width="650" cellspacing="8">
													<tr>
														<td width="20%" style="text-indent: 10">信息类别：</td>
														<td><select name="infoSingle.infoType"
															id="info_Add_action_infoSingle_infoType">
																<option value="0">暂时没有信息</option>
																<option value="1">招聘信息</option>
																<option value="2">培训信息</option>
																<option value="3">房屋信息</option>
																<option value="4">求购信息</option>
																<option value="5">招商引资</option>
																<option value="6">公寓信息</option>
																<option value="7">求职信息</option>
																<option value="8">家教信息</option>
																<option value="9">车辆信息</option>
																<option value="10">出售信息</option>
																<option value="11">寻找启示</option>

														</select></td>
														<td align="right" width="300px"><font id="lb" color="#7F7F7F">&nbsp;&nbsp;</font></td>
													</tr>
													<tr>
														<td colspan="3"></td>
													</tr>
													<tr>
														<td style="text-indent: 10">信息标题：</td>
														<td><input type="text" name="infoSingle.infoTitle"
															size="50" maxlength="40" value=""
															id="info_Add_action_infoSingle_infoTitle" /></td>
														<td align="right"><font id="bt" color="#7F7F7F"></font></td>
													</tr>
													<tr>
														<td colspan="3"></td>
													</tr>
													<tr>
														<td style="text-indent: 10">信息内容：</td>
														<td><font color="#7F7F7F"> 已用：<input
																type="text" name="ContentUse" value="0" size="4"
																disabled style="text-align: center; border: 0;">
																个&nbsp;&nbsp; 剩余：<input type="text" name="ContentRem"
																value="500" size="4" disabled
																style="text-align: center; border: 0;"> 个
														</font></td>
														<td align="right"><font id="lr" color="#7F7F7F">&nbsp;&nbsp;</font></td>
													</tr>
													<tr>
														<td colspan="3"></td>
													</tr>
													<tr>
														<td colspan="3" align="center"><textarea
																name="infoSingle.infoContent" cols="75" rows="10"
																id="content"
																onkeydown="check(content,ContentUse,ContentRem,500)"
																onkeyup="check(content,ContentUse,ContentRem,500)"
																onchange="check(content,ContentUse,ContentRem,500)"
																onfocus="tchef(content,lr)"
																onblur="tcheb(content,lr,500)"></textarea></td>
													</tr>
													<tr>
														<td style="text-indent: 10">联系电话：</td>
														<td><input type="text" name="infoSingle.infoPhone"
															size="45" value=""
															id="info_Add_action_infoSingle_infoPhone"
															onfocus="phf(dh)"
															onblur="phb(info_Add_action_infoSingle_infoPhone,dh)" /></td>
														<td align="right"><font id="dh" color="#7F7F7F">&nbsp;&nbsp;</font></td>
													</tr>
													<tr>
														<td colspan="3"></td>
													</tr>
													<tr>
														<td style="text-indent: 10">联 系 人：</td>
														<td ><input type="text"
															name="infoSingle.infoLinkman" size="50" value=""
															id="info_Add_action_infoSingle_infoLinkman"
															onchange="manb(info_Add_action_infoSingle_infoLinkman,xr)" /></td>
														<td align="right"><font id="xr" color="#7F7F7F"></font></td>
													</tr>
													<tr>
														<td colspan="3"></td>
													</tr>
													<tr>
														<td style="text-indent: 10">E - mail：</td>
														<td><input type="text" name="infoSingle.infoEmail"
															size="50" value=""
															id="info_Add_action_infoSingle_infoEmail"
															onchange="mail(info_Add_action_infoSingle_infoEmail,em)" /></td>
														<td align="right"><font id="em" color="#7F7F7F">&nbsp;&nbsp;</font></td>
													</tr>
													<tr>
														<td colspan="3"></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr align="center" height="50">
											<td><input type="submit" id="info_Add_action_0"
												value="&#21457;&#24067;"  /> 
												<input type="reset" value="&#37325;&#22635;" /></td>
										</tr>
									</table>
								</form>

							</td>
						</tr>
						<tr height="26">
							<td><img src="images/default_e.jpg"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>