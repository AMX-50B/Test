<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.contextPath }/">
 <title>都市信息网</title>

  <link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body background="images/back.gif">
    <center>
        <table border="0" width="920" height="auto" cellspacing="0" cellpadding="0" bgcolor="white">
            <tr><td colspan="2">

			<!-- 页眉 -->
			<iframe src="view/top.jsp" frameBorder="0" width="920" scrolling="no" height="200" ></iframe>
			</td></tr>
            <tr>
                <td width="230" valign="top" align="center">
				<!-- 左侧 -->
				<iframe src="view/left.jsp" frameBorder="0" width="225" scrolling="no" height="400" ></iframe>
				</td>
                <td width="690" height="400" align="center" valign="top" bgcolor="#FFFFFF">
                <iframe class="default" src="User_index?flag=index" name="default" frameBorder="0" width="650" scrolling="no" height="500" style="margin-left:10"></iframe>
			</td>
		</tr>

       </table>
		<!-- 页脚 -->
		<iframe src="view/end.jsp" frameBorder="0" width="920" scrolling="no" height="70" style="margin-top:0"></iframe>	   
    </center>
</body>
</html>