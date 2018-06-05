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
    platform INT(8) NOT NULL,
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
    platform INT(8) NOT NULL,
    charges INT(8) NOT NULL DEFAULT 0,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    delete_flag tinyint(1) NOT NULL DEFAULT '0',
    created DATETIME,
    updated DATETIME
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `properties`;
CREATE TABLE properties (
    property_id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    property_name VARCHAR(255) NOT NULL,
    image_thumb VARCHAR(255) NOT NULL,
    log_pfx VARCHAR(125) NOT NULL,
    content_pfx VARCHAR(125) NOT NULL,
    bg_3dc_color VARCHAR(6),
    print_dialog_url VARCHAR(255) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    sort_num INT(4),
    delete_flag tinyint(1) NOT NULL DEFAULT '0',
    created DATETIME,
    updated DATETIME
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `notification`;
CREATE TABLE notification (
    notification_id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title text NOT NULL,
    detail text,
    info_image VARCHAR(255) NOT NULL,
    type INT(1) NOT NULL DEFAULT 1,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    delete_flag tinyint(1) NOT NULL DEFAULT '0',
    created DATETIME,
    updated DATETIME
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `user_notify_logs`;
CREATE TABLE user_notify_logs (
    user_notify_log_id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_account_id INT(8) NOT NULL FOREIGN KEY,
    notification_id INT(8) NOT NULL FOREIGN KEY,
    created DATETIME,
    updated DATETIME
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `billing_logs`;
CREATE TABLE billing_logs (
    billing_log_id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_account_id INT(8) NOT NULL FOREIGN KEY,
    billing_type INT(8) NOT NULL,
    billing_start_at DATETIME NOT NULL,
    created DATETIME,
    updated DATETIME
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;