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
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			Current position: <a href="<%=basePath%>">Home</a>
			<code> &gt; </code>
			Shopping process
		</div>
	</div>
	<div class="blank"></div>
	<div class="block table">
		<form action="index/checkout.action" method="post" name="theForm"
			id="theForm" onsubmit="return checkConsignee(this)">
			<div class="flowBox">
				<h6>
					<span>Recipient information</span>
				</h6>
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<td bgcolor="#ffffff">Receiver name:</td>
						<td bgcolor="#ffffff" colspan="2"><input name="name"
							type="text" class="inputBg" id="name" /> (Required)</td>
					</tr>
					<tr>
						<td bgcolor="#ffffff">Address:</td>
						<td bgcolor="#ffffff" colspan="2"><input name="cond"
							type="text" class="inputBg" id="cond" /> (Required)</td>
					</tr>
					<tr>
						<td bgcolor="#ffffff">Contact:</td>
						<td bgcolor="#ffffff" colspan="2"><input name="msg"
							type="text" class="inputBg" id="cond" /> (Required)</td>
					</tr>
					<tr>
						<td colspan="4" align="center" bgcolor="#ffffff"><input
							type="submit" class="bnt_blue_2" value="Confirm" /></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
