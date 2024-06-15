-- NYC PAYROLL DATA 


SELECT count(*) FROM atharva.payroll;
SELECT * FROM atharva.payroll;


-- count the no of employees working in diffrent locations

select work_location_borough , count(work_location_borough) from atharva.payroll
group by work_location_borough;

-- count the no of employees working in specific roles

select title_description , count(title_description) as position from atharva.payroll
group by title_description
order by position desc;


-- find the top 10 full name of employees with the highest base salary and their position who are currently working

select concat(first_name , " " , mid_init , " " , last_name) as fullname , title_description , base_salary from atharva.payroll
where leave_status_as_of_july_31 = "ACTIVE"
order by base_salary desc limit 10;

-- find the top 10 full name of employees with the lowest base salary and their position who are currently working

select concat(first_name , " " , mid_init , " " , last_name) as fullname , title_description , base_salary from atharva.payroll
where leave_status_as_of_july_31 = "ACTIVE"
order by base_salary asc limit 10;


-- count of employees who are active , on leave nand ceased
select * from atharva.payroll;

select leave_status_as_of_july_31 , count(leave_status_as_of_july_31) as empcount from atharva.payroll
group by leave_status_as_of_july_31
order by empcount desc;

-- find the top 10 full name of employees with the highest base salary + regular and ot payment  and their position who are currently working

select concat(first_name , " " , mid_init , " " , last_name) as fullname , title_description , sum(base_salary + regular_gross_paid + total_ot_paid + total_other_pay) as earnings from atharva.payroll
where leave_status_as_of_july_31 = "ACTIVE"
GROUP BY 
    fullname, 
    title_description
order by earnings desc limit 10;


-- find the most worked active employees of the company
SELECT 
    CONCAT(first_name, " ", COALESCE(mid_init, ""), " ", last_name) AS fullname,
    MAX(agency_start_date) AS agency_start_date,
    TIMESTAMPDIFF(YEAR, MAX(agency_start_date), CURDATE()) AS work_duration_years
FROM 
    atharva.payroll
WHERE 
    leave_status_as_of_july_31 = 'ACTIVE'
GROUP BY fullname
ORDER BY work_duration_years DESC
LIMIT 10;




