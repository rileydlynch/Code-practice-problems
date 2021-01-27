/*

URL: https://www.hackerrank.com/challenges/placements/problem

Students contains two columns: ID and Name.
Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend).
Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

The name output, when ordered by the salary offered to their friends, will be:

    Samantha
    Julia
    Scarlet

*/

select
case when FriendSalary.salary > StudentSalary.salary then StudentSalary.name end
from (select name, students.id, salary from friends inner join packages on packages.id = friend_id inner join students on students.id = friends.id) FriendSalary
inner join (select name, students.id, salary from students inner join packages on packages.id = students.id) StudentSalary on FriendSalary.id = StudentSalary.id
where (case when FriendSalary.salary > StudentSalary.salary then StudentSalary.name end) is not null
order by FriendSalary.salary asc;