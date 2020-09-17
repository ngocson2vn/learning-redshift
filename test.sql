CREATE SCHEMA test;
SET search_path TO test;

CREATE TABLE account (
  id INT,
  full_name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE
);

CREATE TABLE account_history (
  id INT,
  search_key TEXT NOT NULL,
  search_date DATE NOT NULL
);

INSERT INTO account VALUES
(1, 'Mickey Mouse', 'mickey@gmail.com'),
(null, 'Tom Cat', 'tom@gmail.com'),
(null, 'Jerry Mouse', 'jerry@gmail.com'),
(4, 'Yosemite Sam', 'yosemite@gmail.com');

INSERT INTO account_history VALUES
(1, 'Meat', '2020-03-30 09:57:43'),
(null, 'Mouse', '2020-03-29 09:57:43'),
(3, 'Fish', '2020-03-29 09:57:43'),
(4, 'Sausage', '2020-03-28 09:57:43');


-------------------------------------------
SELECT * 
FROM account a
LEFT JOIN account_history h ON a.id = h.id