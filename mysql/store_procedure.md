
```
DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `rateData`(IN `agentId` INT(10)) 
BEGIN 
	SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY','')); 
   select count(*) as counts,rate, MONTH(create_date) as month, YEAR(create_date) as year, yearweek(`create_date`) AS week, str_to_date(concat(yearweek(`create_date`), ' monday'), '%X%V %W') as `date`, is_paid from agent_rates WHERE user_id = agentId group by yearweek(`create_date`); 
END$$ 
DELIMITER ;
```


```
DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `rateDataAdmin`() 
BEGIN 
   select count(*) as counts,rate,user_id, 
   MONTH(create_date) as month, 
   YEAR(create_date) as year, 
   week(`create_date`) AS week, 
   str_to_date(concat(yearweek(`create_date`), ' monday'), '%X%V %W') as `date` 
   from agent_rates  group by user_id, yearweek(`create_date`); 
END$$ 
DELIMITER ;
```
