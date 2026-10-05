# Step-by-Step From Scratch

1. Install MySQL Server + Workbench, Power BI Desktop, VS Code, and Python (optional).
2. Extract ZIP to a simple folder such as C:\Users\<your-name>\Desktop\DigitalPaymentFraudRisk.
3. Open the folder in VS Code.
4. Inspect dataset/upi_transactions_100k.csv; it contains 100,000 synthetic rows.
5. MySQL Workbench -> open sql/01_schema.sql -> execute -> refresh Schemas -> upi_intelligence -> Tables -> transactions.
6. Right-click transactions -> Table Data Import Wizard -> select dataset/upi_transactions_100k.csv -> import.
7. Verify with SELECT COUNT(*) FROM transactions; expected 100000.
8. Run sql/02_analysis_queries.sql one query at a time.
9. Power BI -> Home -> Get Data -> MySQL database -> localhost -> upi_intelligence -> Import -> transactions -> Load.
10. If MySQL connector reports a missing dependency, install Oracle MySQL Connector/NET, restart Power BI, and reconnect.
11. Create DAX measures from powerbi/DAX_Measures.txt.
12. Build the five pages from powerbi/PowerBI_Dashboard_Guide.md.
13. Validate Power BI KPIs against MySQL.
14. Optional Python EDA: python -m pip install -r python/requirements.txt then python python/eda_analysis.py.
15. Optional Streamlit demo: python -m pip install -r app/requirements.txt then python -m streamlit run app/app.py, or double-click app/run_app.bat.
16. GitHub: git init; git add .; git commit -m "Initial digital payment fraud risk intelligence project"; git branch -M main; git remote add origin YOUR_REPO_URL; git push -u origin main.
