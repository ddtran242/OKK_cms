DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE admin_info (
    admin_id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    login_id VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    admin_name VARCHAR(50),
    status VARCHAR(20),
    last_login_time DATETIME,
    delete_flag tinyint(1) NOT NULL DEFAULT '0',
    created DATETIME,
    updated DATETIME
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `user_acc_info`;
CREATE TABLE user_acc_info (
    user_account_id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_signin VARCHAR(50) NOT NULL UNIQUE,
    token VARCHAR(255) NOT NULL,
    device_token VARCHAR(255) NOT NULL,
    platform VARCHAR(50) NOT NULL,
    data_url VARCHAR(255) NOT NULL,
    expiration_date DATETIME,
    delete_flag tinyint(1) NOT NULL DEFAULT '0',
    created DATETIME,
    updated DATETIME
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `contents`;
CREATE TABLE contents (
    content_id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    property_id INT(8) NOT NULL FOREIGN KEY,
    version_no INT(8) NOT NULL DEFAULT '1',
    content_title VARCHAR(255) NOT NULL,
    content_comment text,
    item_id VARCHAR(125) NOT NULL,
    item_type INT(8) NOT NULL DEFAULT '1',
    image_thumb VARCHAR(255) NOT NULL,
    thumb_comment text,
    autodl_flg tinyint(1) NOT NULL DEFAULT '0',
    real_file VARCHAR (255) NOT NULL,
    platform VARCHAR(50) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    delete_flag tinyint(1) NOT NULL DEFAULT '0',
    created DATETIME,
    updated DATETIME
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;