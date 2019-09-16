CREATE TABLE `user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `type` int NOT NULL,
  `username` varchar(20) NOT NULL,
  `h_password` varchar(20) NOT NULL,
  `token` varchar(255)
);

CREATE TABLE `vender` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `u_id` int NOT NULL,
  `v_name` varchar(20) NOT NULL,
  `o_name` varchar(20),
  `contact` varchar(10),
  `desciption` varchar(80)
);

CREATE TABLE `menu_pool` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `v_id` int NOT NULL,
  `menu_name` varchar(20) NOT NULL
);

CREATE TABLE `menu_available` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `v_id` int NOT NULL,
  `m_id` int NOT NULL,
  `timestamp` datetime default CURRENT_TIMESTAMP
);

CREATE TABLE `vender_available` (
  `id` int PRIMARY KEY,
  `v_id` int,
  `timestamp` datetime default CURRENT_TIMESTAMP
);

CREATE TABLE `favorite_vender` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `c_id` int NOT NULL,
  `v_id` int NOT NULL
);

CREATE TABLE `favorite_menu` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `c_id` int NOT NULL,
  `m_id` int NOT NULL
);

ALTER TABLE `vender` ADD FOREIGN KEY (`u_id`) REFERENCES `user` (`id`);

ALTER TABLE `menu_pool` ADD FOREIGN KEY (`v_id`) REFERENCES `vender` (`u_id`);

ALTER TABLE `menu_available` ADD FOREIGN KEY (`v_id`) REFERENCES `vender` (`u_id`);

ALTER TABLE `menu_available` ADD FOREIGN KEY (`m_id`) REFERENCES `menu_pool` (`id`);

ALTER TABLE `vender_available` ADD FOREIGN KEY (`v_id`) REFERENCES `vender` (`u_id`);

ALTER TABLE `favorite_vender` ADD FOREIGN KEY (`c_id`) REFERENCES `user` (`id`);

ALTER TABLE `favorite_vender` ADD FOREIGN KEY (`v_id`) REFERENCES `vender` (`u_id`);

ALTER TABLE `favorite_menu` ADD FOREIGN KEY (`c_id`) REFERENCES `user` (`id`);

ALTER TABLE `favorite_menu` ADD FOREIGN KEY (`m_id`) REFERENCES `menu_pool` (`id`);
