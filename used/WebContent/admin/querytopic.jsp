<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@taglib
	prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/four.css" rel="stylesheet" type="text/css" />
</head>
<%
	String message = (String) request.getAttribute("message");
	if (message == null) {
		message = "";
	}
	if (!message.trim().equals("")) {
		out.println("<script language='javascript'>");
		out.println("alert('" + message + "');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%><body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td bgcolor="#FFFFFF"><table width="96%" border="0"
					align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
					<tr align="left" bgcolor="#F2FDFF">
						<td colspan="20" class="optiontitle">Product evaluation information list</td>
					</tr>
					<tr align="center">
						<td align="center" bgcolor="#ebf0f7">Buyer</td>
						<td align="center" bgcolor="#ebf0f7">Product</td>
						<td align="center" bgcolor="#ebf0f7">Evaluation</td>
						<td align="center" bgcolor="#ebf0f7">Addtime</td>
					</tr>
					<s:iterator value="list" id="list">
						<tr align="center" bgcolor="#FFFFFF">
							<td align="center"><s:property value="users.username" /></td>
							<td align="center"><s:property value="goods.goodsname" /></td>
							<td align="center"><s:property value="num" /></td>
							<td align="center"><s:property value="addtime" /></td>
						</tr>
					</s:iterator>
					<tr align="right" bgcolor="#ebf0f7">
						<td colspan="20"><form action="topic/queryTopicByCond.action"
								name="myform" method="post">
								Query conditions<select name="cond" style="width: 100px"><option
										value="usersid">Searching by buyer</option>
									<option value="goodsid">Searching by product</option>
									<option value="num">Searching by evaluation</option>
									<option value="addtime">Searching by addtime</option></select>Keyword<input type="text"
									name="name" style="width: 100px" /><input type="submit"
									value="Search" />
							</form></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>