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
			Current position: <a href=".">Home</a>
			<code> &gt; </code>
			<a href="index/cate.action?id=${map.goods.cate.cateid }">${map.goods.cate.catename }</a>
			<code> &gt; </code>
			${map.goods.goodsname }
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
									Price: <font class="f1">₩${price }</font></li>
							</ul>
						</s:iterator>
					</div>
				</div>
			</div>
			<div class="blank5"></div>
		</div>


		<div class="AreaR">

			<div id="goodsInfo" class="clearfix">


				<div class="imgInfo">
					<a href="${map.goods.image }" id="zoom1"
						class="MagicZoom MagicThumb" title="${map.goods.goodsname }">
						<img src="${map.goods.image }" alt="${map.goods.goodsname }"
						width="360px;" height="360px" />
					</a>
					<div class="blank5"></div>
					<div class="blank"></div>
				</div>

				<div class="textInfo">
					<form action="index/addCart.action" method="post"
						name="ECS_FORMBUY" id="ECS_FORMBUY">
						<h1 class="clearfix">${map.goods.goodsname }</h1>

						<ul class="ul2 clearfix">
							<li class="clearfix" style="width: 100%">
								<dd>
									<strong>Price:</strong><font class="shop" id="ECS_SHOPPRICE">₩${map.goods.price }</font>
								</dd>
							</li>
							<li class="clearfix" style="width: 100%">
								<dd>

									<strong>Category:</strong><a
										href="index/cate.action?id=${map.goods.cate.cateid }">${map.goods.cate.catename }</a>
								</dd>
							</li>
							<li class="clearfix" style="width: 100%">
								<dd>

									<strong>Sales:</strong>${map.goods.sellnum }
								</dd>
							</li>
							<li class="clearfix" style="width: 100%">
								<dd>

									<strong>Hits:</strong>${map.goods.hits}
								</dd>
							</li>
						</ul>
						<ul class="bnt_ul">
							<li class="clearfix">
								<dd>
									<strong>Purchase quantity:</strong> <input name="cart.num" type="text"
										id="number" value="1" size="4" style="border: 1px solid #ccc;" />
									<input type="hidden" name="cart.goodsid"
										value="${map.goods.goodsid }" /> <input type="hidden"
										name="cart.price" value="${map.goods.price }" />
								</dd>
							</li>
							<li class="padd"><input type="image"
								src="themes/xecmoban_shunfeng/images/goumai2.png" />&nbsp;
								<a href="index/addFav.action?id=${map.goods.goodsid }">My favorite</a>
								</li>
						</ul>
					</form>
				</div>
			</div>
			<div class="blank"></div>


			<div class="box">

				<div style="padding: 0 0px;">
					<div id="com_b" class="history clearfix">
						<h2>Product description</h2>
					</div>
				</div>
				<div class="box_1">
					<div id="com_v" class="  " style="padding: 6px;"></div>
					<div id="com_h">
						<blockquote>${map.goods.contents }</blockquote>
					</div>
				</div>
			</div>
			<div class="blank"></div>
			<div id="ECS_COMMENT">
				<div class="box">
					<div class="box_1">
						<h3>
							<span class="text">Message</span>
						</h3>
						<div class="boxCenterList clearfix" style="height: 1%;">
							<ul class="comments">
								<s:iterator value="map.topicList">
									<li class="word"><font class="f2"><s:property
												value="users.username" /> </font> <font class="f3">(<s:property
												value="addtime" />)
									</font> <br /> <img
										src="themes/xecmoban_shunfeng/images/stars<s:property value="num"/>.gif" />
										<p>
											<s:property value="contents" />
										</p></li>
								</s:iterator>
							</ul>
							<div class="blank5"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
