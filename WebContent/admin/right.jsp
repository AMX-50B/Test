<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台-侧栏</title>
<base href="${pageContext.request.contextPath }/">
  <link type="text/css" rel="stylesheet" href="../css/style.css">
</head>
<body background="../images/back.gif" style="background-color:white">
<script type="text/javascript">
function get(s){
	var radios=document.getElementsByName(s);
    var checkedCount = 0;
    for (var j = 0; j < radios.length; j++) {
      if (radios[j].checked) {
        checkedCount++;
      }
    }
    if (checkedCount==0) {
      return false;
    }else{
    	return true;
    }
}

function check() {
	var s=get("state");
	var t=get("pay");
	if(s==true&&t==true){
		return true;
	}else{
		alert("付费或审核状态选项不能为空！");
		return false;
	}
}

function setpay(){
	var id=document.getElementsByName("id");
	if(id==null){
		alert("id值不能为空");
		return false;
	}else{
		return true;
	}
}
</script>
    <center>
   
        <table border="0" width="220" height="auto" cellspacing="0" cellpadding="0" style="margin-top:7;background-color:white">
        	<tr>欢迎${user.user_name}登录 :</tr>
            <tr height="30" bgcolor="#F0F0F0"><td style="text-indent:5" style="border:1 solid"><font color="#004790"><b>■用户管理</b></font></td></tr>
            <tr height="1"><td></td></tr>
        	 <form action="User_login?flag=userlist" method="post" target="default">
            <tr>
                <td align="center" valign="top" style="border:1 solid">
                    <table border="0" width="220" height="80" cellspacing="0"  style="font-size:12px">
                        <tr height="25"><td align="center" valign="bottom">请输入要查询的用户ID：</td></tr>
                        <tr height="40">
                            <td align="center">
                                <input type="text" name="userid" value="" size="24"/>
                                <input type="submit" value="查询"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            </form>
            <!-- 显示方式 -->
            <tr height="30" bgcolor="#F0F0F0"><td style="text-indent:5;border:1 solid"><font color="#004790"><b>■显示方式</b></font></td></tr>
            <tr height="1"><td></td></tr>
            <form id="admin_ListShow_action?" name="admin_ListShow_action?" action="User_login?flag=infolist" method="post" onsubmit="return check();" target="default">
            <tr>
                <td align="center" valign="top" style="border:1 solid">
                    <table border="0" width="215" height="150" cellspacing="0" style="font-size:12px">
                        <tr>
                            <td colspan="2">
                                <fieldset style="height:60;width:200">
                                  <legend>★付费状态</legend>
                                  <br>
                                  <input type="radio" name="pay" id="admin_ListShow_action?_showType_payforType0" value="0"/>
								  <label for="admin_ListShow_action?_showType_payforType0">未付费</label>
								<input type="radio" name="pay" id="admin_ListShow_action?_showType_payforType1" value="1"/>
								<label for="admin_ListShow_action?_showType_payforType1">已付费</label>
								<input type="radio" name="pay" id="admin_ListShow_action?_showType_payforTypea2" value="all"/>
								<label for="admin_ListShow_action?_showType_payforTypeall">全部</label>

                                </fieldset>
                                <fieldset style="height:60;width:200">
                                  <legend>★审核状态</legend>
                                  <br>
                                  <input type="radio" name="state" id="admin_ListShow_action?_showType_stateType0" value="0"/>
								  <label for="admin_ListShow_action?_showType_stateType0">未审核</label>
									<input type="radio" name="state" id="admin_ListShow_action?_showType_stateType1" value="1"/>
									<label for="admin_ListShow_action?_showType_stateType1">已审核</label>
									<input type="radio" name="state" id="admin_ListShow_action?_showType_stateType2" value="all"/>
									<label for="admin_ListShow_action?_showType_stateTypeall">全部</label>

                                </fieldset>
                            </td>
                        </tr>
                        <tr  height="30" bgcolor="lightgrey">
                            <td>
                               信息类别：
                               
                                   <select name="type" id="admin_ListShow_action?_showType_infoType">
										<option value=""></option>
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


									</select>

                               <input type="submit" id="admin_ListShow_action?_0" value="显示"/>

                            </td>
                        </tr>
                        
                    </table>
                </td>
            </tr>
            </form>

            <tr height="5"><td></td></tr>
            <!-- 设置已付费信息 -->            
            <tr height="30" bgcolor="#F0F0F0"><td style="text-indent:5" style="border:1 solid"><font color="#004790"><b>■付费设置</b></font></td></tr>
            <tr height="1"><td></td></tr>
            <form action="User_login?flag=pay" onsubmit="return setpay();" method="post" target="default">
            <tr>
                <td align="center" valign="top" style="border:1 solid">
                    <table border="0" width="220" height="80" cellspacing="0"  style="font-size:12px">
                        <tr height="25"><td align="center" valign="bottom">请输入要设为已付费状态的信息ID：</td></tr>
                        <tr height="40">
                            <td align="center">
                                <input type="text" name="id" size="24"/>
                                <input type="submit" value="查询"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            </form>
            <tr height="5"><td></td></tr>
            <tr height="30" bgcolor="#F0F0F0"><td style="text-indent:5;border:1 solid"><font color="#004790"><b>■日历</b></font></td></tr>
            <tr height="1"><td></td></tr>
            <!-- 日历 -->            
            <tr height="180">
				<td valign="top" align="center">
					<iframe src="view/rili.htm" frameBorder="0"   width="245" scrolling="no" height="180" ></iframe>
				</td>
            </tr>
        </table>        
    </center>
</body>

</html>