<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>都市信息网</title>
  <link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body background="images/back.gif">
    <center>
				<table border="0" width="670" cellspacing="0" cellpadding="5">
							<tr height="35"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>■推荐信息</b>『缴费专区』</font></td></tr>
							<tr bgcolor="#FAFCF5">
								<td style="border:1 solid">
									<table border="0" width="100%" cellspacing="0" cellpadding="0">
										 <tr height="23">
											<td width="50%">『<b>求职信息</b>』
												<c:if test="${qz==null }">暂时没有相关信息</c:if>
												<a href="User_index?flag=singleshow&mid=${qz.id }">${qz.title }</a>
												
											</td>
											<td width="50%">『<b>招聘信息</b>』
											<c:if test="${zp==null }">暂时没有相关信息</c:if>
												<a href="User_index?flag=singleshow&mid=${zp.id }">${zp.title }</a>
											</td>
										 </tr>
									
										 <tr height="23">
											<td width="50%">『<b>培训信息</b>』
											<c:if test="${px==null }">暂时没有相关信息</c:if>
												<a href="User_index?flag=singleshow&mid=${px.id }">${px.title }</a></td>
											<td width="50%">『<b>求购信息</b>』
											<c:if test="${qg==null }">暂时没有相关信息</c:if>
												<a href="User_index?flag=singleshow&mid=${qg.id }">${qg.title }</a></td>
										 </tr>
										 
										 <tr height="23">
											<td width="50%">『<b>招商信息</b>』
											<c:if test="${zs==null }">暂时没有相关信息</c:if>
												<a href="User_index?flag=singleshow&mid=${zs.id }">${zs.title }</a>
											</td>
											<td width="50%">『<b>房屋信息</b>』
											<c:if test="${fw==null }">暂时没有相关信息</c:if>
												<a href="User_index?flag=singleshow&mid=${fw.id }">${fw.title }</a>
											</td>
										 </tr>
									
										 <tr height="23">
											<td width="50%">『<b>家教信息</b>』
											<c:if test="${jj==null }">暂时没有相关信息</c:if>
												<a href="User_index?flag=singleshow&mid=${jj.id }">${jj.title }</a></td>
											<td width="50%">『<b>公寓信息</b>』
											<c:if test="${gy==null }">暂时没有相关信息</c:if>
												<a href="User_index?flag=singleshow&mid=${gy.id }">${gy.title }</a></td>
										 </tr>
										                
									</table>
								</td>
							</tr>
						</table>
						<!-- 广告 -->
						<table border="0" width="670"cellspacing="0" cellpadding="0" style="margin-top:1">
							<tr><td align="center"><img src="images/pcard2.jpg"></td></tr>
						</table>        
						<!-- 免费专区 -->
						<table border="0" width="670" cellspacing="2" cellpadding="0">
							<tr height="35"><td colspan="2" style="text-indent:5" valign="bottom"><font color="#004790"><b>■最新信息</b>『免费专区』</font></td></tr>            
							 
							<tr>
								<td align="center">
									<table border="1" cellspacing="0" cellpadding="0" width="332" height="160" rules="none" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white">
									
									<td align="center">
									<table border="1" cellspacing="0" cellpadding="0" width="332" height="160" rules="none" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white">
									<tr bgcolor="#00B48F" height="30">
										<td style="text-indent:10"><b><font color="white">培训信息</font></b></td> </tr>
									<tr bgcolor="#FAFCF5"><td style="text-indent:3">★ <c:if test="${fpx==null }">暂时没有相关信息</c:if><a href="User_index?flag=singleshow&mid=${fpx.id }">${fpx.title }</a></td></tr>
									<tr height="20" bgcolor="#FAFCF5"><td align="right"><a href="User_index?flag=listshow">更多...</a>&nbsp;&nbsp;</td></tr>	
									
									</table>
								</td>
					 
								<td align="center">
									<table border="1" cellspacing="0" cellpadding="0" width="332" height="160" rules="none" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white">
										
										 <tr bgcolor="#00B48F" height="30">
											<td style="text-indent:10"><b><font color="white">求职信息</font></b></td>                                      
										 </tr>
									
										<tr bgcolor="#FAFCF5">
											<td style="text-indent:3">★ <c:if test="${fqz==null }">暂时没有相关信息</c:if><a href="User_index?flag=singleshow&mid=${fqz.id }">${fqz.title }</a></td>
										</tr>
										<tr height="20" bgcolor="#FAFCF5">
											<td align="right"><a href="listshow.html">更多...</a>&nbsp;&nbsp;</td>
										</tr>                                    
									 
									</table>
									
									</table>
								</td>
							
						
						 
							</tr>
						
							<tr>
								
								</td>
							</tr>
				  
						</table>
										     
    </center>
</body>
</html>