@echo off
cd /d "%~dp0.."
python -m pip install -r app\requirements.txt
python -m streamlit run app\app.py
pause
