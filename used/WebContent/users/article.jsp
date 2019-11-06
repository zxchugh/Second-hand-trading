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
			News
		</div>
	</div>
	<div class="blank"></div>
	<div class="block clearfix">

		<div class="AreaL">
			<div id="category_tree">
				<div class="tit">Category</div>
				<dl class="clearfix" style="overflow: hidden;">
					<s:iterator value="map.cateList">
						<div class="box1 cate" id="cate">
							<h1 style="border-top: none">
								<a href="index/cate.action?id=${cateid }" class="  f_l">${catename }</a>
							</h1>
						</div>
						<div style="clear: both"></div>
					</s:iterator>
				</dl>
			</div>
			<div class="blank"></div>
		</div>
		
		<div class="AreaR">
			<div>
				<div class="art_cat_box">
					<table width="100%" border="0" cellpadding="5" cellspacing="0">
						<tr>
							<th style="background: #e5e5e5">Article title</th>
							<th style="background: #e5e5e5">Author</th>
							<th style="background: #e5e5e5">Add date</th>
						</tr>
						<s:iterator value="map.articleList">
							<tr>
								<td><a style="text-decoration: none"
									href="index/read.action?id=${articleid }" title="${title }"
									class="f6">${title
											}</a></td>
								<td align="center">Administrator</td>
								<td align="center">${addtime }</td>
							</tr>
						</s:iterator>
					</table>
				</div>
			</div>
			<div class="blank5"></div>

		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
