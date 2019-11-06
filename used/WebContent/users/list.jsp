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
			Product list
		</div>
	</div>
	<div class="blank"></div>
	<div class="block clearfix">

		<div class="AreaL">
			<div id="category_tree">
				<div class="tit">Categories</div>
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
			<div class="box" id='history_div'>
				<div class="box_1">
					<h3>
						<span>Hot</span>
					</h3>
					<div class="boxCenterList clearfix" id='history_list'>
						<s:iterator value="map.hotList">
							<ul class="clearfix">
								<li class="goodsimg"><a
									href="index/detail.action?id=${goodsid }" target="_blank"><img
										src="${image }" alt="${goodsname }" class="B_blue" /> </a></li>
								<li><a href="index/detail.action?id=${goodsid }"
									target="_blank" title="${goodsname }">${goodsname }</a> <br />
									Price: <font class="f1">₩${nowprice }</font></li>
							</ul>
						</s:iterator>
					</div>
				</div>
			</div>
			<div class="blank5"></div>
		</div>
		<div class="AreaR">
			<div class="box">
				<div class="box_1">
					<h3>
						<span>Product list</span>
					</h3>
					<div class="clearfix goodsBox"
						style="border: none; padding: 11px 0 10px 0px;">
						<s:iterator value="map.goodsList">
							<div class="goodsItem">
								<a href="index/detail.action?id=${goodsid }"><img
									src="${image }" alt="${goodsname }" class="goodsimg" /> </a> <br />
								<p class="f1">
									<a href="index/detail.action?id=${goodsid }">${goodsname }</a>
								</p>
								Price <font class="f1">₩${price }</font>
							</div>
						</s:iterator>
					</div>
				</div>
			</div>
			<div class="blank5"></div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
