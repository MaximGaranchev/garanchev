#
# TABLE STRUCTURE FOR: categories
#

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `categoryid` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`categoryid`, `name`, `description`) VALUES (0, 'voluptatibus', 'Explicabo necessitatibus voluptates sunt eveniet incidunt. Ipsa reprehenderit modi reiciendis doloremque. Dolor nisi consequatur voluptatibus et nam ut adipisci et.');


#
# TABLE STRUCTURE FOR: customers
#

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `customerid` int(11) NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `customers` (`customerid`, `firstname`, `lastname`, `email`, `phonenumber`) VALUES (0, 'Kevin', 'Purdy', 'katharina68@example.com', '244-016-3203');


#
# TABLE STRUCTURE FOR: employees
#

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `employeeid` int(11) NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `jobtitle` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `employees` (`employeeid`, `firstname`, `lastname`, `email`, `phonenumber`, `hiredate`, `jobtitle`, `salary`) VALUES (0, 'Abagail', 'Kessler', 'zachary.langworth@example.org', '02610533481', '2004-06-03', 'Voluptatum ut ut est deserunt aut quam ut.', NULL);


#
# TABLE STRUCTURE FOR: inventory
#

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `productid` int(11) NOT NULL,
  `supplierid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`productid`,`supplierid`),
  KEY `supplierid` (`supplierid`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`supplierid`) REFERENCES `suppliers` (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `inventory` (`productid`, `supplierid`, `quantity`) VALUES (0, 0, 376);


#
# TABLE STRUCTURE FOR: orderitems
#

DROP TABLE IF EXISTS `orderitems`;

CREATE TABLE `orderitems` (
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderid`,`productid`),
  KEY `productid` (`productid`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`),
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `orderitems` (`orderid`, `productid`, `quantity`) VALUES (0, 0, 3);
INSERT INTO `orderitems` (`orderid`, `productid`, `quantity`) VALUES (1, 0, 5426);
INSERT INTO `orderitems` (`orderid`, `productid`, `quantity`) VALUES (2, 0, 1);
INSERT INTO `orderitems` (`orderid`, `productid`, `quantity`) VALUES (3, 0, 152);
INSERT INTO `orderitems` (`orderid`, `productid`, `quantity`) VALUES (5, 0, 1081696);
INSERT INTO `orderitems` (`orderid`, `productid`, `quantity`) VALUES (6, 0, 326232);
INSERT INTO `orderitems` (`orderid`, `productid`, `quantity`) VALUES (8, 0, 13404);
INSERT INTO `orderitems` (`orderid`, `productid`, `quantity`) VALUES (9, 0, 5178);
INSERT INTO `orderitems` (`orderid`, `productid`, `quantity`) VALUES (42, 0, 3622108);
INSERT INTO `orderitems` (`orderid`, `productid`, `quantity`) VALUES (75, 0, 34131544);
INSERT INTO `orderitems` (`orderid`, `productid`, `quantity`) VALUES (97, 0, 4682500);
INSERT INTO `orderitems` (`orderid`, `productid`, `quantity`) VALUES (445, 0, 1163);


#
# TABLE STRUCTURE FOR: orders
#

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL,
  `customerid` int(11) DEFAULT NULL,
  `orderdate` date DEFAULT NULL,
  `totalprice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `customerid` (`customerid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customers` (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (0, NULL, '1998-09-20', '3948.40');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (1, NULL, '2008-01-18', '228259.67');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (2, NULL, '2016-10-21', '48.07');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (3, NULL, '1981-07-22', '58843.05');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (4, NULL, '1979-12-13', '99999999.99');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (5, NULL, '2000-08-16', '0.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (6, NULL, '1983-11-29', '49.08');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (8, NULL, '1997-08-31', '20670.94');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (9, NULL, '1980-02-09', '37234232.04');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (23, NULL, '1995-08-03', '96.51');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (32, NULL, '1985-09-17', '53844763.73');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (42, NULL, '1981-10-23', '0.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (43, NULL, '1987-10-28', '208829.88');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (53, NULL, '1992-12-23', '45096.20');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (57, NULL, '2000-09-13', '1.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (64, NULL, '2018-09-01', '407.71');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (75, NULL, '1986-01-04', '62.64');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (93, NULL, '2005-03-20', '494.10');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (97, NULL, '1976-07-28', '99999999.99');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (99, NULL, '1980-03-31', '19155344.88');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (131, NULL, '1986-05-13', '19171183.57');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (231, NULL, '1986-06-03', '0.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (239, NULL, '2017-06-01', '72996128.70');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (355, NULL, '1971-03-10', '156.58');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (392, NULL, '2014-07-16', '21.69');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (445, NULL, '1970-02-05', '30.63');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (465, NULL, '1999-06-20', '404.81');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (569, NULL, '1987-10-16', '0.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (678, NULL, '1983-09-02', '108.38');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (827, NULL, '1991-11-07', '259.60');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (1151, NULL, '1984-05-01', '0.26');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (1334, NULL, '1991-08-14', '1580693.84');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (2087, NULL, '2018-10-22', '7.36');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (3115, NULL, '1970-09-03', '1.92');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (3274, NULL, '1972-01-30', '121.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (3864, NULL, '1974-09-23', '7.92');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (4241, NULL, '1989-06-18', '36.41');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (5627, NULL, '2018-08-07', '226.46');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (5654, NULL, '1993-02-28', '121.81');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (6167, NULL, '1989-05-17', '19357.29');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (6275, NULL, '2014-03-17', '0.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (8003, NULL, '2016-05-19', '0.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (8452, NULL, '2007-06-14', '99999999.99');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (8492, NULL, '2000-04-04', '16351994.62');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (8946, NULL, '2021-09-18', '12470.22');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (9098, NULL, '1972-04-02', '667411.48');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (32665, NULL, '2021-12-12', '4056403.90');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (38588, NULL, '2009-02-09', '2587615.42');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (43832, NULL, '2000-01-13', '6689.66');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (62532, NULL, '1985-02-02', '10.44');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (64914, NULL, '2012-07-28', '5777.86');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (65253, NULL, '2002-04-09', '0.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (75292, NULL, '1977-03-04', '13854761.23');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (80551, NULL, '2003-07-02', '0.65');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (90776, NULL, '2017-10-26', '0.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (99367, NULL, '2008-04-29', '430100.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (107943, NULL, '2008-09-07', '909020.10');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (164315, NULL, '1971-05-16', '1.15');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (248464, NULL, '1975-12-13', '326164.50');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (305880, NULL, '2005-06-08', '28200.53');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (408127, NULL, '2014-07-10', '2.65');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (549696, NULL, '2021-07-26', '10479777.30');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (593460, NULL, '1996-02-03', '97755009.44');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (773712, NULL, '1978-12-21', '216.05');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (855117, NULL, '2006-06-04', '1032817.88');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (1896948, NULL, '1974-12-31', '0.10');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (3745656, NULL, '2017-04-24', '99999999.99');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (4982088, NULL, '1996-10-07', '3.04');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (5865975, NULL, '2005-02-24', '99999999.99');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (7075474, NULL, '1989-06-26', '633237.50');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (8606341, NULL, '1998-08-24', '26353.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (9251272, NULL, '1995-04-09', '0.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (9577856, NULL, '1996-06-20', '21932.10');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (18993214, NULL, '2008-07-21', '99999999.99');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (26251068, NULL, '1979-08-29', '60569769.08');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (34967566, NULL, '2020-09-22', '70500328.70');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (40163363, NULL, '1996-10-25', '200331.06');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (45547871, NULL, '1984-01-22', '99999999.99');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (49276450, NULL, '2010-08-02', '46637.04');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (51082580, NULL, '2001-10-20', '99999999.99');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (51941132, NULL, '1989-12-01', '216.22');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (68208570, NULL, '1991-03-31', '3569.59');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (69888827, NULL, '1984-03-05', '0.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (75015092, NULL, '2001-10-24', '11377783.09');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (85839359, NULL, '1993-06-18', '0.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (87072210, NULL, '1985-11-08', '482611.27');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (90273160, NULL, '2015-01-04', '25.71');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (93984306, NULL, '2015-04-14', '20.30');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (107152416, NULL, '1975-09-09', '0.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (147230245, NULL, '2006-03-21', '1.50');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (230692664, NULL, '2013-11-17', '0.11');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (323146052, NULL, '1981-05-08', '547229.40');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (466320361, NULL, '2009-08-22', '606035.02');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (514833826, NULL, '1983-12-25', '125.71');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (563628174, NULL, '2016-05-03', '0.00');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (584217947, NULL, '1998-02-07', '1735.95');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (705074590, NULL, '1978-04-02', '108056.01');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (737867110, NULL, '2011-08-15', '134129.33');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (764916274, NULL, '1983-05-20', '168.43');
INSERT INTO `orders` (`orderid`, `customerid`, `orderdate`, `totalprice`) VALUES (993107169, NULL, '1972-03-23', '8.62');


#
# TABLE STRUCTURE FOR: productcategories
#

DROP TABLE IF EXISTS `productcategories`;

CREATE TABLE `productcategories` (
  `productid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  PRIMARY KEY (`productid`,`categoryid`),
  KEY `categoryid` (`categoryid`),
  CONSTRAINT `productcategories_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  CONSTRAINT `productcategories_ibfk_2` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: productpromotions
#

DROP TABLE IF EXISTS `productpromotions`;

CREATE TABLE `productpromotions` (
  `productid` int(11) NOT NULL,
  `promotionid` int(11) NOT NULL,
  PRIMARY KEY (`productid`,`promotionid`),
  KEY `promotionid` (`promotionid`),
  CONSTRAINT `productpromotions_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  CONSTRAINT `productpromotions_ibfk_2` FOREIGN KEY (`promotionid`) REFERENCES `promotions` (`promotionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: products
#

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `productid` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`productid`, `name`, `description`, `price`, `category`) VALUES (0, 'distinctio', 'Dolore eveniet dolores sit facilis. Ab molestiae vitae quibusdam. Quae cumque cupiditate totam impedit amet iure adipisci.', '0.00', NULL);


#
# TABLE STRUCTURE FOR: promotions
#

DROP TABLE IF EXISTS `promotions`;

CREATE TABLE `promotions` (
  `promotionid` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`promotionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `promotions` (`promotionid`, `name`, `description`, `startdate`, `enddate`) VALUES (0, 'eum', 'Corrupti aperiam in eum porro animi. Perferendis enim minus consequuntur saepe et placeat voluptas. Sit hic magnam sed. Nulla explicabo illum expedita eligendi earum fuga reiciendis. Quos et quod deserunt.', '1973-01-04', '2009-07-16');


#
# TABLE STRUCTURE FOR: sales
#

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `saleid` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `saledate` date DEFAULT NULL,
  `saleprice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`saleid`),
  KEY `productid` (`productid`),
  KEY `customerid` (`customerid`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`customerid`) REFERENCES `customers` (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sales` (`saleid`, `productid`, `customerid`, `saledate`, `saleprice`) VALUES (0, NULL, NULL, '1974-05-02', '2.00');


#
# TABLE STRUCTURE FOR: suppliers
#

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `supplierid` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contactname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `suppliers` (`supplierid`, `name`, `contactname`, `address`, `phonenumber`) VALUES (0, 'aspernatur', '724-583-8427', '93006 Beahan Ridge Suite 418\nKattiemouth, MS 81604', '973-712-4341');


