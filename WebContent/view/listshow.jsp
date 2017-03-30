<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台-查看信息列表</title>
<link type="text/css" rel="stylesheet" href="../css/style.css">
</head>
<body background="images/back.gif">
	<center>	
				<td width="690" height="400" align="center" valign="top"
					bgcolor="#FFFFFF"><c:if test="${pay!=null }">
						<table border="0" width="670" cellspacing="0" cellpadding="0"
							style="margin-top: 5">


							<tr height="30">
								<td style="text-indent: 5" valign="bottom"><font
									color="#004790"><b>■${pay.typename }</b>『缴费专区』</font></td>
							</tr>


							<tr>
								<td align="center" style="border: 1 solid" bgcolor="#F0F0F0">


									<table border="0" width="655" cellpadding="3"
										style="word-break: break-all">
										<tr height="30">
											<td colspan="2">【${pay.title }】</td>
											<td align="right">发布时间：『${pay.date }』&nbsp;</td>
										</tr>
										<tr height="80">
											<td colspan="3">${pay.context }</td>
										</tr>
										<tr height="30" align="center">
											<td>联系电话：${pay.phone }</td>
											<td>联 系 人：${pay.name }</td>
											<td>E-mail：${pay.mail }</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr height="1">
								<td></td>
							</tr>


						</table>
					</c:if> <c:if test="${pay==null }">
						<table border="0" width="670" cellspacing="0" cellpadding="0"
							style="margin-top: 5">


							<tr height="30">
								<td style="text-indent: 5" valign="bottom"><font
									color="#004790"><b>■${pay.typename }</b>『缴费专区』</font></td>
							</tr>


							<tr>
								<td align="center" style="border: 1 solid" bgcolor="#F0F0F0">


									<table border="0" width="655" height="150" cellpadding="3"
										style="word-break: break-all">
										<tr>
											<td align="center" style="border: 1 solid" bgcolor="#F0F0F0">暂时没有信息发布！</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr height="1">
								<td></td>
							</tr>


						</table>
					</c:if> <!-- 列表显示免费信息 --> <c:if test="${free!=null }">
						<table border="0" width="670" cellspacing="0" cellpadding="0"
							style="margin-top: 5" rules="rows">


							<tr height="30">
								<td style="text-indent: 5" valign="bottom"><font
									color="#004790"><b>■${free.typename }</b>『免费专区』</font></td>
							</tr>


							<tr>
								<td align="center" style="border: 1 solid" bgcolor="#F0F0F0">


									<table border="0" width="655" cellpadding="3"
										style="word-break: break-all">
										<tr height="30">
											<td colspan="2">【${free.title }】</td>
											<td align="right">发布时间：『${free.date }』&nbsp;</td>
										</tr>
										<tr height="80">
											<td colspan="3">${free.context }</td>
										</tr>
										<tr height="30" align="center">
											<td>联系电话：${free.phone }</td>
											<td>联系人：${free.name }</td>
											<td>E-mail：${free.mail }</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr height="1">
								<td></td>
							</tr>

							<tr height="30">
								<td align="center">

								</td>
							</tr>

						</table>
					</c:if> <c:if test="${free==null }">
						<table border="0" width="670" cellspacing="0" cellpadding="0"
							style="margin-top: 5">


							<tr height="30">
								<td style="text-indent: 5" valign="bottom"><font
									color="#004790"><b>■${free.typename }</b>『缴费专区』</font></td>
							</tr>


							<tr>
								<td align="center" style="border: 1 solid" bgcolor="#F0F0F0">


									<table border="0" width="655"  height="150" cellpadding="3"
										style="word-break: break-all">
										<tr>
											<td align="center" style="border: 1 solid" bgcolor="#F0F0F0">暂时没有信息发布！</td>
										</tr>
									</table>
								</td>
								</tr>
						
							<tr height="1">
								<td></td>
							</tr>


						</table>
					</c:if>
					</td>
														<html>
<head>
<title>分页导航栏</title>
</head>
<body>
	<table border="0" width="100%" cellspacing="0">
		<tr>
			<td width="60%"></td>
			<td align="center" width="40%"></td>
		</tr>
	</table>
</body>
									</html>
	</center>
</body>
</html>