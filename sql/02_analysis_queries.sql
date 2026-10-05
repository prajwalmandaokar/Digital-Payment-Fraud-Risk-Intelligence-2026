USE upi_intelligence;
SELECT COUNT(*) AS total_transactions FROM transactions;
SELECT ROUND(SUM(Amount),2) AS total_value FROM transactions;
SELECT ROUND(AVG(Amount),2) AS average_value FROM transactions;
SELECT Status,COUNT(*) transactions,ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM transactions),2) pct FROM transactions GROUP BY Status ORDER BY transactions DESC;
SELECT Risk_Flag,COUNT(*) transactions,ROUND(AVG(Risk_Score),2) avg_risk_score FROM transactions GROUP BY Risk_Flag ORDER BY FIELD(Risk_Flag,'High','Medium','Low');
SELECT State,COUNT(*) high_risk_transactions,ROUND(SUM(Amount),2) high_risk_value FROM transactions WHERE Risk_Flag='High' GROUP BY State ORDER BY high_risk_transactions DESC;
SELECT Payment_App,COUNT(*) high_risk_transactions,ROUND(AVG(Risk_Score),2) avg_risk FROM transactions WHERE Risk_Flag='High' GROUP BY Payment_App ORDER BY high_risk_transactions DESC;
SELECT Device_Type,Risk_Flag,COUNT(*) transactions FROM transactions GROUP BY Device_Type,Risk_Flag ORDER BY Device_Type,transactions DESC;
SELECT Transaction_Type,COUNT(*) transactions,ROUND(AVG(Amount),2) avg_amount,SUM(Risk_Flag='High') high_risk FROM transactions GROUP BY Transaction_Type ORDER BY high_risk DESC;
SELECT Transaction_Hour,COUNT(*) transactions,SUM(Risk_Flag='High') high_risk FROM transactions GROUP BY Transaction_Hour ORDER BY Transaction_Hour;
SELECT Month,COUNT(*) transactions,ROUND(SUM(Amount),2) total_value,SUM(Risk_Flag='High') high_risk FROM transactions GROUP BY Month ORDER BY Month;
SELECT City,State,COUNT(*) high_risk FROM transactions WHERE Risk_Flag='High' GROUP BY City,State ORDER BY high_risk DESC LIMIT 10;
SELECT Bank,COUNT(*) high_risk,ROUND(SUM(Amount),2) value FROM transactions WHERE Risk_Flag='High' GROUP BY Bank ORDER BY high_risk DESC LIMIT 10;
SELECT Fraud_Type,COUNT(*) records,ROUND(SUM(Amount),2) value FROM transactions WHERE Fraud_Type<>'None' GROUP BY Fraud_Type ORDER BY records DESC;
SELECT ROUND(AVG(Amount),2) avg_high_risk_amount FROM transactions WHERE Risk_Flag='High';
SELECT COUNT(*) failed_high_risk FROM transactions WHERE Status='Failed' AND Risk_Flag='High';
SELECT CASE WHEN Customer_Age BETWEEN 18 AND 25 THEN '18-25' WHEN Customer_Age BETWEEN 26 AND 35 THEN '26-35' WHEN Customer_Age BETWEEN 36 AND 45 THEN '36-45' WHEN Customer_Age BETWEEN 46 AND 55 THEN '46-55' ELSE '56-70' END age_band,COUNT(*) transactions,SUM(Risk_Flag='High') high_risk FROM transactions GROUP BY age_band ORDER BY age_band;
SELECT 
    Transaction_Channel,
    COUNT(*) transactions,
    SUM(Risk_Flag = 'High') high_risk,
    ROUND(SUM(Risk_Flag = 'High') * 100.0 / COUNT(*),
            2) high_risk_pct
FROM
    transactions
GROUP BY Transaction_Channel
ORDER BY high_risk_pct DESC;


-- total transactions------->100000
SELECT COUNT(*) AS total_transactions
FROM transactions;

-- total transaction values------->31506407.04
SELECT ROUND(SUM(Amount),2) AS total_value
FROM transactions;

-- Risk distribution
SELECT
    Risk_Flag,
    COUNT(*) AS transactions
FROM transactions
GROUP BY Risk_Flag;

-- High-risk transactions by state
SELECT
    State,
    COUNT(*) AS high_risk_transactions
FROM transactions
WHERE Risk_Flag = 'High'
GROUP BY State
ORDER BY high_risk_transactions DESC;
















