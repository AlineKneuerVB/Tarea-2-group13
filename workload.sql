-- Workload for group 13.
-- 100 queries sampled from 12 classes (Q01..Q12).
-- Each query is tagged with its class and an instance index so the
-- runner can aggregate timings by class.
--
-- You may add CREATE INDEX statements to speed these queries up.
-- For the materialization step, you may rewrite individual queries
-- to consume a MATERIALIZED VIEW you create -- but the rewritten
-- query MUST return the same result for the same parameters.

-- ===== 001 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'Pablo.espinoza38593@mail.com';

-- ===== 002 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'science'
  AND price BETWEEN 10 AND 25
  AND publication_year >= 2020
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 003 =====
SELECT review_id, user_id, rating, review_text, review_date
FROM reviews
WHERE book_id = 2051
ORDER BY review_date DESC LIMIT 20;

-- ===== 004 =====
SELECT review_id, user_id, rating, review_text, review_date
FROM reviews
WHERE book_id = 24618
ORDER BY review_date DESC LIMIT 20;

-- ===== 005 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'alice.xu76707@example.org';

-- ===== 006 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'poetry'
  AND price BETWEEN 10 AND 40
  AND publication_year >= 2021
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 007 =====
SELECT order_id, user_id, order_date, total_amount
FROM orders
WHERE order_date >= '2025-03-01' AND order_date < '2025-04-01'
ORDER BY order_date DESC LIMIT 50;

-- ===== 008 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'daniel.moreno39805@example.org';

-- ===== 009 =====
SELECT user_id, is_premium
FROM users
WHERE LOWER(email) = LOWER('LUCA.WAGNER113239@SHOP.NET');

-- ===== 010 =====
SELECT b.book_id, b.title, SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN books b        ON b.book_id   = oi.book_id
WHERE o.order_date >= '2025-07-01' AND o.order_date < '2025-08-01'
GROUP BY b.book_id, b.title
ORDER BY revenue DESC LIMIT 10;

-- ===== 011 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'maya.tanaka106423@books.io';

-- ===== 012 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'thriller'
  AND price BETWEEN 20 AND 40
  AND publication_year >= 2022
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 013 =====
SELECT DISTINCT r.user_id, r.book_id
FROM reviews r
WHERE EXISTS (
    SELECT 1 FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE o.user_id = r.user_id AND oi.book_id = r.book_id
)
  AND r.review_date >= '2026-12-01' AND r.review_date < '2027-01-01';

-- ===== 014 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'ines.kowalski159001@books.io';

-- ===== 015 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'bianca.brooks144073@mail.com';

-- ===== 016 =====
SELECT DISTINCT r.user_id, r.book_id
FROM reviews r
WHERE EXISTS (
    SELECT 1 FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE o.user_id = r.user_id AND oi.book_id = r.book_id
)
  AND r.review_date >= '2026-01-01' AND r.review_date < '2026-02-01';

-- ===== 017 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'maya.quiroga88762@mail.com';

-- ===== 018 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'ben.ferreira163128@shop.net';

-- ===== 019 =====
SELECT user_id, is_premium
FROM users
WHERE LOWER(email) = LOWER('GRETA.UEDA158555@SHOP.NET');

-- ===== 020 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'jonas.moreno65776@mail.com';

-- ===== 021 =====
SELECT order_id, user_id, order_date, total_amount
FROM orders
WHERE order_date >= '2025-05-01' AND order_date < '2025-06-01'
ORDER BY order_date DESC LIMIT 50;

-- ===== 022 =====
SELECT book_id, title, price
FROM books
WHERE title LIKE 'Golde%'
ORDER BY title LIMIT 25;

-- ===== 023 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'cyrus.espinoza112055@shop.net';

-- ===== 024 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'biography'
  AND price BETWEEN 15 AND 50
  AND publication_year >= 2018
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 025 =====
UPDATE inventory
SET stock_count = stock_count - 1, last_updated = CURRENT_TIMESTAMP
WHERE book_id = 23806 AND warehouse_id = 1;

