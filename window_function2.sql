SELECT
  advertisement_date
FROM advertisement

SELECT
  advertisement_date,
  row_number() OVER(PARTITION BY date_trunc('month', advertisement_date)) AS month_order_number
FROM advertisement

SELECT
  advertisement_date,
  row_number() OVER(PARTITION BY date_trunc('month', advertisement_date) ORDER BY advertisement_date) AS month_order_number
FROM advertisement

SELECT
  advertisement_date,
  row_number() OVER(PARTITION BY date_trunc('month', advertisement_date) ORDER BY advertisement_date) AS month_order_number,
  row_number() OVER(PARTITION BY date_trunc('month', advertisement_date) ORDER BY advertisement_date DESC) AS month_order_number_desc
FROM advertisement

SELECT
  advertisement_date,
  row_number() OVER(PARTITION BY date_trunc('month', advertisement_date)) AS month_order_number,
  row_number() OVER(PARTITION BY date_trunc('year', advertisement_date)) AS year_order_number
FROM advertisement

SELECT
  advertisement_date,
  row_number() OVER(PARTITION BY date_trunc('month', advertisement_date) ORDER BY advertisement_date) AS month_order_number,
  row_number() OVER(PARTITION BY date_trunc('year', advertisement_date) ORDER BY advertisement_date) AS year_order_number
FROM advertisement

SELECT
  advertisement_date,
  row_number() OVER(PARTITION BY date_trunc('month', advertisement_date) ORDER BY advertisement_date) AS month_order_number,
  row_number() OVER(PARTITION BY date_trunc('year', advertisement_date) ORDER BY advertisement_date DESC) AS year_order_number
FROM advertisement

SELECT
  advertisement_date,
  row_number() OVER(PARTITION BY date_trunc('month', advertisement_date) ORDER BY advertisement_date) AS month_order_number,
  row_number() OVER(PARTITION BY date_trunc('year', advertisement_date) ORDER BY advertisement_date DESC) AS year_order_number
FROM advertisement
