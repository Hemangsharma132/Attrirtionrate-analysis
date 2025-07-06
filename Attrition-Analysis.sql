
# What is the total number of employees who left vs stayed?
SELECT Attrition, COUNT(*) AS TotalEmployees 
FROM HR_Analytics 
GROUP BY Attrition;

# How many employees left in each department?
SELECT Department, COUNT(*) AS LeftEmployees 
FROM HR_Analytics 
WHERE Attrition = 'Yes' 
GROUP BY Department;

# What is the average monthly income for employees who left vs stayed?
SELECT Attrition, AVG(MonthlyIncome) AS AvgIncome 
FROM HR_Analytics 
GROUP BY Attrition;

# What is the attrition rate by gender?
SELECT Gender, 
       ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS AttritionRate
FROM HR_Analytics
GROUP BY Gender;

# How does overtime affect attrition?
SELECT OverTime, 
       COUNT(*) AS Total, 
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS LeftCount
FROM HR_Analytics
GROUP BY OverTime;

# Which job role has the highest number of employees who left?
SELECT JobRole, COUNT(*) AS LeftEmployees
FROM HR_Analytics
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY LeftEmployees DESC
LIMIT 1;

# What is the attrition rate by marital status?
SELECT MaritalStatus,
       ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS AttritionRate
FROM HR_Analytics
GROUP BY MaritalStatus;

# How many employees left from each education field?
SELECT EducationField, COUNT(*) AS LeftEmployees
FROM HR_Analytics
WHERE Attrition = 'Yes'
GROUP BY EducationField;

# What is the average total working years of employees who left?
SELECT AVG(TotalWorkingYears) AS AvgYearsWorked 
FROM HR_Analytics 
WHERE Attrition = 'Yes';

# Which business travel type is most associated with attrition?
SELECT BusinessTravel, COUNT(*) AS LeftEmployees
FROM HR_Analytics
WHERE Attrition = 'Yes'
GROUP BY BusinessTravel
ORDER BY LeftEmployees DESC
LIMIT 5;


# How does attrition vary across age groups and departments?
SELECT AgeGroup, Department, COUNT(*) AS LeftCount
FROM HR_Analytics
WHERE Attrition = 'Yes'
GROUP BY AgeGroup, Department;

# What is the income variation (average and standard deviation) between employees who left and those who stayed?
SELECT Attrition, AVG(MonthlyIncome) AS AvgIncome, STDDEV(MonthlyIncome) AS IncomeVariation
FROM HR_Analytics
GROUP BY Attrition;

# What is the relationship between overtime, years since last promotion, and attrition?
SELECT OverTime, YearsSinceLastPromotion, COUNT(*) AS CountLeft
FROM HR_Analytics
WHERE Attrition = 'Yes'
GROUP BY OverTime, YearsSinceLastPromotion
ORDER BY CountLeft DESC;

# Which three job roles have the highest attrition rates?
SELECT JobRole,
       ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS AttritionRate
FROM HR_Analytics
GROUP BY JobRole
ORDER BY AttritionRate DESC
LIMIT 3;

# What is the rank of employee performance within each attrition group using window functions?
SELECT EmployeeNumber, Attrition, PerformanceRating,
       RANK() OVER(PARTITION BY Attrition ORDER BY PerformanceRating DESC) AS PerformanceRank
FROM HR_Analytics;

