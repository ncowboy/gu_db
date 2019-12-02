DROP DATABASE if EXISTS gu_db_final;
CREATE DATABASE gu_db_final;
USE gu_db_final;

/* Типы активности (фильтр для каталога) */
DROP TABLE IF EXISTS activity_types;
CREATE TABLE activity_types
(
    `id`    BIGINT AUTO_INCREMENT PRIMARY KEY,
    `name`  varchar(64) NOT NULL,
    `alias` varchar(64) NOT NULL
);


/* Кейсы (для портфолио) */
DROP TABLE IF EXISTS cases;
CREATE TABLE cases
(
    `id`          BIGINT AUTO_INCREMENT PRIMARY KEY,
    `header`      varchar(128)  NOT NULL,
    `description` varchar(1024) NOT NULL,
    `image_url`   varchar(256) DEFAULT NULL,
    `album_id`    BIGINT       DEFAULT NULL
);

/* Категории каталога */

DROP TABLE IF EXISTS catalog_categories;
CREATE TABLE catalog_categories
(
    `id`                 BIGINT AUTO_INCREMENT PRIMARY KEY,
    `name`               varchar(64) NOT NULL,
    `catalog_section_id` BIGINT      NOT NULL
);

/* Позиции каталога */

DROP TABLE IF EXISTS catalog_items;
CREATE TABLE catalog_items
(
    `id`                  BIGINT AUTO_INCREMENT PRIMARY KEY,
    `name`                varchar(64)  NOT NULL,
    `city_id`             BIGINT       NOT NULL,
    `address`             varchar(256) NOT NULL,
    `coordinates`         varchar(128)  DEFAULT NULL,
    `commission`          tinyint(2)    DEFAULT '0',
    `prepay`              tinyint(2)    DEFAULT '0',
    `deposit`             tinyint(2)    DEFAULT '0',
    `activity_types`      json          DEFAULT NULL,
    `price`               int(11)      NOT NULL,
    `hashtags`            json          DEFAULT NULL,
    `description`         varchar(4096) DEFAULT NULL,
    `album_id`            BIGINT        DEFAULT NULL,
    `is_premium`          tinyint(1)    DEFAULT '0',
    `catalog_section_id`  BIGINT        DEFAULT '1',
    `catalog_category_id` BIGINT        DEFAULT '1'
);

/* Разделы каталога */
DROP TABLE IF EXISTS catalog_sections;
CREATE TABLE `catalog_sections`
(
    `id`    BIGINT AUTO_INCREMENT PRIMARY KEY,
    `name`  varchar(128) NOT NULL,
    `alias` varchar(128) NOT NULL
);

/* Хэштеги */

DROP TABLE IF EXISTS hash_tags;
CREATE TABLE hash_tags
(
    `id`    BIGINT AUTO_INCREMENT PRIMARY KEY,
    `title` varchar(32) NOT NULL
);

/* Таблица для закрепления хэштегов за определенными разделами каталога */
DROP TABLE IF EXISTS hash_tags_with_catalog_section;
CREATE TABLE hash_tags_with_catalog_section
(
    `hash_tag_id`        BIGINT AUTO_INCREMENT PRIMARY KEY,
    `catalog_section_id` BIGINT
);

/* Фотографии */
DROP TABLE IF EXISTS photos;
CREATE TABLE photos
(
    `id`       BIGINT AUTO_INCREMENT PRIMARY KEY,
    `src`      varchar(512) NOT NULL,
    `album_id` BIGINT
);

/* Фото альбомы */
DROP TABLE IF EXISTS photo_albums;
CREATE TABLE photo_albums
(
    `id`          BIGINT AUTO_INCREMENT PRIMARY KEY,
    `name`        varchar(256) NOT NULL,
    `description` varchar(1024) DEFAULT NULL
);

/* Города */

