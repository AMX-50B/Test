<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>都市信息网</title>
  <link type="text/css" rel="stylesheet" href="../css/style.css">
  <script language="javascript" type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
</head>
<body background="../images/back.gif">
	<div align="center">	
					<table border="0" width="670" cellspacing="0" cellpadding="0" style="margin-top:5;">
						<tr height="30">
							<td style="text-indent:5" valign="bottom"><font color="#004790"><b>■推荐信息</b>『缴费专区』</font></td>
						</tr>
						<tr>
							<td align="center" style="border:0px" >
								<table border="0" width="655" cellpadding="3" style="word-break:break-all;font-size:14px;">
									<tr height="30">
										<td colspan="2">【${intro.title }】</td>
										<td align="right">发布时间：『${intro.date }』&nbsp;</td>
									</tr>
									<tr height="20">
										<td colspan="3">${intro.context }</td>
									</tr>
									<tr height="30" align="center">
										<td>联系电话：${intro.phone }</td>
										<td>联 系 人：${intro.name }</td>
										<td>E-mail：${intro.mail }</td>
									</tr>                                 
								 </table>
							</td>
						</tr>
						<tr height="1">
							<td></td>
						</tr>	
					</table>
					<!-- 列表显示免费信息 -->
					
					<table width="670" border="0" cellspacing="0" cellpadding="0" style="margin-top:5">
					
						<tr height="30">
							<td style="text-indent:5" valign="bottom"><font color="#004790"><b>■查看详细信息</b></font></td>
						</tr>            
						<tr height="1">
							<td></td>
						</tr>
						<tr bgcolor="#FAFCF5">
							<td >
								<table border="0" width="100%" cellspacing="0" cellpadding="2" style="font-size:14px;">
									<tr height="30">
										<td width="20%" style="text-indent:20">信息类别：</td>
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
									<tr>
										<td colspan="2" style="text-indent:20">${message.context }</td>
									</tr>
									<tr height="40">
										<td colspan="2" align="left">
											<table border="0" width="630" cellspacing="0" cellpadding="0"  style="word-break:break-all;font-size:14px;" >
												<tr height="20" align="center">
													<td>联系电话：${message.phone }</td>
													<td>联系人：${message.name }</td>
													<td>E-mial：${message.mail }</td>
												</tr>
											</table>                      
										</td>
									</tr>
									<tr height="40">
										<td align="center" colspan="2" ><a href="javascript:window.history.back(-1)">返回</a></td>
									</tr>                              
								
								</table>
							</td>
						</tr>
					</table>
				
		<!-- 页脚 -->       
	</div>
</body>

</html>