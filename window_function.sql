-------------------------------------------------------------------------------
/* Query 1 */
-------------------------------------------------------------------------------

WITH monthly_data AS (
  SELECT date_trunc('month', advertisement_date) AS temporal, count(*) as cnt_month
  FROM advertisement
  GROUP BY temporal
  ORDER BY temporal
)
SELECT
  *
FROM monthly_data;

/*
Results

+------------------------+-------------+
| temporal               | cnt_month   |
|------------------------+-------------|
| 2014-01-01 00:00:00+00 | 42          |
| 2014-02-01 00:00:00+00 | 49          |
| 2014-03-01 00:00:00+00 | 30          |
| 2014-04-01 00:00:00+00 | 57          |
| 2014-05-01 00:00:00+00 | 106         |
| 2014-06-01 00:00:00+00 | 103         |
| 2014-07-01 00:00:00+00 | 69          |
| 2014-08-01 00:00:00+00 | 70          |
| 2014-09-01 00:00:00+00 | 82          |
| 2014-10-01 00:00:00+00 | 46          |
| 2014-11-01 00:00:00+00 | 36          |
| 2014-12-01 00:00:00+00 | 37          |
| 2015-01-01 00:00:00+00 | 48          |
| 2015-02-01 00:00:00+00 | 9           |
+------------------------+-------------+

*/


-------------------------------------------------------------------------------
/* Query 2 */
-------------------------------------------------------------------------------

WITH monthly_data AS (
  SELECT date_trunc('month', advertisement_date) AS temporal, count(*) as cnt_month
  FROM advertisement
  GROUP BY temporal
  ORDER BY temporal
)
SELECT 
  to_char(temporal, 'YYYY-MM') as month, 
  cnt_month
FROM monthly_data
ORDER BY month;

/* 
Results

+---------+-------------+
| month   | cnt_month   |
|---------+-------------|
| 2014-01 | 42          |
| 2014-02 | 49          |
| 2014-03 | 30          |
| 2014-04 | 57          |
| 2014-05 | 106         |
| 2014-06 | 103         |
| 2014-07 | 69          |
| 2014-08 | 70          |
| 2014-09 | 82          |
| 2014-10 | 46          |
| 2014-11 | 36          |
| 2014-12 | 37          |
| 2015-01 | 48          |
| 2015-02 | 9           |
+---------+-------------+

*/


-------------------------------------------------------------------------------
/* Query 3 */
-------------------------------------------------------------------------------

WITH monthly_data AS (
  SELECT date_trunc('month', advertisement_date) AS temporal, count(*) as cnt_month
  FROM advertisement
  GROUP BY temporal
  ORDER BY temporal
)
SELECT 
  to_char(temporal, 'YYYY-MM') as month, 
  cnt_month,
  sum(cnt_month) OVER(PARTITION BY date_trunc('year', temporal)) AS cnt_year
FROM monthly_data
ORDER BY month;

/* 
Results 

+---------+-------------+------------+
| month   | cnt_month   | cnt_year   |
|---------+-------------+------------|
| 2014-01 | 42          | 727        |
| 2014-02 | 49          | 727        |
| 2014-03 | 30          | 727        |
| 2014-04 | 57          | 727        |
| 2014-05 | 106         | 727        |
| 2014-06 | 103         | 727        |
| 2014-07 | 69          | 727        |
| 2014-08 | 70          | 727        |
| 2014-09 | 82          | 727        |
| 2014-10 | 46          | 727        |
| 2014-11 | 36          | 727        |
| 2014-12 | 37          | 727        |
| 2015-01 | 48          | 57         |
| 2015-02 | 9           | 57         |
+---------+-------------+------------+

*/

/*
Confirmation

  42 + 49 + 30 + 57 + 106 + 103 + 69 + 70 + 82 + 46 + 36 + 37 = 727
  48 + 9 = 57

*/


-------------------------------------------------------------------------------
/* Query 4 */
-------------------------------------------------------------------------------

WITH monthly_data AS (
  SELECT date_trunc('month', advertisement_date) AS temporal, count(*) as cnt_month
  FROM advertisement
  GROUP BY temporal
  ORDER BY temporal
)
SELECT 
  to_char(temporal, 'YYYY-MM') as month, 
  cnt_month,
  sum(cnt_month) OVER(PARTITION BY date_trunc('year', temporal) ORDER BY temporal ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS cnt_year
FROM monthly_data
ORDER BY month;

/* 
Results 

+---------+-------------+------------+
| month   | cnt_month   | cnt_year   |
|---------+-------------+------------|
| 2014-01 | 42          | 91         |
| 2014-02 | 49          | 121        |
| 2014-03 | 30          | 136        |
| 2014-04 | 57          | 193        |
| 2014-05 | 106         | 266        |
| 2014-06 | 103         | 278        |
| 2014-07 | 69          | 242        |
| 2014-08 | 70          | 221        |
| 2014-09 | 82          | 198        |
| 2014-10 | 46          | 164        |
| 2014-11 | 36          | 119        |
| 2014-12 | 37          | 73         |
| 2015-01 | 48          | 57         |
| 2015-02 | 9           | 57         |
+---------+-------------+------------+

*/

/*
Confirmation

  Record 1
    42 + 49 = 91 (correct)

  Record 2
    42 + 49 + 30 = 121 (correct)

  Record 3
    49 + 30 + 57 = 136 (correct)

*/


