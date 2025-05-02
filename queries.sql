-- 1. Общее количество пользователей
SELECT COUNT(*) AS total_users FROM users;

-- 2. Сумма заказов по пользователям
SELECT 
    u.name,
    SUM(o.amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.name;