<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
				Current position:
				<a href="<%=basePath%>">Home</a>
				<code>
					&gt;
				</code>
				Change password
			</div>
		</div>
		<div class="blank"></div>

		<div class="blank"></div>
		<div class="block clearfix">

			<div class="AreaL">
				<div class="box">
					<div class="box_1">
						<div class="userCenterBox">
							<jsp:include page="usermenu.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>


			<div class="AreaR">
				<div class="box">
					<div class="box_1">
						<div class="userCenterBox boxCenterList clearfix" style="_height: 1%;">

							<h5>
								<span>Change password</span>
							</h5>
							<div class="blank"></div>
							<form action="index/editpwd.action" name="myform" method="post">
								<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">
											Username:
										</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">
											${sessionScope.username }
										</td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">
											Old password:
										</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">
											<input name="password" type="password" size="25" class="inputBg" />
										</td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">
											New password:
										</td>
										<td align="left" bgcolor="#FFFFFF">
											<input name="newpassword" type="password" size="25" class="inputBg" />
										</td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">
											Confirm password:
										</td>
										<td align="left" bgcolor="#FFFFFF">
											<input name="repassword" type="password" size="25" class="inputBg" />
										</td>
									</tr>
									<tr>
										<td colspan="2" align="center" bgcolor="#FFFFFF">
											${msg }
										</td>
									</tr>
									<tr>
										<td colspan="2" align="center" bgcolor="#FFFFFF">
											<input type="submit" class="bnt_blue_1" style="border: none;" value="Confirm" />
										</td>
									</tr>
								</table>
							</form>

						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="blank"></div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>