CREATE DATABASE IF NOT EXISTS upi_intelligence;
USE upi_intelligence;
DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (Transaction_ID VARCHAR(20) PRIMARY KEY, Transaction_Date DATE, Transaction_Time TIME, State VARCHAR(50), City VARCHAR(50), Transaction_Type VARCHAR(30), Merchant_Category VARCHAR(50), Payment_App VARCHAR(50), Bank VARCHAR(80), Amount DECIMAL(14,2), Status VARCHAR(20), Device_Type VARCHAR(20), Customer_Age INT, Customer_Gender VARCHAR(20), Risk_Score INT, Risk_Flag VARCHAR(20), Fraud_Type VARCHAR(50), Transaction_Channel VARCHAR(30), Month VARCHAR(7), Transaction_Hour INT, Transaction_Size VARCHAR(20));
