/*
Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
*/

SELECT COUNT(*) AS likes
FROM vk.likes
WHERE user_id IN (
    SELECT user_id
    FROM vk.profiles
    WHERE (
                  (YEAR(CURRENT_DATE) - YEAR(birthday)) -
                  (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d'))
              ) < 10
);