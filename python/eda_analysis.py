import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]; DATA=ROOT/'dataset/upi_transactions_100k.csv'; OUT=ROOT/'python/outputs'; OUT.mkdir(exist_ok=True)
df=pd.read_csv(DATA); df['Transaction_Date']=pd.to_datetime(df['Transaction_Date'])
print('Rows:',len(df)); print('\nRisk distribution:\n',df['Risk_Flag'].value_counts())
df['Risk_Flag'].value_counts().reindex(['Low','Medium','High']).plot(kind='bar'); plt.title('Synthetic Risk Distribution'); plt.tight_layout(); plt.savefig(OUT/'risk_distribution.png'); plt.close()
monthly=df.groupby(df['Transaction_Date'].dt.to_period('M')).size(); monthly.plot(kind='line',marker='o'); plt.title('Monthly Transaction Volume'); plt.tight_layout(); plt.savefig(OUT/'monthly_transactions.png'); plt.close()
hourly=df.groupby('Transaction_Hour')['Risk_Flag'].apply(lambda s:(s=='High').sum()); hourly.plot(kind='bar'); plt.title('High-Risk Transactions by Hour'); plt.tight_layout(); plt.savefig(OUT/'high_risk_by_hour.png'); plt.close()
print('Charts saved to',OUT)
