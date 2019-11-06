/*
MySQL Data Transfer
Source Host: localhost
Source Database: used
Target Host: localhost
Target Database: used
Date: 2017/12/29 14:40:10
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` varchar(255) NOT NULL,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `realname` varchar(255) default NULL,
  `contact` varchar(255) default NULL,
  PRIMARY KEY  (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `articleid` varchar(255) NOT NULL,
  `title` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `contents` varchar(255) default NULL,
  `addtime` varchar(255) default NULL,
  `hits` varchar(255) default NULL,
  PRIMARY KEY  (`articleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cartid` varchar(255) NOT NULL,
  `goodsid` varchar(255) default NULL,
  `usersid` varchar(255) default NULL,
  `price` varchar(255) default NULL,
  `num` varchar(255) default NULL,
  `addtime` varchar(255) default NULL,
  PRIMARY KEY  (`cartid`),
  KEY `FK2E7B202F06CBA9` (`goodsid`),
  KEY `FK2E7B201AB1D48D` (`usersid`),
  CONSTRAINT `FK2E7B201AB1D48D` FOREIGN KEY (`usersid`) REFERENCES `users` (`usersid`),
  CONSTRAINT `FK2E7B202F06CBA9` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cate
-- ----------------------------
DROP TABLE IF EXISTS `cate`;
CREATE TABLE `cate` (
  `cateid` varchar(255) NOT NULL,
  `catename` varchar(255) default NULL,
  PRIMARY KEY  (`cateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fav
-- ----------------------------
DROP TABLE IF EXISTS `fav`;
CREATE TABLE `fav` (
  `favid` varchar(255) NOT NULL,
  `usersid` varchar(255) default NULL,
  `goodsid` varchar(255) default NULL,
  `addtime` varchar(255) default NULL,
  PRIMARY KEY  (`favid`),
  KEY `FK18B1B2F06CBA9` (`goodsid`),
  KEY `FK18B1B1AB1D48D` (`usersid`),
  CONSTRAINT `FK18B1B1AB1D48D` FOREIGN KEY (`usersid`) REFERENCES `users` (`usersid`),
  CONSTRAINT `FK18B1B2F06CBA9` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsid` varchar(255) NOT NULL,
  `goodsname` varchar(255) default NULL,
  `sellerid` varchar(255) default NULL,
  `cateid` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `oldprice` varchar(255) default NULL,
  `price` varchar(255) default NULL,
  `addtime` varchar(255) default NULL,
  `hits` varchar(255) default NULL,
  `sellnum` varchar(255) default NULL,
  `contents` varchar(255) default NULL,
  PRIMARY KEY  (`goodsid`),
  KEY `FK5DF97568E9A6737` (`sellerid`),
  KEY `FK5DF975696D32A57` (`cateid`),
  CONSTRAINT `FK5DF975696D32A57` FOREIGN KEY (`cateid`) REFERENCES `cate` (`cateid`),
  CONSTRAINT `FK5DF97568E9A6737` FOREIGN KEY (`sellerid`) REFERENCES `seller` (`sellerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ordersid` varchar(255) NOT NULL,
  `ordercode` varchar(255) default NULL,
  `usersid` varchar(255) default NULL,
  `goodsid` varchar(255) default NULL,
  `price` varchar(255) default NULL,
  `num` varchar(255) default NULL,
  `addtime` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `receiver` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `contact` varchar(255) default NULL,
  PRIMARY KEY  (`ordersid`),
  KEY `FKC3DF62E52F06CBA9` (`goodsid`),
  KEY `FKC3DF62E51AB1D48D` (`usersid`),
  CONSTRAINT `FKC3DF62E51AB1D48D` FOREIGN KEY (`usersid`) REFERENCES `users` (`usersid`),
  CONSTRAINT `FKC3DF62E52F06CBA9` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `sellerid` varchar(255) NOT NULL,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `realname` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `birthday` varchar(255) default NULL,
  `contact` varchar(255) default NULL,
  `qq` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `regdate` varchar(255) default NULL,
  PRIMARY KEY  (`sellerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topicid` varchar(255) NOT NULL,
  `usersid` varchar(255) default NULL,
  `goodsid` varchar(255) default NULL,
  `num` varchar(255) default NULL,
  `contents` varchar(255) default NULL,
  `addtime` varchar(255) default NULL,
  PRIMARY KEY  (`topicid`),
  KEY `FK696CD2F2F06CBA9` (`goodsid`),
  KEY `FK696CD2F1AB1D48D` (`usersid`),
  CONSTRAINT `FK696CD2F1AB1D48D` FOREIGN KEY (`usersid`) REFERENCES `users` (`usersid`),
  CONSTRAINT `FK696CD2F2F06CBA9` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `usersid` varchar(255) NOT NULL,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `realname` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `birthday` varchar(255) default NULL,
  `contact` varchar(255) default NULL,
  `regdate` varchar(255) default NULL,
  PRIMARY KEY  (`usersid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', 'admin', 'admin');
INSERT INTO `article` VALUES ('40289f12609e111601609e14bee10001', '1111', 'upfiles/20171229010405.jpg', '<p>在此添加内容111111111</p>\r\n', '2017-12-29 01:04:07', '1');
INSERT INTO `cate` VALUES ('40289f126094c07f016094c1b47a0001', '电子产品');
INSERT INTO `cate` VALUES ('40289f126094c07f016094c1ce190002', '服装服饰');
INSERT INTO `cate` VALUES ('40289f126094c07f016094c23d5e0003', '图书教材');
INSERT INTO `goods` VALUES ('40289f12609da50d01609dbabc780001', 'lol游戏键盘鼠标套装', '40289f12609c60e901609c7a0ddc0001', '40289f126094c07f016094c1b47a0001', 'upfiles/20171228232539.jpg', '199', '99', '2017-12-28', '2', '1', '<p>lol游戏键盘鼠标套装</p>\r\n');
INSERT INTO `goods` VALUES ('40289f12609da50d01609dcd21c90002', '达尔优（dare-u）87键机械合金版键盘', '40289f12609c60e901609c7a0ddc0001', '40289f126094c07f016094c1b47a0001', 'upfiles/20171228234545.jpg', '199', '99', '2017-12-28', '5', '1', '<p>达尔优（dare-u）87键机械合金版游戏背光键盘</p>\r\n');
INSERT INTO `goods` VALUES ('40289f12609da50d01609dcd66110003', '狼蛛（AULA）F2008混光跑马 机械键盘', '40289f12609c60e901609c7a0ddc0001', '40289f126094c07f016094c1b47a0001', 'upfiles/20171228234603.jpg', '199', '99', '2017-12-28', '0', '0', '<p>狼蛛（AULA）F2008混光跑马 机械键盘</p>\r\n');
INSERT INTO `goods` VALUES ('40289f12609da50d01609dce36e80004', '雷蛇（Razer）二角尘蛛+地狱狂蛇 ', '40289f12609c60e901609c7a0ddc0001', '40289f126094c07f016094c1b47a0001', 'upfiles/20171228234646.jpg', '519', '199', '2017-12-28', '0', '0', '<p>雷蛇（Razer）二角尘蛛+地狱狂蛇 游戏</p>\r\n');
INSERT INTO `goods` VALUES ('40289f12609da50d01609dce8d620005', '罗技（Logitech）G710+ Blue 机械键盘', '40289f12609c60e901609c7a0ddc0001', '40289f126094c07f016094c1b47a0001', 'upfiles/20171228234717.jpg', '799', '399', '2017-12-28', '0', '0', '<p>罗技（Logitech）G710+ Blue 机械游戏键盘</p>\r\n');
INSERT INTO `goods` VALUES ('40289f12609da50d01609e06ae1e0007', 'Gap纯棉百搭小格纹单袋长袖衬衫', '40289f12609da50d01609e041b590006', '40289f126094c07f016094c1ce190002', 'upfiles/20171229004835.jpg', '199', '99', '2017-12-29', '0', '0', '<p>Gap纯棉百搭小格纹单袋长袖衬衫</p>\r\n');
INSERT INTO `goods` VALUES ('40289f12609da50d01609e06ef590008', 'Seno商务休闲长袖衬衫', '40289f12609da50d01609e041b590006', '40289f126094c07f016094c1ce190002', 'upfiles/20171229004851.jpg', '199', '75', '2017-12-29', '0', '0', '<p>Seno商务休闲长袖衬衫</p>\r\n');
INSERT INTO `goods` VALUES ('40289f12609da50d01609e0730bb0009', '哥弟女装2016春夏新品衬衫', '40289f12609da50d01609e041b590006', '40289f126094c07f016094c1ce190002', 'upfiles/20171229004911.jpg', '199', '99', '2017-12-29', '0', '0', '<p>哥弟女装2016春夏新品衬衫</p>\r\n');
INSERT INTO `goods` VALUES ('40289f12609da50d01609e076232000a', '韩都衣舍 韩版2016夏装衬衫', '40289f12609da50d01609e041b590006', '40289f126094c07f016094c1ce190002', 'upfiles/20171229004925.jpg', '199', '99', '2017-12-29', '0', '0', '<p>韩都衣舍 韩版2016夏装衬衫</p>\r\n');
INSERT INTO `goods` VALUES ('40289f12609da50d01609e079fa3000b', '红豆（Hodo）男装 2016春款衬衫', '40289f12609da50d01609e041b590006', '40289f126094c07f016094c1ce190002', 'upfiles/20171229004939.jpg', '199', '75', '2017-12-29', '1', '0', '<p>红豆（Hodo）男装 2016春款衬衫</p>\r\n');
INSERT INTO `orders` VALUES ('40289f12609e200001609e2400580004', 'EO20171229012047', '40289f12609e200001609e23a0e30001', '40289f12609da50d01609dbabc780001', '99', '1', '2017-12-29 01:20:47', '未付款', '123123', '123123', '123123');
INSERT INTO `orders` VALUES ('40289f12609e200001609e2400670005', 'EO20171229012047', '40289f12609e200001609e23a0e30001', '40289f12609da50d01609dcd21c90002', '99', '1', '2017-12-29 01:20:47', '已评价', '123123', '123123', '123123');
INSERT INTO `seller` VALUES ('40289f12609c60e901609c7a0ddc0001', '111', '111', '111', '男', '2017-12-28', '111', '111', '解锁', '2017-12-28');
INSERT INTO `seller` VALUES ('40289f12609da50d01609e041b590006', '222', '222', '222', '男', '2017-12-29', '222', '222', '解锁', '2017-12-29');
INSERT INTO `topic` VALUES ('40289f12609e5e5301609e99f0100001', '40289f12609e200001609e23a0e30001', '40289f12609da50d01609dcd21c90002', '5', '123123', '2017-12-29 03:29:36');
INSERT INTO `users` VALUES ('40289f12609e200001609e23a0e30001', '123123', '123123', '123123', '男', '2017-12-29', '123123', '2017-12-29');
