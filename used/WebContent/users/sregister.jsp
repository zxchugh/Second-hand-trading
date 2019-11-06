<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<title>${title }</title>
		<script type="text/javascript" src="js/seller.js" charset="utf-8"></script>
		<script type="text/javascript" src="js/date.js" charset="utf-8"></script>
		<script language="javascript" type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
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
				User registration
			</div>
		</div>
		<div class="blank"></div>
		<div class="block">
			<div class="box">
				<div class="box_1">
					<h3>
						<span>User registration</span>
					</h3>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr valign="top">
							<td bgcolor="#FFFFFF" align="center">
								<form action="index/sreg.action" method="post" name="myform">
									<table width="60%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
										<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												Username:
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<input type="text" name="seller.username" size="25" class="inputBg" id="username" />
											</td>
										</tr>
										<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												Password:
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<input name="seller.password" type="password" size="25" class="inputBg" id="password" />
											</td>
										</tr>
										<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												Name:
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<input name="seller.realname" type="text" size="25" class="inputBg" id="realname" />
											</td>
										</tr>
										<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												Gender:
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<select name="seller.sex" id="sex"  class="inputBg">
													<option value="male">male</option>
													<option value="female">female</option>
												</select>
											</td>
										</tr>
										<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												Birthday:
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<input name="seller.birthday" type="text" size="25" class="inputBg" id="birthday" readonly="readonly" onclick="WdatePicker()" />
											</td>
										</tr>
										<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												Contect:
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<input name="seller.contact" type="text" size="25" class="inputBg" id="contact" />
											</td>
										</tr>
										<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												Kakao:
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<input name="seller.qq" type="text" size="25" class="inputBg" id="qq" />
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
