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
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<script type="text/javascript" src="js/admin.js" charset="utf-8"></script>
<script type="text/javascript" src="js/date.js" charset="utf-8"></script>
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
			<td bgcolor="#FFFFFF"><s:form action="admin/editpwd.action"
					name="myform" onsubmit="return check()">
					<table width="40%" border="0" align="center" cellpadding="4"
						cellspacing="1" bgcolor="#aec3de">
						<tr align="center" bgcolor="#F2FDFF">
							<td align="left" colspan="2" class="optiontitle">Change password</td>
						</tr>
						<tr align="center" bgcolor="#F2FDFF">
							<td width="20%" align="right">Username</td>
							<td align="left"><%=session.getAttribute("adminname")%> <input
								type="hidden" name="admin.username" style="width: 160px"
								id="username" value="<%=session.getAttribute("username")%>" />
							</td>
						</tr>
						<tr align="center" bgcolor="#F2FDFF">
							<td width="20%" align="right">password</td>
							<td align="left"><input type="password"
								name="admin.password" style="width: 160px" id="password" /></td>
						</tr>
						<tr align="center" bgcolor="#F2FDFF">
							<td width="20%" align="right"> New password</td>
							<td align="left"><input type="password" name="newpassword"
								style="width: 160px" id="newpassword" /></td>
						</tr>
						<tr align="center" bgcolor="#F2FDFF">
							<td width="20%" align="right">Confirm password</td>
							<td align="left"><input type="password" name="repassword"
								style="width: 160px" id="repassword" /></td>
						</tr>

						<tr align="center" bgcolor="#ebf0f7">
							<td colspan="2"><input type="submit" name="Submit"
								value="Submit" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
								name="Submit2" value="Reset" /></td>
						</tr>
					</table>
				</s:form></td>
		</tr>
	</table>
</body>
</html>