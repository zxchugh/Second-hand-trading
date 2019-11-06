package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.business.SellerBusiness;
import com.entity.Seller;

public class SellerAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private Seller seller;
	private List<Seller> list;
	private SellerBusiness sellerBusiness;
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
	public String createSeller() {
		return SUCCESS;
	}

	// 新增数据
	public String addSeller() {
		this.sellerBusiness.save(this.seller);
		return SUCCESS;
	}

	// 按主键删除 若存在子表数据 则提示异常
	public String deleteSeller() {
		try {
			this.sellerBusiness.delete(seller);
		} catch (Exception e) {
			this.map.put("msg", "Associated items cannot be deleted");
		}
		return SUCCESS;
	}

	// 按主键批量删除 若存在子表数据 则提示异常
	public String deleteSellerByIds() {
		try {
			for (String id : this.ids) {
				this.sellerBusiness.delete(id);
			}
		} catch (Exception e) {
			this.map.put("msg", "Associated items cannot be deleted");
		}
		return SUCCESS;
	}

	// 更新数据
	public String updateSeller() {
		this.sellerBusiness.update(seller);
		return SUCCESS;
	}

	// 查询全部数据并输出分页代码
	public String getAllSeller() {
		this.list = new ArrayList<Seller>();
		List<Seller> tempList = new ArrayList<Seller>();
		tempList = this.sellerBusiness.show();
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
			Seller u = (Seller) tempList.get(i);
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
			buffer.append("<a href=\"seller/getAllSeller.action?number=0\">First page</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if ((Integer.parseInt(this.number) + 1) == 1) {
			buffer.append("Previous");
		} else {
			buffer.append("<a href=\"seller/getAllSeller.action?number=" + (Integer.parseInt(this.number) - 1)
					+ "\">Previous</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (this.maxPage <= (Integer.parseInt(this.number) + 1)) {
			buffer.append("Next");
		} else {
			buffer.append("<a href=\"seller/getAllSeller.action?number=" + (Integer.parseInt(this.number) + 1)
					+ "\">Next</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (this.maxPage <= (Integer.parseInt(this.number) + 1)) {
			buffer.append("Last page");
		} else {
			buffer.append("<a href=\"seller/getAllSeller.action?number=" + (this.maxPage - 1) + "\">Last page</a>");
		}
		this.html = buffer.toString();
		return SUCCESS;
	}

	// 按主键查询 并做好修改的准备
	public String getSellerById() {
		this.seller = this.sellerBusiness.checkId(this.id);
		return SUCCESS;
	}

	public String status() {
		this.seller = this.sellerBusiness.checkId(this.id);
		String status = "Locking";
		if (this.seller.getStatus().equals("Locking")) {
			status = "Unlock";
		} else {
			status = "Locking";
		}
		this.seller.setStatus(status);
		this.sellerBusiness.update(this.seller);
		return SUCCESS;
	}

	// 按条件查询数据(模糊查询)
	public String querySellerByCond() {
		this.list = new ArrayList<Seller>();
		if ("username".equals(this.cond)) {
			list = this.sellerBusiness.checkByLikeUsername(this.name);
		}
		if ("password".equals(this.cond)) {
			list = this.sellerBusiness.checkByLikePassword(this.name);
		}
		if ("realname".equals(this.cond)) {
			list = this.sellerBusiness.checkByLikeRealname(this.name);
		}
		if ("sex".equals(this.cond)) {
			list = this.sellerBusiness.checkByLikeSex(this.name);
		}
		if ("birthday".equals(this.cond)) {
			list = this.sellerBusiness.checkByLikeBirthday(this.name);
		}
		if ("contact".equals(this.cond)) {
			list = this.sellerBusiness.checkByLikeContact(this.name);
		}
		if ("qq".equals(this.cond)) {
			list = this.sellerBusiness.checkByLikeQq(this.name);
		}
		if ("status".equals(this.cond)) {
			list = this.sellerBusiness.checkByLikeStatus(this.name);
		}
		if ("regdate".equals(this.cond)) {
			list = this.sellerBusiness.checkByLikeRegdate(this.name);
		}
		return SUCCESS;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	public List<Seller> getList() {
		return list;
	}

	public void setList(List<Seller> list) {
		this.list = list;
	}

	public SellerBusiness getSellerBusiness() {
		return sellerBusiness;
	}

	public void setSellerBusiness(SellerBusiness sellerBusiness) {
		this.sellerBusiness = sellerBusiness;
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