DROP TABLE IF EXISTS cities;
CREATE TABLE `cities`
(
    `id`    BIGINT AUTO_INCREMENT PRIMARY KEY,
    `title` varchar(64) NOT NULL
);

/* Корзина */
DROP TABLE IF EXISTS carts;
CREATE TABLE carts
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT,
    session_id VARCHAR(64) NOT NULL,
    id_order   BIGINT    DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* Заказы */
DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
    id     BIGINT PRIMARY KEY AUTO_INCREMENT,
    name   varchar(64)   NOT NULL,
    phone  varchar(64)   NOT NULL,
    email  varchar(64)   NOT NULL,
    start  DATE          NOT NULL,
    finish DATE          NOT NULL,
    info   varchar(2048) NOT NULL
);

DROP TABLE IF EXISTS items_in_cart;
CREATE TABLE items_in_cart
(
    catalog_item_id BIGINT NOT NULL,
    cart_id         BIGINT NOT NULL
);


/* Ключи */

ALTER TABLE `cases`
    ADD KEY `fk_album_id_2` (`album_id`);
ALTER TABLE `carts`
    ADD KEY `fk_carts__order_id` (`id_order`);

ALTER TABLE `catalog_categories`
    ADD KEY `catalog_categories__catalog_sections` (`catalog_section_id`);

ALTER TABLE `catalog_items`
    ADD KEY `catalog_item__album` (`album_id`),
    ADD KEY `catalog_item__city` (`city_id`),
    ADD KEY `catalog_items__catalog_section` (`catalog_section_id`),
    ADD KEY `catalog_items__catalog_category` (`catalog_category_id`);

ALTER TABLE `hash_tags_with_catalog_section`
    ADD KEY `hash_tags_with_catalog_section1` (`hash_tag_id`),
    ADD KEY `hash_tags_with_catalog_section2` (`catalog_section_id`);

ALTER TABLE `items_in_cart`
    ADD KEY `items_in_cart_fk1` (`catalog_item_id`),
    ADD KEY `items_in_cart_fk2` (`cart_id`);

ALTER TABLE `photos`
    ADD KEY `fk_album_id` (`album_id`);

/* Внешние ключи */
ALTER TABLE `cases`
    ADD CONSTRAINT `fk_album_id_2` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`);
ALTER TABLE `carts`
    ADD CONSTRAINT `fk_carts__order_id` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`);

ALTER TABLE `catalog_categories`
    ADD CONSTRAINT `catalog_categories__catalog_sections` FOREIGN KEY (`catalog_section_id`) REFERENCES
        `catalog_sections` (`id`) ON DELETE CASCADE;

ALTER TABLE `catalog_items`
    ADD CONSTRAINT `catalog_item__album` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`) ON DELETE SET NULL,
    ADD CONSTRAINT `catalog_item__city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
    ADD CONSTRAINT `catalog_items__catalog_category` FOREIGN KEY (`catalog_category_id`) REFERENCES `catalog_categories` (`id`),
    ADD CONSTRAINT `catalog_items__catalog_section` FOREIGN KEY (`catalog_section_id`) REFERENCES `catalog_sections` (`id`);

ALTER TABLE `hash_tags_with_catalog_section`
    ADD CONSTRAINT `hash_tags_with_catalog_section1` FOREIGN KEY (`hash_tag_id`) REFERENCES `hash_tags` (`id`),
    ADD CONSTRAINT `hash_tags_with_catalog_section2` FOREIGN KEY (`catalog_section_id`) REFERENCES `catalog_sections` (`id`);

ALTER TABLE `items_in_cart`
    ADD CONSTRAINT `items_in_cart_fk1` FOREIGN KEY (`catalog_item_id`) REFERENCES `catalog_items` (`id`),
    ADD CONSTRAINT `items_in_cart_fk2` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`);

ALTER TABLE `photos`
    ADD CONSTRAINT `fk_album_id` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`) ON DELETE CASCADE;