-- ===== 026 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'zara.petrov3936@mail.com';

-- ===== 027 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'mystery'
  AND price BETWEEN 20 AND 40
  AND publication_year >= 2018
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 028 =====
SELECT user_id, is_premium
FROM users
WHERE LOWER(email) = LOWER('FARID.ZHANG175849@MAIL.COM');

-- ===== 029 =====
SELECT user_id, is_premium
FROM users
WHERE LOWER(email) = LOWER('YUSUF.SILVA158190@BOOKS.IO');

-- ===== 030 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'Eero.silva198159@mail.com';

-- ===== 031 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'uma.wagner49823@example.org';

-- ===== 032 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'xiomara.hassan187069@mail.com';

-- ===== 033 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'children'
  AND price BETWEEN 5 AND 50
  AND publication_year >= 2020
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 034 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'reference'
  AND price BETWEEN 5 AND 50
  AND publication_year >= 2020
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 035 =====
SELECT order_id, user_id, order_date, total_amount
FROM orders
WHERE order_date >= '2024-07-01' AND order_date < '2024-08-01'
ORDER BY order_date DESC LIMIT 50;

-- ===== 036 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'science'
  AND price BETWEEN 10 AND 40
  AND publication_year >= 2021
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 037 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'carla.okafor85130@mail.com';

-- ===== 038 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'elena.ferreira150218@mail.com';

-- ===== 039 =====
UPDATE inventory
SET stock_count = stock_count - 1, last_updated = CURRENT_TIMESTAMP
WHERE book_id = 29397 AND warehouse_id = 4;

-- ===== 040 =====
SELECT book_id, title, price
FROM books
WHERE title LIKE 'Sudde%'
ORDER BY title LIMIT 25;

-- ===== 041 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'jonas.davidson133765@shop.net';

-- ===== 042 =====
SELECT review_id, user_id, rating, review_text, review_date
FROM reviews
WHERE book_id = 29207
ORDER BY review_date DESC LIMIT 20;

-- ===== 043 =====
SELECT b.book_id, b.title, SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN books b        ON b.book_id   = oi.book_id
WHERE o.order_date >= '2023-08-01' AND o.order_date < '2023-09-01'
GROUP BY b.book_id, b.title
ORDER BY revenue DESC LIMIT 10;

-- ===== 044 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'bianca.alvarez21176@mail.com';

-- ===== 045 =====
SELECT o.order_id, o.user_id, o.order_date, o.total_amount
FROM orders o
JOIN users u ON u.user_id = o.user_id
WHERE u.is_premium = TRUE
  AND o.order_date >= '2023-03-22' AND o.order_date < '2023-03-29'
ORDER BY o.order_date DESC;

-- ===== 046 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'farid.larsen44055@shop.net';

-- ===== 047 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'dania.petrov179557@example.org';

-- ===== 048 =====
UPDATE inventory
SET stock_count = stock_count - 1, last_updated = CURRENT_TIMESTAMP
WHERE book_id = 1962 AND warehouse_id = 7;

-- ===== 049 =====
SELECT DISTINCT r.user_id, r.book_id
FROM reviews r
WHERE EXISTS (
    SELECT 1 FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE o.user_id = r.user_id AND oi.book_id = r.book_id
)
  AND r.review_date >= '2025-03-01' AND r.review_date < '2025-04-01';

-- ===== 050 =====
SELECT order_id, user_id, order_date, total_amount
FROM orders
WHERE order_date >= '2023-11-01' AND order_date < '2023-12-01'
ORDER BY order_date DESC LIMIT 50;

-- ===== 051 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'jonas.ivanov157269@example.org';

-- ===== 052 =====
SELECT COUNT(*) FROM (
    SELECT book_id FROM reviews
    GROUP BY book_id
    HAVING COUNT(*) >= 10 AND AVG(rating) > 4.0
) sub;

