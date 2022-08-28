CREATE TABLE `account` (
  `user_mail` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `account_role` int NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `user_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `user_phone` varchar(10) NOT NULL,
  PRIMARY KEY (`user_mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `product_des` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `product_price` float NOT NULL,
  `product_img_source` varchar(255) NOT NULL,
  `product_type` varchar(100) NOT NULL,
  `product_brand` varchar(100) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_mail` varchar(100) NOT NULL,
  `order_id` int NOT NULL,
  `order_status` int NOT NULL,
  `order_date` date NOT NULL,
  `order_discount_code` varchar(8) DEFAULT NULL,
  `order_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `user_phone` varchar(10) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders_detail` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `amount_product` int NOT NULL,
  `price_product` float NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `FK_P` (`product_id`),
  CONSTRAINT `FK_O` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FK_P` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


