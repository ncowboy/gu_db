/*
Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с
нашим пользователем.
 */

/* user id = 20*/

SELECT from_user_id, COUNT(*) AS messages
FROM vk.messages
WHERE to_user_id = 20
  AND from_user_id IN (
    SELECT initiator_user_id
    FROM vk.friend_requests
    WHERE status LIKE 'approved'
      AND target_user_id = 20)
GROUP BY from_user_id
ORDER BY messages DESC
LIMIT 1;