-- Пользователи
INSERT INTO users (name, email, registration_date) 
VALUES 
    ('Алексей Иванов', 'alex@test.ru', '2023-01-10'),
    ('Ольга Петрова', 'olga@test.ru', '2023-02-15');

-- Заказы
INSERT INTO orders (user_id, order_date, amount)
VALUES
    (1, '2023-05-01 14:30:00', 2500.00),
    (2, '2023-05-02 10:15:00', 5000.00);