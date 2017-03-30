<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>都市信息网</title>
  <link type="text/css" rel="stylesheet" href="../css/style.css">
</head>
<body>
<script type="text/javascript">
function pay(){
	var f=confirm("确认修改状态？");
	if(f){
		window.location.href="User_login?flag=pay&id="+${message.id};
	}
}
function state(){
	var f=confirm("确认修改状态？");
	if(f){
		window.location.href="User_login?flag=state&id="+${message.id};
	}
}
</script>
	<div align="left">
			
		<table style="text-align:center;margin-left: 10px;" bgcolor="white" border="0" cellpadding="0" cellspacing="0" width="920">
			
			<tbody><tr>
				<td align="left" height="400" bgcolor="#FFFFFF" valign="top" width="690">        
					<!-- 列表显示免费信息 -->
					<table style="margin-top:5" border="0" cellpadding="0" cellspacing="0" width="670">
					
						<tbody><tr height="30"> 
							<td style="text-indent:5" valign="bottom"><font color="#004790"><b>■查看详细信息</b></font>

						<c:if test="${message.pay!=1 }"><input id="payBut" value="设置付费" onclick="pay()"  type="button"></c:if>	
						<c:if test="${message.pay==1 }"><input id="payButed" value="已付费"  type="button"></c:if>
						<c:if test="${message.state!=1 }"><input id="checkBut" value="审核通过" onclick="state()"  type="button"></c:if>
						<c:if test="${message.state==1 }"><input id="checkButed" value="已通过"  type="button"></c:if>
							</td>
						</tr>            
						<tr height="1">
							<td></td>
						</tr>
						<tr bgcolor="#FAFCF5">
							<td style="border:1 solid">
								<table style="font-size:14px;" border="0" cellpadding="2" cellspacing="0" width="100%">
									<tbody><tr height="30">
										<td style="text-indent:20" width="20%">信息类别：</td>
										<td>${message.typename }</td>
									</tr>
									<tr height="30">
										<td style="text-indent:20">发布时间：</td>
										<td>${message.date }</td>
									</tr>
									<tr height="30">
										<td style="text-indent:20">信息标题：</td>
										<td>${message.title }</td>
									</tr>
									<tr height="30">
										<td colspan="2" style="text-indent:20">信息内容：</td>
									</tr>
									<tr height="60">
										<td colspan="2" style="text-indent:20">${message.context }</td>
									</tr>
									<tr height="40">
										<td colspan="2" align="left">
											<table style="word-break:break-all;font-size:14px;" border="0" cellpadding="0" cellspacing="0" width="630">
												<tbody><tr align="left" height="20">
													<td>联系电话：${message.phone }</td>
													<td>联系人：${message.name }</td>
													<td>E-mail：${message.mail }</td>
												</tr>
											</tbody></table>                      
										</td>
									</tr>
									<tr height="40">
										<td colspan="2" align="center"><a href="javascript:window.history.back(-1)">返回</a></td>
									</tr>                              
								
								</tbody></table>
							</td>
						</tr>
					</tbody></table>
					<br>
				</td>
			</tr>      
		</tbody></table>
		<!-- 页脚 -->
	</div>


</body>
</html>