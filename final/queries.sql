SELECT * FROM `photos` WHERE `album_id`='4';

SELECT * FROM `catalog_items` WHERE `catalog_section_id`='1' LIMIT 6;


SELECT * FROM `catalog_items` WHERE (`catalog_section_id`='1') AND (`catalog_category_id`='45') AND (FIND_IN_SET('17',
    REPLACE(REPLACE(REPLACE(REPLACE(activity_types, '[', ''), ']', ''), '"', ''), ' ', '')));


SELECT * FROM `cases` LEFT JOIN `photo_albums` ON `cases`.`album_id` = `photo_albums`.`id` WHERE photo_albums.name
                                                                                                     LIKE "%%" OR photo_albums.name IS NULL