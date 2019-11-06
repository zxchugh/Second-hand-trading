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
						<td colspan="20" class="optiontitle">Order information list</td>
					</tr>
					<tr align="center">
						<td align="center" bgcolor="#ebf0f7">Ordercode</td>
						<td align="center" bgcolor="#ebf0f7">Buyer</td>
						<td align="center" bgcolor="#ebf0f7">Product</td>
						<td align="center" bgcolor="#ebf0f7">Unit price</td>
						<td align="center" bgcolor="#ebf0f7">Number</td>
						<td align="center" bgcolor="#ebf0f7">Addtime</td>
						<td align="center" bgcolor="#ebf0f7">Status</td>
						<td align="center" bgcolor="#ebf0f7">Receiver</td>
						<td align="center" bgcolor="#ebf0f7">Address</td>
						<td align="center" bgcolor="#ebf0f7">Contact</td>
					</tr>
					<s:iterator value="list" id="list">
						<tr align="center" bgcolor="#FFFFFF">
							<td align="center"><s:property value="ordercode" /></td>
							<td align="center"><s:property value="users.username" /></td>
							<td align="center"><s:property value="goods.goodsname" /></td>
							<td align="center"><s:property value="price" /></td>
							<td align="center"><s:property value="num" /></td>
							<td align="center"><s:property value="addtime" /></td>
							<td align="center"><s:property value="status" /></td>
							<td align="center"><s:property value="receiver" /></td>
							<td align="center"><s:property value="address" /></td>
							<td align="center"><s:property value="contact" /></td>
						</tr>
					</s:iterator>
					<tr align="right" bgcolor="#ebf0f7">
						<td colspan="20"><form
								action="orders/queryOrdersByCond.action" name="myform"
								method="post">
								Query conditions<select name="cond" style="width: 100px"><option
										value="ordercode">Searching by ordercode</option>
									<option value="usersid">Searching by users ID</option>
									<option value="goodsid">Searching by product</option>
									<option value="price">Searching by unit price</option>
									<option value="num">Searching by number</option>
									<option value="addtime">Searching by addtime</option>
									<option value="status">Searching by status</option>
									<option value="receiver">Searching by receiver</option>
									<option value="address">Searching by address</option>
									<option value="contact">Searching by contact</option></select>Keyword<input type="text"
									name="name" style="width: 100px" /><input type="submit"
									value="Search" />
							</form></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>