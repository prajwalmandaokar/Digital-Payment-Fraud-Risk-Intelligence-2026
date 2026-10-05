import streamlit as st
import pandas as pd
from pathlib import Path
st.set_page_config(page_title='Digital Payment Fraud & Risk Intelligence',layout='wide')
ROOT=Path(__file__).resolve().parents[1]; df=pd.read_csv(ROOT/'dataset/upi_transactions_100k.csv'); df['Transaction_Date']=pd.to_datetime(df['Transaction_Date'])
st.title('💳 Digital Payment Fraud & Risk Intelligence'); st.caption('Synthetic portfolio dataset. Risk/anomaly labels are rule-based and are not real fraud statistics.')
c1,c2,c3=st.columns(3)
with c1: states=st.multiselect('State',sorted(df.State.unique()))
with c2: risks=st.multiselect('Risk Flag',['Low','Medium','High'],default=['Low','Medium','High'])
with c3: apps=st.multiselect('Payment App',sorted(df.Payment_App.unique()))
f=df[df.Risk_Flag.isin(risks)].copy()
if states: f=f[f.State.isin(states)]
if apps: f=f[f.Payment_App.isin(apps)]
k1,k2,k3,k4=st.columns(4); k1.metric('Transactions',f'{len(f):,}'); k2.metric('Transaction Value',f"₹{f.Amount.sum():,.0f}"); k3.metric('High Risk',f"{(f.Risk_Flag=='High').sum():,}"); k4.metric('High Risk %',f"{(f.Risk_Flag=='High').mean()*100:.2f}%" if len(f) else '0.00%')
a,b=st.columns(2)
with a: st.subheader('Risk Distribution'); st.bar_chart(f.Risk_Flag.value_counts())
with b: st.subheader('High-Risk by State'); st.bar_chart(f[f.Risk_Flag=='High'].groupby('State').size().sort_values(ascending=False).head(10))
st.subheader('High-Risk by Hour'); st.line_chart(f.groupby('Transaction_Hour').size())
st.subheader('Synthetic Anomaly Types'); st.bar_chart(f[f.Fraud_Type!='None'].Fraud_Type.value_counts())
st.subheader('Sample Records'); st.dataframe(f.head(100),use_container_width=True)
