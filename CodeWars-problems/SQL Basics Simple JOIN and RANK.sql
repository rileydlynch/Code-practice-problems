--URL: https://www.codewars.com/kata/58094559c47d323ebd000035/
-- Problem description
/* For this challenge you need to create a simple SELECT statement that will return all columns from the people table, and join to the sales table so that you can return the COUNT of all sales and RANK each person by their sale_count.

people table schema
    id
    name

sales table schema
    id
    people_id
    sale
    price

You should return all people fields as well as the sale count as "sale_count" and the rank as "sale_rank". */

--My solution
select people.id,name,
count(sales.id) sale_count,
rank() over(order by count(sales.id) desc) sale_rank from people --End columns
inner join sales on sales.people_id = people.id
group by people.id
order by sale_count desc; 
