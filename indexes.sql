CREATE INDEX idx_orders_date_order_user
ON orders (order_date, order_id, user_id);

CREATE INDEX idx_reviews_book_date
ON reviews (book_id, review_date DESC);

CREATE INDEX idx_users_lower_email
ON users ((lower(email)));

CREATE INDEX idx_books_genre_year_price
ON books (genre, publication_year DESC, price);

