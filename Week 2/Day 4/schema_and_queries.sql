
-- This is the schema of one of my recent projects which i've built as my hobby project in second year. 
-- This app introduces a budgeting feature called Spending Pockets on top of a standard E-Wallet app.
-- More details about the project are on Github: https://github.com/umairsanai/Clearcash
-- The project is deployed on: https://clearcash-orpin.vercel.app/
-- It may take some time to load, as it's a free service :)


CREATE TYPE COLOR_TYPE AS ENUM('RED', 'GREEN', 'ORANGE', 'YELLOW', 'BLUE', 'PURPLE', 'DARKGREEN', 'MAROON', 'PINK', 'BLACK', 'WHITE');

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(12) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    password_changed_at BIGINT DEFAULT 0 CHECK(password_changed_at >= 0),
    created_at DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE pockets (
    pocket_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
    pocket_name VARCHAR(30) NOT NULL,
    pocket_balance INT NOT NULL CHECK(pocket_balance >= 0) DEFAULT 0,
    pocket_limit INT NOT NULL CHECK(pocket_limit >= 0 AND pocket_balance <= pocket_limit),
    color COLOR_TYPE NOT NULL -- for-css-style
);

CREATE TABLE transactions (
    transaction_id BIGSERIAL PRIMARY KEY,
    sender_user_id INT NOT NULL REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
    recipient_user_id INT NOT NULL REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
    sender_pocket_id INT NOT NULL REFERENCES pockets(pocket_id) ON UPDATE CASCADE ON DELETE CASCADE,
    amount INT NOT NULL CHECK(amount >= 0),
    transaction_date DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE notifications (
    notification_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
    message VARCHAR(255) NOT NULL,
    is_read SMALLINT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);




-- SOME QUERIES USED IN THE APP
-- We have to fill the values in the square brackets []

-- Get the user's details for Authentication
SELECT user_id, name, email, username, password_changed_at FROM users WHERE email=[EMAIL_ID] AND username=[USERNAME];

-- Read all the notifications
UPDATE notifications SET is_read = 1 WHERE user_id = [USER_ID] RETURNING notification_id, message, is_read, created_at;

-- Get all current month transactions
SELECT 
    transaction_date::TEXT, 
    CASE WHEN transactions.sender_user_id=$1 THEN pocket_name ELSE 'Main' END AS pocket_name, 
    CASE WHEN transactions.sender_user_id=$1 THEN -amount ELSE amount END AS transaction_amount, 
    CASE 
        WHEN transactions.sender_user_id=$1 THEN CONCAT('Send Money to ', recipient.name) 
        ELSE CONCAT('Received Money from ', sender.name) 
    END AS transaction_message 
FROM transactions 
INNER JOIN users recipient ON recipient.user_id = transactions.recipient_user_id 
INNER JOIN users sender ON sender.user_id = transactions.sender_user_id 
INNER JOIN pockets ON pockets.pocket_id=transactions.sender_pocket_id 
WHERE (transactions.sender_user_id=$1 OR transactions.recipient_user_id=$1) 
  AND DATE_TRUNC('month', transactions.transaction_date)::DATE = DATE_TRUNC('month', CURRENT_DATE)::DATE 
ORDER BY transactions.transaction_date DESC, 
         transactions.transaction_id DESC;
