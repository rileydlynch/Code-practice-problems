SELECT company.company_code,founder,count(distinct Lead_Manager.lead_manager_code),count(distinct Senior_Manager.senior_manager_code),
count(distinct Manager.manager_code),count(distinct Employee.employee_code) from Company
inner join Lead_Manager on Company.company_code = Lead_Manager.company_code
inner join Senior_Manager on Senior_Manager.company_code = Company.company_code
inner join Manager on Manager.company_code = Company.company_code
inner join Employee on Employee.company_code = Company.company_code
group by company.company_code,founder;
