package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.business.CartBusiness;
import com.business.UsersBusiness;
import com.business.GoodsBusiness;
import com.entity.Cart;
import com.entity.Users;
import com.entity.Goods;

public class CartAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private Cart cart;
	private List<Cart> list;
	private CartBusiness cartBusiness;
	private UsersBusiness usersBusiness;
	private GoodsBusiness goodsBusiness;
	private int pageNumber;
	private int maxPage;
	private String html;
	private String number;
	private String id;
	private String[] ids;
	private String name;
	private String cond;
	private Map<String, Object> map = new HashMap<String, Object>();

	// 准备新增数据 Struts2需要由Action跳转到JSP 判断是否需要查询数据并放入下拉菜单
	public String createCart() {
		List<Users> usersList = this.usersBusiness.show();
		this.map.put("usersList", usersList);
		List<Goods> goodsList = this.goodsBusiness.show();
		this.map.put("goodsList", goodsList);
		return SUCCESS;
	}

	// 新增数据
	public String addCart() {
		this.cartBusiness.save(this.cart);
		return SUCCESS;
	}

	// 按主键删除 若存在子表数据 则提示异常
	public String deleteCart() {
		try {
			this.cartBusiness.delete(cart);
		} catch (Exception e) {
			this.map.put("msg", "Associated items cannot be deleted");
		}
		return SUCCESS;
	}

	// 按主键批量删除 若存在子表数据 则提示异常
	public String deleteCartByIds() {
		try {
			for (String id : this.ids) {
				this.cartBusiness.delete(id);
			}
		} catch (Exception e) {
			this.map.put("msg", "Associated items cannot be deleted");
		}
		return SUCCESS;
	}

	// 更新数据
	public String updateCart() {
		this.cartBusiness.update(cart);
		return SUCCESS;
	}

	// 查询全部数据并输出分页代码
	public String getAllCart() {
		this.list = new ArrayList<Cart>();
		List<Cart> tempList = new ArrayList<Cart>();
		tempList = this.cartBusiness.show();
		this.pageNumber = tempList.size();
		this.maxPage = this.pageNumber;
		if (this.maxPage % 10 == 0) {
			this.maxPage = this.maxPage / 10;
		} else {
			this.maxPage = this.maxPage / 10 + 1;
		}
		if (this.number == null) {
			this.number = "0";
		}
		int start = Integer.parseInt(this.number) * 10;
		int over = (Integer.parseInt(this.number) + 1) * 10;
		int count = pageNumber - over;
		if (count <= 0) {
			over = pageNumber;
		}
		for (int i = start; i < over; i++) {
			Cart u = (Cart) tempList.get(i);
			this.list.add(u);
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append("&nbsp;&nbsp;All ");
		buffer.append(maxPage);
		buffer.append("page&nbsp; All ");
		buffer.append(pageNumber);
		buffer.append("&nbsp; Now is ");
		buffer.append((Integer.parseInt(this.number) + 1));
		buffer.append("page &nbsp;");
		if ((Integer.parseInt(this.number) + 1) == 1) {
			buffer.append("First page");
		} else {
			buffer.append("<a href=\"cart/getAllCart.action?number=0\">First page</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if ((Integer.parseInt(this.number) + 1) == 1) {
			buffer.append("Previous");
		} else {
			buffer.append(
					"<a href=\"cart/getAllCart.action?number=" + (Integer.parseInt(this.number) - 1) + "\">Previous</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (this.maxPage <= (Integer.parseInt(this.number) + 1)) {
			buffer.append("Next");
		} else {
			buffer.append(
					"<a href=\"cart/getAllCart.action?number=" + (Integer.parseInt(this.number) + 1) + "\">Next</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (this.maxPage <= (Integer.parseInt(this.number) + 1)) {
			buffer.append("Last page");
		} else {
			buffer.append("<a href=\"cart/getAllCart.action?number=" + (this.maxPage - 1) + "\">Last page</a>");
		}
		this.html = buffer.toString();
		return SUCCESS;
	}

	// 按主键查询 并做好修改的准备
	public String getCartById() {
		this.cart = this.cartBusiness.checkId(this.id);
		List<Users> usersList = this.usersBusiness.show();
		this.map.put("usersList", usersList);
		List<Goods> goodsList = this.goodsBusiness.show();
		this.map.put("goodsList", goodsList);
		return SUCCESS;
	}

	// 按条件查询数据(模糊查询)
	public String queryCartByCond() {
		this.list = new ArrayList<Cart>();
		if ("goodsid".equals(this.cond)) {
			list = this.cartBusiness.checkByLikeGoodsid(this.name);
		}
		if ("usersid".equals(this.cond)) {
			list = this.cartBusiness.checkByLikeUsersid(this.name);
		}
		if ("price".equals(this.cond)) {
			list = this.cartBusiness.checkByLikePrice(this.name);
		}
		if ("num".equals(this.cond)) {
			list = this.cartBusiness.checkByLikeNum(this.name);
		}
		if ("addtime".equals(this.cond)) {
			list = this.cartBusiness.checkByLikeAddtime(this.name);
		}
		return SUCCESS;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public List<Cart> getList() {
		return list;
	}

	public void setList(List<Cart> list) {
		this.list = list;
	}

	public CartBusiness getCartBusiness() {
		return cartBusiness;
	}

	public void setCartBusiness(CartBusiness cartBusiness) {
		this.cartBusiness = cartBusiness;
	}

	public UsersBusiness getUsersBusiness() {
		return usersBusiness;
	}

	public void setUsersBusiness(UsersBusiness usersBusiness) {
		this.usersBusiness = usersBusiness;
	}

	public GoodsBusiness getGoodsBusiness() {
		return goodsBusiness;
	}

	public void setGoodsBusiness(GoodsBusiness goodsBusiness) {
		this.goodsBusiness = goodsBusiness;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCond() {
		return cond;
	}

	public void setCond(String cond) {
		this.cond = cond;
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String[] getIds() {
		return ids;
	}

	public void setIds(String[] ids) {
		this.ids = ids;
	}

}
