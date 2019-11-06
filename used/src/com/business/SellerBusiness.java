package com.business;
import java.util.List;
import com.dao.SellerDAO;
import com.entity.Seller;
public class SellerBusiness {
/** Spring IOC DAO 注入 Business * */
private SellerDAO sellerDAO;
public SellerDAO getSellerDAO() { return sellerDAO; }
public void setSellerDAO(SellerDAO sellerDAO) { this.sellerDAO = sellerDAO; }
/** save * */
public void save(Seller seller) {this.sellerDAO.save(seller);}
/** update * */
public void update(Seller seller) {this.sellerDAO.update(seller);}
/** delete * */
public void delete(String id) {this.sellerDAO.delete(id);}
/** delete * */
public void delete(int id) {this.sellerDAO.delete(id);}
/** delete * */
public void delete(Seller seller) {this.sellerDAO.delete(seller);}
/** show * */
public List<Seller> show() {return sellerDAO.show();}
/** check * */
public List<Seller> checkUsername(String name) {return this.sellerDAO.queryByUsername(name);}
/** check * */
public List<Seller> checkPassword(String name) {return this.sellerDAO.queryByPassword(name);}
/** check * */
public List<Seller> checkRealname(String name) {return this.sellerDAO.queryByRealname(name);}
/** check * */
public List<Seller> checkSex(String name) {return this.sellerDAO.queryBySex(name);}
/** check * */
public List<Seller> checkBirthday(String name) {return this.sellerDAO.queryByBirthday(name);}
/** check * */
public List<Seller> checkContact(String name) {return this.sellerDAO.queryByContact(name);}
/** check * */
public List<Seller> checkQq(String name) {return this.sellerDAO.queryByQq(name);}
/** check * */
public List<Seller> checkStatus(String name) {return this.sellerDAO.queryByStatus(name);}
/** check * */
public List<Seller> checkRegdate(String name) {return this.sellerDAO.queryByRegdate(name);}
/** check * */
public List<Seller> checkByLikeUsername(String name) {return this.sellerDAO.queryLikeByUsername(name);}
/** check * */
public List<Seller> checkByLikePassword(String name) {return this.sellerDAO.queryLikeByPassword(name);}
/** check * */
public List<Seller> checkByLikeRealname(String name) {return this.sellerDAO.queryLikeByRealname(name);}
/** check * */
public List<Seller> checkByLikeSex(String name) {return this.sellerDAO.queryLikeBySex(name);}
/** check * */
public List<Seller> checkByLikeBirthday(String name) {return this.sellerDAO.queryLikeByBirthday(name);}
/** check * */
public List<Seller> checkByLikeContact(String name) {return this.sellerDAO.queryLikeByContact(name);}
/** check * */
public List<Seller> checkByLikeQq(String name) {return this.sellerDAO.queryLikeByQq(name);}
/** check * */
public List<Seller> checkByLikeStatus(String name) {return this.sellerDAO.queryLikeByStatus(name);}
/** check * */
public List<Seller> checkByLikeRegdate(String name) {return this.sellerDAO.queryLikeByRegdate(name);}
/** checkId * */
public Seller checkId(String id) {return this.sellerDAO.queryById(id);}

}
