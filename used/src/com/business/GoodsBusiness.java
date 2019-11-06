package com.business;
import java.util.List;
import com.dao.GoodsDAO;
import com.entity.Goods;
public class GoodsBusiness {
/** Spring IOC DAO 注入 Business * */
private GoodsDAO goodsDAO;
public GoodsDAO getGoodsDAO() { return goodsDAO; }
public void setGoodsDAO(GoodsDAO goodsDAO) { this.goodsDAO = goodsDAO; }
/** save * */
public void save(Goods goods) {this.goodsDAO.save(goods);}
/** update * */
public void update(Goods goods) {this.goodsDAO.update(goods);}
/** delete * */
public void delete(String id) {this.goodsDAO.delete(id);}
/** delete * */
public void delete(int id) {this.goodsDAO.delete(id);}
/** delete * */
public void delete(Goods goods) {this.goodsDAO.delete(goods);}
/** show * */
public List<Goods> show() {return goodsDAO.show();}
/** show * */
public List<Goods> hot() {return goodsDAO.hot();}
/** show * */
public List<Goods> news() {return goodsDAO.news();}
/** show * */
public List<Goods> front(String name) {return goodsDAO.front(name);}
/** check * */
public List<Goods> checkGoodsname(String name) {return this.goodsDAO.queryByGoodsname(name);}
/** check * */
public List<Goods> checkSellerid(String name) {return this.goodsDAO.queryBySellerid(name);}
/** check * */
public List<Goods> checkCateid(String name) {return this.goodsDAO.queryByCateid(name);}
/** check * */
public List<Goods> checkImage(String name) {return this.goodsDAO.queryByImage(name);}
/** check * */
public List<Goods> checkOldprice(String name) {return this.goodsDAO.queryByOldprice(name);}
/** check * */
public List<Goods> checkPrice(String name) {return this.goodsDAO.queryByPrice(name);}
/** check * */
public List<Goods> checkAddtime(String name) {return this.goodsDAO.queryByAddtime(name);}
/** check * */
public List<Goods> checkHits(String name) {return this.goodsDAO.queryByHits(name);}
/** check * */
public List<Goods> checkSellnum(String name) {return this.goodsDAO.queryBySellnum(name);}
/** check * */
public List<Goods> checkContents(String name) {return this.goodsDAO.queryByContents(name);}
/** check * */
public List<Goods> checkByLikeGoodsname(String name) {return this.goodsDAO.queryLikeByGoodsname(name);}
/** check * */
public List<Goods> checkByLikeSellerid(String name) {return this.goodsDAO.queryLikeBySellerid(name);}
/** check * */
public List<Goods> checkByLikeCateid(String name) {return this.goodsDAO.queryLikeByCateid(name);}
/** check * */
public List<Goods> checkByLikeImage(String name) {return this.goodsDAO.queryLikeByImage(name);}
/** check * */
public List<Goods> checkByLikeOldprice(String name) {return this.goodsDAO.queryLikeByOldprice(name);}
/** check * */
public List<Goods> checkByLikePrice(String name) {return this.goodsDAO.queryLikeByPrice(name);}
/** check * */
public List<Goods> checkByLikeAddtime(String name) {return this.goodsDAO.queryLikeByAddtime(name);}
/** check * */
public List<Goods> checkByLikeHits(String name) {return this.goodsDAO.queryLikeByHits(name);}
/** check * */
public List<Goods> checkByLikeSellnum(String name) {return this.goodsDAO.queryLikeBySellnum(name);}
/** check * */
public List<Goods> checkByLikeContents(String name) {return this.goodsDAO.queryLikeByContents(name);}
/** checkId * */
public Goods checkId(String id) {return this.goodsDAO.queryById(id);}

}
