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
				My product
			</div>
		</div>
		<div class="blank"></div>

		<div class="blank"></div>
		<div class="block clearfix">

			<div class="AreaL">
				<div class="box">
					<div class="box_1">
						<div class="userCenterBox">
							<jsp:include page="susermenu.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>


			<div class="AreaR">
				<div class="box">
					<div class="box_1">
						<div class="userCenterBox boxCenterList clearfix" style="_height: 1%;">
						<h5>
							<span>My product</span>
						</h5>
						<div class="blank"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
							<tr bgcolor="#ffffff">
								<td align="center" bgcolor="#ffffff">
									Name
								</td>
								<td align="center" bgcolor="#ffffff">
									Price
								</td>
								<td align="center" bgcolor="#ffffff">
									Category
								</td>
								<td align="center" bgcolor="#ffffff">
									Publish Date
								</td>
								<td align="center" bgcolor="#ffffff">
									Hits
								</td>
								<td align="center" bgcolor="#ffffff">
									Sales
								</td>
							</tr>
							<s:iterator value="map.goodsList">
								<tr>
									<td align="center" bgcolor="#ffffff">
										<s:property value="goodsname" />
									</td>
									<td align="center" bgcolor="#ffffff">
										<s:property value="price" />
									</td>
									<td align="center" bgcolor="#ffffff">
										<s:property value="cate.catename" />
									</td>
									<td align="center" bgcolor="#ffffff">
										<s:property value="addtime" />
									</td>
									<td align="center" bgcolor="#ffffff">
										<s:property value="hits" />
									</td>
									<td align="center" bgcolor="#ffffff">
										<s:property value="sellnum" />
									</td>
								</tr>
							</s:iterator>
						</table>
						<div class="blank5"></div>
					</div>
					</div>
				</div>
			</div>

		</div>
		<div class="blank"></div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
