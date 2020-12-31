-- データベースを作成
DROP DATABASE IF EXISTS steamdata;
CREATE DATABASE steamdata;
USE steamdata;

-- apps を作成
DROP TABLE IF EXISTS apps;
CREATE TABLE apps (
  `appid` VARCHAR(16) NOT NULL
  ,`name` VARCHAR(400) NOT NULL
  ,`type` VARCHAR(16) NOT NULL
  ,`recommendations` INT UNSIGNED
  ,`is_free` BOOL
  ,`update_time` TIMESTAMP
  ,PRIMARY KEY(`appid`)
  ,INDEX `index_name` (`name`)
  ,INDEX `index_type` (`type`)
);

-- developers を作成
DROP TABLE IF EXISTS developers;
CREATE TABLE developers (
  `appid` VARCHAR(16) NOT NULL
  ,`name` VARCHAR(200) NOT NULL
  ,`update_time` TIMESTAMP
  ,FOREIGN KEY (`appid`) REFERENCES apps(`appid`)
  ,PRIMARY KEY(`appid`, `name`)
  ,INDEX `index_name` (`name`)
);

-- publishers を作成
DROP TABLE IF EXISTS publishers;
CREATE TABLE publishers (
  `appid` VARCHAR(16) NOT NULL
  ,`name` VARCHAR(200) NOT NULL
  ,`update_time` TIMESTAMP
  ,FOREIGN KEY (`appid`) REFERENCES apps(`appid`)
  ,PRIMARY KEY(`appid`, `name`)
  ,INDEX `index_name` (`name`)
);

-- languages を作成
DROP TABLE IF EXISTS languages;
CREATE TABLE languages (
  `appid` VARCHAR(16) NOT NULL
  ,`name` VARCHAR(200) NOT NULL
  ,`update_time` TIMESTAMP
  ,FOREIGN KEY (`appid`) REFERENCES apps(`appid`)
  ,PRIMARY KEY(`appid`, `name`)
  ,INDEX `index_name` (`name`)
);

-- prices を作成
DROP TABLE IF EXISTS prices;
CREATE TABLE prices (
  `appid` VARCHAR(16) NOT NULL
  ,`currency` VARCHAR(6) NOT NULL
  ,`initial` DECIMAL(10, 2) UNSIGNED NOT NULL
  ,`final` DECIMAL(10, 2) UNSIGNED NOT NULL
  ,`discount_percent` TINYINT
  ,`update_time` TIMESTAMP
  ,FOREIGN KEY (`appid`) REFERENCES apps(`appid`)
  ,PRIMARY KEY(`appid`, `currency`)
  ,INDEX `index_currency` (`currency`)
  ,INDEX `index_discount` (`discount_percent`)
);

-- genres を作成
DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
  `id` VARCHAR(3) NOT NULL
  ,`appid` VARCHAR(16) NOT NULL
  ,`name` VARCHAR(20) NOT NULL
  ,`update_time` TIMESTAMP
  ,FOREIGN KEY (`appid`) REFERENCES apps(`appid`)
  ,PRIMARY KEY (`id`, `appid`)
  ,INDEX `index_appid` (`appid`)
  ,INDEX `index_name` (`name`)
);

-- releases を作成
DROP TABLE IF EXISTS releases;
CREATE TABLE releases (
  `appid` VARCHAR(16)
  ,`comming_soon` BOOL
  ,`date` DATE NOT NULL
  ,`update_time` TIMESTAMP
  ,FOREIGN KEY (`appid`) REFERENCES apps(`appid`)
  ,PRIMARY KEY (`appid`)
  ,INDEX `index_comming` (`comming_soon`)
  ,INDEX `index_date` (`date`)
);
