<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>页脚</title>
  
    <link type="text/css" rel="stylesheet" href="../css/style.css">
</head>
<body>
    <center>
    <%!int i=0; %>
    <%i++;
    out.print("当前在线人数："+i);
    %>
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <tr><td align="center"><img src="../images/end.jpg"></td></tr>
        </table>        
    </center>
</body>
</html>