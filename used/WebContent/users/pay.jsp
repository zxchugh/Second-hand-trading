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
			Payment
		</div>
	</div>
	<div class="blank"></div>
	<div class="block table">
		<form action="index/pay.action" method="post" name="theForm"
			id="theForm" onsubmit="return checkConsignee(this)">
			<input type="hidden" name="id" value="${id }" />
			<div class="flowBox">
				<h6>
					<span>Payment</span>
				</h6>
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<td bgcolor="#ffffff">Payment bank:</td>
						<td bgcolor="#ffffff" colspan="2"><select class="inputBg"
							id="s" style="width: 171">
								<option value="中国工商银行">中国工商银行</option>
								<option value="中国农业银行">中国农业银行</option>
								<option value="中国建设银行">中国建设银行</option>
								<option value="中国交通银行">中国交通银行</option>
								<option value="招商银行">招商银行</option>
								<option value="Alipay">Alipay</option>
						</select></td>
					</tr>
					<tr>
						<td bgcolor="#ffffff">Card number:</td>
						<td bgcolor="#ffffff" colspan="2"><input type="text"
							class="inputBg" id="name" /></td>
					</tr>
					<tr>
						<td bgcolor="#ffffff">Payment password:</td>
						<td bgcolor="#ffffff" colspan="2"><input type="password"
							class="inputBg" id="cond" /></td>
					</tr>
					<tr>
						<td bgcolor="#FFFFFF">Verification code:</td>
						<td colspan="2" bgcolor="#FFFFFF"><input name="code"
							type="text" class="inputBg" /> <img
							src="img/createImageAction.action"
							onclick="this.src='img/createImageAction.action?random='+ Math.random()"
							title="Click image to refresh the verification code" /></td>
					</tr>
					<tr>
						<td colspan="4" align="center" bgcolor="#FFFFFF">${msg }</td>
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