-- ===== 053 =====
UPDATE inventory
SET stock_count = stock_count - 1, last_updated = CURRENT_TIMESTAMP
WHERE book_id = 9530 AND warehouse_id = 2;

-- ===== 054 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'poetry'
  AND price BETWEEN 5 AND 50
  AND publication_year >= 2022
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 055 =====
SELECT DISTINCT r.user_id, r.book_id
FROM reviews r
WHERE EXISTS (
    SELECT 1 FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE o.user_id = r.user_id AND oi.book_id = r.book_id
)
  AND r.review_date >= '2025-12-01' AND r.review_date < '2026-01-01';

-- ===== 056 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'fiction'
  AND price BETWEEN 10 AND 30
  AND publication_year >= 2018
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 057 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'alice.moreno4597@example.org';

-- ===== 058 =====
SELECT review_id, user_id, rating, review_text, review_date
FROM reviews
WHERE book_id = 18444
ORDER BY review_date DESC LIMIT 20;

-- ===== 059 =====
SELECT order_id, user_id, order_date, total_amount
FROM orders
WHERE order_date >= '2023-05-01' AND order_date < '2023-06-01'
ORDER BY order_date DESC LIMIT 50;

-- ===== 060 =====
SELECT order_id, user_id, order_date, total_amount
FROM orders
WHERE order_date >= '2026-09-01' AND order_date < '2026-10-01'
ORDER BY order_date DESC LIMIT 50;

-- ===== 061 =====
SELECT book_id, title, price
FROM books
WHERE title LIKE 'Dream%'
ORDER BY title LIMIT 25;

-- ===== 062 =====
SELECT o.order_id, o.user_id, o.order_date, o.total_amount
FROM orders o
JOIN users u ON u.user_id = o.user_id
WHERE u.is_premium = TRUE
  AND o.order_date >= '2026-06-08' AND o.order_date < '2026-06-15'
ORDER BY o.order_date DESC;

-- ===== 063 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'Maya.moreno158606@mail.com';

-- ===== 064 =====
SELECT review_id, user_id, rating, review_text, review_date
FROM reviews
WHERE book_id = 23653
ORDER BY review_date DESC LIMIT 20;

-- ===== 065 =====
SELECT order_id, user_id, order_date, total_amount
FROM orders
WHERE order_date >= '2024-08-01' AND order_date < '2024-09-01'
ORDER BY order_date DESC LIMIT 50;

-- ===== 066 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'zara.LARSEN38767@books.io';

-- ===== 067 =====
SELECT COUNT(*) FROM (
    SELECT book_id FROM reviews
    GROUP BY book_id
    HAVING COUNT(*) >= 10 AND AVG(rating) > 4.0
) sub;

-- ===== 068 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'alice.xu33838@shop.net';

-- ===== 069 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'Kiri.xu116962@example.org';

-- ===== 070 =====
UPDATE inventory
SET stock_count = stock_count - 1, last_updated = CURRENT_TIMESTAMP
WHERE book_id = 13949 AND warehouse_id = 1;

-- ===== 071 =====
SELECT book_id, title, price
FROM books
WHERE title LIKE 'The P%'
ORDER BY title LIMIT 25;

-- ===== 072 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'pablo.wagner159187@mail.com';

-- ===== 073 =====
SELECT order_id, user_id, order_date, total_amount
FROM orders
WHERE order_date >= '2024-09-01' AND order_date < '2024-10-01'
ORDER BY order_date DESC LIMIT 50;

-- ===== 074 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'cyrus.moreno138140@mail.com';

-- ===== 075 =====
SELECT book_id, title, price
FROM books
WHERE title LIKE 'Mount%'
ORDER BY title LIMIT 25;

-- ===== 076 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'reference'
  AND price BETWEEN 20 AND 30
  AND publication_year >= 2020
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 077 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'alice.larsen46041@books.io';

