/*
Определить кто больше поставил лайков (всего) - мужчины или женщины?
*/

SELECT
       SUM(user_id IN (
            SELECT user_id
            FROM vk.profiles
            WHERE gender LIKE 'f'
            )) AS females,
       SUM(user_id IN (
            SELECT user_id
            FROM vk.profiles
            WHERE gender LIKE 'm'
            )) AS males

FROM vk.likes;