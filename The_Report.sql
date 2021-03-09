SELECT case when (case when marks between grades.min_mark and grades.max_mark then grades.grade end) < 8 then NULL else NAME end as Name,
case when marks between grades.min_mark and grades.max_mark then grades.grade end as Grade,
Marks as Mark from students,grades
where case when marks between grades.min_mark and grades.max_mark then grades.grade end IS NOT NULL
order by Grade desc,name asc;
