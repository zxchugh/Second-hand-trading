package com.business;
import java.util.List;
import com.dao.FavDAO;
import com.entity.Fav;
public class FavBusiness {
/** Spring IOC DAO 注入 Business * */
private FavDAO favDAO;
public FavDAO getFavDAO() { return favDAO; }
public void setFavDAO(FavDAO favDAO) { this.favDAO = favDAO; }
/** save * */
public void save(Fav fav) {this.favDAO.save(fav);}
/** update * */
public void update(Fav fav) {this.favDAO.update(fav);}
/** delete * */
public void delete(String id) {this.favDAO.delete(id);}
/** delete * */
public void delete(int id) {this.favDAO.delete(id);}
/** delete * */
public void delete(Fav fav) {this.favDAO.delete(fav);}
/** show * */
public List<Fav> show() {return favDAO.show();}
/** check * */
public List<Fav> checkUsersid(String name) {return this.favDAO.queryByUsersid(name);}
/** check * */
public List<Fav> checkGoodsid(String name) {return this.favDAO.queryByGoodsid(name);}
/** check * */
public List<Fav> checkAddtime(String name) {return this.favDAO.queryByAddtime(name);}
/** check * */
public List<Fav> checkByLikeUsersid(String name) {return this.favDAO.queryLikeByUsersid(name);}
/** check * */
public List<Fav> checkByLikeGoodsid(String name) {return this.favDAO.queryLikeByGoodsid(name);}
/** check * */
public List<Fav> checkByLikeAddtime(String name) {return this.favDAO.queryLikeByAddtime(name);}
/** checkId * */
public Fav checkId(String id) {return this.favDAO.queryById(id);}

}
