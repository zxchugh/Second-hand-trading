package com.entity;
public class Goods {
private String goodsid;
public String getGoodsid() { return goodsid; }
public void setGoodsid(String goodsid) { this.goodsid = goodsid; }
private Seller seller;
public Seller getSeller() { return seller; }
public void setSeller(Seller seller) { this.seller = seller; }
private Cate cate;
public Cate getCate() { return cate; }
public void setCate(Cate cate) { this.cate = cate; }
private String goodsname;
public String getGoodsname() { return this.goodsname; }
public void setGoodsname(String goodsname) { this.goodsname = goodsname; }
private String sellerid;
public String getSellerid() { return this.sellerid; }
public void setSellerid(String sellerid) { this.sellerid = sellerid; }
private String cateid;
public String getCateid() { return this.cateid; }
public void setCateid(String cateid) { this.cateid = cateid; }
private String image;
public String getImage() { return this.image; }
public void setImage(String image) { this.image = image; }
private String oldprice;
public String getOldprice() { return this.oldprice; }
public void setOldprice(String oldprice) { this.oldprice = oldprice; }
private String price;
public String getPrice() { return this.price; }
public void setPrice(String price) { this.price = price; }
private String addtime;
public String getAddtime() { return this.addtime; }
public void setAddtime(String addtime) { this.addtime = addtime; }
private String hits;
public String getHits() { return this.hits; }
public void setHits(String hits) { this.hits = hits; }
private String sellnum;
public String getSellnum() { return this.sellnum; }
public void setSellnum(String sellnum) { this.sellnum = sellnum; }
private String contents;
public String getContents() { return this.contents; }
public void setContents(String contents) { this.contents = contents; }
}