-- ===== 078 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'luca.yamamoto160816@mail.com';

-- ===== 079 =====
UPDATE inventory
SET stock_count = stock_count - 1, last_updated = CURRENT_TIMESTAMP
WHERE book_id = 16346 AND warehouse_id = 5;

-- ===== 080 =====
SELECT user_id, is_premium
FROM users
WHERE LOWER(email) = LOWER('LUCA.KOWALSKI142604@SHOP.NET');

-- ===== 081 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'mystery'
  AND price BETWEEN 15 AND 40
  AND publication_year >= 2018
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 082 =====
SELECT book_id, title, price
FROM books
WHERE title LIKE 'Winte%'
ORDER BY title LIMIT 25;

-- ===== 083 =====
SELECT user_id, is_premium
FROM users
WHERE LOWER(email) = LOWER('QUINCY.VARGAS75571@EXAMPLE.ORG');

-- ===== 084 =====
SELECT b.book_id, b.title, SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN books b        ON b.book_id   = oi.book_id
WHERE o.order_date >= '2024-12-01' AND o.order_date < '2025-01-01'
GROUP BY b.book_id, b.title
ORDER BY revenue DESC LIMIT 10;

-- ===== 085 =====
SELECT b.book_id, b.title, SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN books b        ON b.book_id   = oi.book_id
WHERE o.order_date >= '2023-02-01' AND o.order_date < '2023-03-01'
GROUP BY b.book_id, b.title
ORDER BY revenue DESC LIMIT 10;

-- ===== 086 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'history'
  AND price BETWEEN 5 AND 30
  AND publication_year >= 2022
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 087 =====
SELECT review_id, user_id, rating, review_text, review_date
FROM reviews
WHERE book_id = 11494
ORDER BY review_date DESC LIMIT 20;

-- ===== 088 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'Farid.alvarez102745@example.org';

-- ===== 089 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'pablo.vargas34757@shop.net';

-- ===== 090 =====
SELECT order_id, user_id, order_date, total_amount
FROM orders
WHERE order_date >= '2026-03-01' AND order_date < '2026-04-01'
ORDER BY order_date DESC LIMIT 50;

-- ===== 091 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'Fatima.yamamoto99993@mail.com';

-- ===== 092 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'tara.davidson20541@example.org';

-- ===== 093 =====
SELECT DISTINCT r.user_id, r.book_id
FROM reviews r
WHERE EXISTS (
    SELECT 1 FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    WHERE o.user_id = r.user_id AND oi.book_id = r.book_id
)
  AND r.review_date >= '2026-08-01' AND r.review_date < '2026-09-01';

-- ===== 094 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'fatima.silva198336@example.org';

-- ===== 095 =====
SELECT user_id, is_premium, country
FROM users
WHERE email = 'Fatima.larsen35568@books.io';

-- ===== 096 =====
UPDATE inventory
SET stock_count = stock_count - 1, last_updated = CURRENT_TIMESTAMP
WHERE book_id = 5416 AND warehouse_id = 1;

-- ===== 097 =====
SELECT user_id, is_premium
FROM users
WHERE LOWER(email) = LOWER('TARA.OKAFOR11343@BOOKS.IO');

-- ===== 098 =====
SELECT book_id, title, price, publication_year
FROM books
WHERE genre = 'biography'
  AND price BETWEEN 10 AND 50
  AND publication_year >= 2022
ORDER BY publication_year DESC, price ASC LIMIT 50;

-- ===== 099 =====
SELECT COUNT(*) FROM (
    SELECT book_id FROM reviews
    GROUP BY book_id
    HAVING COUNT(*) >= 10 AND AVG(rating) > 4.0
) sub;

-- ===== 100 =====
SELECT user_id, is_premium
FROM users
WHERE LOWER(email) = LOWER('CARLA.ROSSI78929@MAIL.COM');
