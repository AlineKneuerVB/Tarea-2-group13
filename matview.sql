CREATE MATERIALIZED VIEW mv_verified_reviews AS
SELECT DISTINCT
    r.user_id,
    r.book_id,
    r.review_date
FROM reviews r
WHERE EXISTS (
    SELECT 1
    FROM orders o
    JOIN order_items oi
        ON oi.order_id = o.order_id
    WHERE o.user_id = r.user_id
      AND oi.book_id = r.book_id
);

