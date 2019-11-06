package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.business.FavBusiness;
import com.business.UsersBusiness;
import com.business.GoodsBusiness;
import com.entity.Fav;
import com.entity.Users;
import com.entity.Goods;

public class FavAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private Fav fav;
	private List<Fav> list;
	private FavBusiness favBusiness;
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
	public String createFav() {
		List<Users> usersList = this.usersBusiness.show();
		this.map.put("usersList", usersList);
		List<Goods> goodsList = this.goodsBusiness.show();
		this.map.put("goodsList", goodsList);
		return SUCCESS;
	}

	// 新增数据
	public String addFav() {
		this.favBusiness.save(this.fav);
		return SUCCESS;
	}

	// 按主键删除 若存在子表数据 则提示异常
	public String deleteFav() {
		try {
			this.favBusiness.delete(fav);
		} catch (Exception e) {
			this.map.put("msg", "Associated items cannot be deleted");
		}
		return SUCCESS;
	}

	// 按主键批量删除 若存在子表数据 则提示异常
	public String deleteFavByIds() {
		try {
			for (String id : this.ids) {
				this.favBusiness.delete(id);
			}
		} catch (Exception e) {
			this.map.put("msg", "Associated items cannot be deleted");
		}
		return SUCCESS;
	}

	// 更新数据
	public String updateFav() {
		this.favBusiness.update(fav);
		return SUCCESS;
	}

	// 查询全部数据并输出分页代码
	public String getAllFav() {
		this.list = new ArrayList<Fav>();
		List<Fav> tempList = new ArrayList<Fav>();
		tempList = this.favBusiness.show();
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
			Fav u = (Fav) tempList.get(i);
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
			buffer.append("<a href=\"fav/getAllFav.action?number=0\">First page</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if ((Integer.parseInt(this.number) + 1) == 1) {
			buffer.append("Previous");
		} else {
			buffer.append(
					"<a href=\"fav/getAllFav.action?number=" + (Integer.parseInt(this.number) - 1) + "\">Previous</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (this.maxPage <= (Integer.parseInt(this.number) + 1)) {
			buffer.append("Next");
		} else {
			buffer.append(
					"<a href=\"fav/getAllFav.action?number=" + (Integer.parseInt(this.number) + 1) + "\">Next</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (this.maxPage <= (Integer.parseInt(this.number) + 1)) {
			buffer.append("Last page");
		} else {
			buffer.append("<a href=\"fav/getAllFav.action?number=" + (this.maxPage - 1) + "\">Last page</a>");
		}
		this.html = buffer.toString();
		return SUCCESS;
	}

	// 按主键查询 并做好修改的准备
	public String getFavById() {
		this.fav = this.favBusiness.checkId(this.id);
		List<Users> usersList = this.usersBusiness.show();
		this.map.put("usersList", usersList);
		List<Goods> goodsList = this.goodsBusiness.show();
		this.map.put("goodsList", goodsList);
		return SUCCESS;
	}

	// 按条件查询数据(模糊查询)
	public String queryFavByCond() {
		this.list = new ArrayList<Fav>();
		if ("usersid".equals(this.cond)) {
			list = this.favBusiness.checkByLikeUsersid(this.name);
		}
		if ("goodsid".equals(this.cond)) {
			list = this.favBusiness.checkByLikeGoodsid(this.name);
		}
		if ("addtime".equals(this.cond)) {
			list = this.favBusiness.checkByLikeAddtime(this.name);
		}
		return SUCCESS;
	}

	public Fav getFav() {
		return fav;
	}

	public void setFav(Fav fav) {
		this.fav = fav;
	}

	public List<Fav> getList() {
		return list;
	}

	public void setList(List<Fav> list) {
		this.list = list;
	}

	public FavBusiness getFavBusiness() {
		return favBusiness;
	}

	public void setFavBusiness(FavBusiness favBusiness) {
		this.favBusiness = favBusiness;
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
