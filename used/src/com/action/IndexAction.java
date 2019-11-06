package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.business.ArticleBusiness;
import com.business.CartBusiness;
import com.business.CateBusiness;
import com.business.FavBusiness;
import com.business.GoodsBusiness;
import com.business.OrdersBusiness;
import com.business.SellerBusiness;
import com.business.TopicBusiness;
import com.business.UsersBusiness;
import com.entity.Article;
import com.entity.Cart;
import com.entity.Cate;
import com.entity.Fav;
import com.entity.Goods;
import com.entity.Orders;
import com.entity.Seller;
import com.entity.Topic;
import com.entity.Users;
import com.util.VeDate;

public class IndexAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	private String id;
	private String msg;
	private String name;
	private String cond;
	private String num;
	private String username;
	private String password;
	private String repassword;
	private String newpassword;
	private String role;
	private String title = "Second-hand goods trading platform";
	private String code;

	private Users users;
	private Cart cart;
	private Orders orders;
	private Goods goods;
	private Seller seller;
	private Topic topic;

	private Map<String, Object> map = new HashMap<String, Object>();

	private ArticleBusiness articleBusiness;
	private CartBusiness cartBusiness;
	private UsersBusiness usersBusiness;
	private GoodsBusiness goodsBusiness;
	private CateBusiness cateBusiness;
	private OrdersBusiness ordersBusiness;
	private TopicBusiness topicBusiness;
	private FavBusiness favBusiness;
	private SellerBusiness sellerBusiness;

	private void init() {
		List<Cate> cateList = this.cateBusiness.show();
		this.map.put("cateList", cateList);
		List<Goods> hotList = this.goodsBusiness.hot();
		this.map.put("hotList", hotList);
	}

	public String index() {
		this.init();
		List<Cate> fList = this.cateBusiness.front();
		List<Cate> frontList = new ArrayList<Cate>();
		for (Cate cate : fList) {
			List<Goods> goodsList = this.goodsBusiness.front(cate.getCateid());
			cate.setGoodsList(goodsList);
			frontList.add(cate);
		}
		this.map.put("frontList", frontList);
		List<Article> articleList = this.articleBusiness.front();
		this.map.put("articleList", articleList);
		List<Goods> recommendList = this.goodsBusiness.news();
		this.map.put("recommendList", recommendList);
		return SUCCESS;
	}

	public String cate() {
		this.init();
		List<Goods> goodsList = this.goodsBusiness.checkCateid(this.id);
		this.map.put("goodsList", goodsList);
		return SUCCESS;
	}

	public String all() {
		this.init();
		List<Goods> goodsList = this.goodsBusiness.show();
		this.map.put("goodsList", goodsList);
		return SUCCESS;
	}

	public String query() {
		this.init();
		List<Goods> goodsList = this.goodsBusiness.checkByLikeGoodsname(this.name);
		this.map.put("goodsList", goodsList);
		return SUCCESS;
	}

	public String detail() {
		this.init();
		Goods goods = this.goodsBusiness.checkId(this.id);
		goods.setHits("" + (Integer.parseInt(goods.getHits()) + 1));
		this.goodsBusiness.update(goods);
		this.map.put("goods", goods);
		List<Topic> topicList = this.topicBusiness.checkGoodsid(this.id);
		this.map.put("topicList", topicList);
		return SUCCESS;
	}

	// 新闻公告
	public String article() {
		this.init();
		List<Article> articleList = this.articleBusiness.show();
		this.map.put("articleList", articleList);
		return SUCCESS;
	}

	public String read() {
		this.init();
		Article article = this.articleBusiness.checkId(id);
		article.setHits("" + (Integer.parseInt(article.getHits()) + 1));
		this.articleBusiness.update(article);
		this.map.put("article", article);
		return SUCCESS;
	}

	public String preLogin() {
		this.init();
		return SUCCESS;
	}

	public String login() {
		this.init();
		if ("Buyer".equals(this.role)) {
			List<Users> usersList = this.usersBusiness.checkUsername(this.username);
			if (usersList.size() == 0) {
				return "usererror";
			} else {
				Users user = usersList.get(0);
				if (user.getPassword().equals(this.password)) {
					session.put("userid", user.getUsersid());
					session.put("username", user.getUsername());
					session.put("realname", user.getRealname());
					session.put("role", this.role);
					return "user";
				} else {
					return "usererror";
				}
			}
		} else {
			List<Seller> sellerList = this.sellerBusiness.checkUsername(this.username);
			if (sellerList.size() == 0) {
				return "usererror";
			} else {
				Seller s = sellerList.get(0);
				if (s.getPassword().equals(this.password)) {
					if ("锁定".equals(s.getStatus())) {
						this.session.put("message", "账户被锁定");
						return "usererror";
					}
					session.put("userid", s.getSellerid());
					session.put("username", s.getUsername());
					session.put("realname", s.getRealname());
					session.put("role", this.role);
					return "suser";
				} else {
					return "usererror";
				}
			}
		}

	}

	public String prePwd() {
		this.init();
		return SUCCESS;
	}

	public String editPwd() {
		String userid = (String) session.get("userid");
		Users u = this.usersBusiness.checkId(userid);
		if (u.getPassword().equals(this.password)) {
			u.setPassword(this.repassword);
			this.usersBusiness.update(u);
		} else {
			this.session.put("message", "Old password error");
		}
		return SUCCESS;
	}

	public String preSPwd() {
		this.init();
		return SUCCESS;
	}

	public String editSPwd() {
		String userid = (String) session.get("userid");
		Seller s = this.sellerBusiness.checkId(userid);
		if (s.getPassword().equals(this.password)) {
			s.setPassword(this.repassword);
			this.sellerBusiness.update(s);
		} else {
			this.session.put("message", "Old password error");
		}
		return SUCCESS;
	}

	public String preReg() {
		this.init();
		return SUCCESS;
	}

	public String reg() {
		this.init();
		this.users.setRegdate(VeDate.getStringDateShort());
		this.usersBusiness.save(this.users);
		return SUCCESS;
	}

	public String preSReg() {
		this.init();
		return SUCCESS;
	}

	public String sreg() {
		this.init();
		this.seller.setRegdate(VeDate.getStringDateShort());
		this.seller.setStatus("锁定");
		this.sellerBusiness.save(this.seller);
		return SUCCESS;
	}

	public String usercenter() {
		this.init();
		this.map.put("msg", null);
		return SUCCESS;
	}

	public String susercenter() {
		this.init();
		this.map.put("msg", null);
		return SUCCESS;
	}

	public String personal() {
		this.init();
		this.usersBusiness.update(users);
		session.put("users", users);
		return SUCCESS;
	}

	public String exit() {
		session.clear();
		return SUCCESS;
	}

	public String addCart() {
		this.init();
		String userid = (String) this.session.get("userid");
		this.cart.setAddtime(VeDate.getStringDateShort());
		this.cart.setUsersid(userid);
		this.cartBusiness.save(this.cart);
		return SUCCESS;
	}

	public String cart() {
		this.init();
		String userid = (String) this.session.get("userid");
		List<Cart> cartList = this.cartBusiness.checkUsersid(userid);
		this.map.put("cartList", cartList);
		String total = "0";
		for (Cart cart : cartList) {
			total = "" + (Double.parseDouble(total)
					+ Double.parseDouble(cart.getPrice()) * Double.parseDouble(cart.getNum()));
		}
		this.map.put("total", total);
		return SUCCESS;
	}

	public String deleteCart() {
		this.init();
		this.cartBusiness.delete(this.id);
		return SUCCESS;
	}

	public String preCheckout() {
		this.init();
		String userid = (String) this.session.get("userid");
		List<Cart> cartList = this.cartBusiness.checkUsersid(userid);
		if (cartList.size() == 0) {
			return "fail";
		}
		return SUCCESS;
	}

	public String checkout() {
		this.init();
		String userid = (String) this.session.get("userid");
		List<Cart> cartList = this.cartBusiness.checkUsersid(userid);
		String ordersid = "EO" + VeDate.getStringDatex();
		for (Cart cart : cartList) {
			Orders orders = new Orders();
			orders.setAddress(this.cond);
			orders.setAddtime(VeDate.getStringDate());
			orders.setContact(this.msg);
			orders.setOrdercode(ordersid);
			orders.setReceiver(this.name);
			orders.setStatus("Unpaid");
			orders.setUsersid(userid);
			orders.setGoodsid(cart.getGoodsid());
			orders.setPrice(cart.getPrice());
			orders.setNum(cart.getNum());
			orders.setStatus("Unpaid");
			this.ordersBusiness.save(orders);
			this.cartBusiness.delete(cart);
			Goods goods = this.goodsBusiness.checkId(cart.getGoodsid());
			goods.setSellnum("" + (Integer.parseInt(goods.getSellnum()) + Integer.parseInt(cart.getNum())));
			this.goodsBusiness.update(goods);
		}
		return SUCCESS;
	}

	public String showOrders() {
		this.init();
		String userid = (String) this.session.get("userid");
		List<Orders> ordersList = this.ordersBusiness.checkUsersid(userid);
		this.map.put("ordersList", ordersList);
		return SUCCESS;
	}

	public String showSOrders() {
		this.init();
		String userid = (String) this.session.get("userid");
		List<Orders> ordersList = this.ordersBusiness.checkGoodsid(userid);
		this.map.put("ordersList", ordersList);
		return SUCCESS;
	}

	public String prePay() {
		this.init();
		return SUCCESS;
	}

	public String pay() {
		this.init();
		// 检查验证码
		String checkCode = (String) session.get("checkCode");
		if (!checkCode.equals(this.code)) {
			this.msg = "验证码错误";
			return "payerror";
		} else {
			Orders orders = this.ordersBusiness.checkId(this.id);
			orders.setStatus("Paid");
			this.ordersBusiness.update(orders);
		}
		return SUCCESS;
	}

	public String send() {
		this.init();
		Orders orders = this.ordersBusiness.checkId(this.id);
		orders.setStatus("发货");
		this.ordersBusiness.update(orders);
		return SUCCESS;
	}

	public String receive() {
		this.init();
		Orders orders = this.ordersBusiness.checkId(this.id);
		orders.setStatus("收货");
		this.ordersBusiness.update(orders);
		return SUCCESS;
	}

	public String preTopic() {
		this.init();
		return SUCCESS;
	}

	public String addTopic() {
		this.init();
		Orders orders = this.ordersBusiness.checkId(this.id);
		orders.setStatus("已评价");
		this.ordersBusiness.update(orders);
		String userid = (String) session.get("userid");
		this.topic.setAddtime(VeDate.getStringDate());
		this.topic.setUsersid(userid);
		this.topic.setGoodsid(orders.getGoodsid());
		this.topicBusiness.save(this.topic);
		return SUCCESS;
	}

	public String preGoods() {
		this.init();
		return SUCCESS;
	}

	public String addGoods() {
		this.init();
		String userid = (String) session.get("userid");
		this.goods.setAddtime(VeDate.getStringDateShort());
		this.goods.setHits("0");
		this.goods.setSellerid(userid);
		this.goods.setSellnum("0");
		this.goodsBusiness.save(this.goods);
		return SUCCESS;
	}

	public String myGoods() {
		this.init();
		String userid = (String) session.get("userid");
		List<Goods> goodsList = this.goodsBusiness.checkSellerid(userid);
		this.map.put("goodsList", goodsList);
		return SUCCESS;
	}

	public String addFav() {
		this.init();
		String userid = (String) session.get("userid");
		Fav fav = new Fav();
		fav.setAddtime(VeDate.getStringDateShort());
		fav.setGoodsid(this.id);
		fav.setUsersid(userid);
		this.favBusiness.save(fav);
		return SUCCESS;
	}

	public String myFav() {
		this.init();
		String userid = (String) session.get("userid");
		List<Fav> favList = this.favBusiness.checkUsersid(userid);
		this.map.put("favList", favList);
		return SUCCESS;
	}

	public String deleteFav() {
		this.init();
		this.favBusiness.delete(this.id);
		return SUCCESS;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
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

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public ArticleBusiness getArticleBusiness() {
		return articleBusiness;
	}

	public void setArticleBusiness(ArticleBusiness articleBusiness) {
		this.articleBusiness = articleBusiness;
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

	public CateBusiness getCateBusiness() {
		return cateBusiness;
	}

	public void setCateBusiness(CateBusiness cateBusiness) {
		this.cateBusiness = cateBusiness;
	}

	public OrdersBusiness getOrdersBusiness() {
		return ordersBusiness;
	}

	public void setOrdersBusiness(OrdersBusiness ordersBusiness) {
		this.ordersBusiness = ordersBusiness;
	}

	public TopicBusiness getTopicBusiness() {
		return topicBusiness;
	}

	public void setTopicBusiness(TopicBusiness topicBusiness) {
		this.topicBusiness = topicBusiness;
	}

	public FavBusiness getFavBusiness() {
		return favBusiness;
	}

	public void setFavBusiness(FavBusiness favBusiness) {
		this.favBusiness = favBusiness;
	}

	public SellerBusiness getSellerBusiness() {
		return sellerBusiness;
	}

	public void setSellerBusiness(SellerBusiness sellerBusiness) {
		this.sellerBusiness = sellerBusiness;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
