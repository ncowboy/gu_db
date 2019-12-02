CREATE OR REPLACE VIEW catalog AS SELECT * FROM catalog_items ORDER BY price;

CREATE OR REPLACE VIEW artists AS
SELECT catalog_items.id, cities.title, price, catalog_categories.name
FROM catalog_items
    LEFT JOIN cities ON catalog_items.city_id = cities.id
    LEFT JOIN catalog_categories ON catalog_items.catalog_category_id = catalog_categories.id

WHERE catalog_items.catalog_section_id = 2;