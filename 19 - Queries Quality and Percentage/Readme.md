# [1211. Queries Quality and Percentage](https://leetcode.com/problems/queries-quality-and-percentage/description/?envType=study-plan-v2&envId=top-sql-50)

Table: <code>Queries</code>

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+
This table may have duplicate rows.
This table contains information collected from some queries on a database.
The <code>position</code> column has a value from **1**  to **500** .
The <code>rating</code> column has a value from **1**  to **5** . Query with <code>rating</code> less than 3 is a poor query.
```

We define query <code>quality</code> as:

<blockquote>
The average of the ratio between query rating and its position.
</blockquote>

We also define <code>poor query percentage</code> as:

<blockquote>
The percentage of all queries with rating less than 3.
</blockquote>

Write a solution to find each <code>query_name</code>, the <code>quality</code> and <code>poor_query_percentage</code>.

Both <code>quality</code> and <code>poor_query_percentage</code> should be **rounded to 2 decimal places** .

Return the result table in **any order** .

Theresult format is in the following example.

**Example 1:** 

```
Input: 
Queries table:
+------------+-------------------+----------+--------+
| query_name | result            | position | rating |
+------------+-------------------+----------+--------+
| Dog        | Golden Retriever  | 1        | 5      |
| Dog        | German Shepherd   | 2        | 5      |
| Dog        | Mule              | 200      | 1      |
| Cat        | Shirazi           | 5        | 2      |
| Cat        | Siamese           | 3        | 3      |
| Cat        | Sphynx            | 7        | 4      |
+------------+-------------------+----------+--------+
Output: 
+------------+---------+-----------------------+
| query_name | quality | poor_query_percentage |
+------------+---------+-----------------------+
| Dog        | 2.50    | 33.33                 |
| Cat        | 0.66    | 33.33                 |
+------------+---------+-----------------------+
Explanation: 
Dog queries quality is ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50
Dog queries poor_ query_percentage is (1 / 3) * 100 = 33.33

Cat queries quality equals ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66
Cat queries poor_ query_percentage is (1 / 3) * 100 = 33.33
```
