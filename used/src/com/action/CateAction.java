package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.business.CateBusiness;
import com.entity.Cate;

public class CateAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private Cate cate;
	private List<Cate> list;
	private CateBusiness cateBusiness;
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
	public String createCate() {
		return SUCCESS;
	}

	// 新增数据
	public String addCate() {
		this.cateBusiness.save(this.cate);
		return SUCCESS;
	}

	// 按主键删除 若存在子表数据 则提示异常
	public String deleteCate() {
		try {
			this.cateBusiness.delete(cate);
		} catch (Exception e) {
			this.map.put("msg", "存在关联项 不能删除");
		}
		return SUCCESS;
	}

	// 按主键批量删除 若存在子表数据 则提示异常
	public String deleteCateByIds() {
		try {
			for (String id : this.ids) {
				this.cateBusiness.delete(id);
			}
		} catch (Exception e) {
			this.map.put("msg", "存在关联项 不能删除");
		}
		return SUCCESS;
	}

	// 更新数据
	public String updateCate() {
		this.cateBusiness.update(cate);
		return SUCCESS;
	}

	// 查询全部数据并输出分页代码
	public String getAllCate() {
		this.list = new ArrayList<Cate>();
		List<Cate> tempList = new ArrayList<Cate>();
		tempList = this.cateBusiness.show();
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
			Cate u = (Cate) tempList.get(i);
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
			buffer.append("<a href=\"cate/getAllCate.action?number=0\">First page</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if ((Integer.parseInt(this.number) + 1) == 1) {
			buffer.append("Previous");
		} else {
			buffer.append(
					"<a href=\"cate/getAllCate.action?number=" + (Integer.parseInt(this.number) - 1) + "\">Previous</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (this.maxPage <= (Integer.parseInt(this.number) + 1)) {
			buffer.append("Next");
		} else {
			buffer.append(
					"<a href=\"cate/getAllCate.action?number=" + (Integer.parseInt(this.number) + 1) + "\">Next</a>");
		}
		buffer.append("&nbsp;&nbsp;");
		if (this.maxPage <= (Integer.parseInt(this.number) + 1)) {
			buffer.append("Last page");
		} else {
			buffer.append("<a href=\"cate/getAllCate.action?number=" + (this.maxPage - 1) + "\">Last page</a>");
		}
		this.html = buffer.toString();
		return SUCCESS;
	}

	// 按主键查询 并做好修改的准备
	public String getCateById() {
		this.cate = this.cateBusiness.checkId(this.id);
		return SUCCESS;
	}

	// 按条件查询数据(模糊查询)
	public String queryCateByCond() {
		this.list = new ArrayList<Cate>();
		if ("catename".equals(this.cond)) {
			list = this.cateBusiness.checkByLikeCatename(this.name);
		}
		return SUCCESS;
	}

	public Cate getCate() {
		return cate;
	}

	public void setCate(Cate cate) {
		this.cate = cate;
	}

	public List<Cate> getList() {
		return list;
	}

	public void setList(List<Cate> list) {
		this.list = list;
	}

	public CateBusiness getCateBusiness() {
		return cateBusiness;
	}

	public void setCateBusiness(CateBusiness cateBusiness) {
		this.cateBusiness = cateBusiness;
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
