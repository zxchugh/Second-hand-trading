<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
</head>
<%
	String message = (String) session.getAttribute("message");
	if (message == null) {
		message = "";
	}
	if (!message.trim().equals("")) {
		out.println("<script language='javascript'>");
		out.println("alert('" + message + "');");
		out.println("</script>");
	}
	session.removeAttribute("message");
%>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			Current position: <a href="<%=basePath%>">Home</a>
			<code> &gt; </code>
			Log in
		</div>
	</div>
	<div class="blank"></div>
	<div class="block">
		<div class="box">
			<div class="box_1">
				<h3>
					<span>Log in</span>
				</h3>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr valign="top">
						<td bgcolor="#FFFFFF" align="center">
							<form action="index/login.action" method="post" name="myform">
								<table width="60%" border="0" cellpadding="5" cellspacing="1"
									bgcolor="#dddddd">
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">Username:</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input
											type="text" name="username" size="25" class="inputBg"
											id="username" /></td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">Password:</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input
											name="password" type="password" size="25" class="inputBg" /></td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">Login role:</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">
										<input type="radio" name="role" id="role" value="Buyer" checked="checked" />Buyer &nbsp;
										<input type="radio" name="role" id="role" value="Seller" />Seller</td>
									</tr>
									<tr>
										<td colspan="2" align="center" bgcolor="#FFFFFF"><input
											type="submit" class="bnt_blue_1" style="border: none;"
											value="Confirm" /></td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="blank5"></div>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
