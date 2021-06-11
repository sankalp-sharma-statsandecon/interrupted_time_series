# interrupted_time_series
Testing the role of a new drug on patients' adherence to psychiatric medications

Plan G is a PharmaCare plan that provides free access to select psychiatric and opioid agonist medications. You have been asked to test the effect that Plan G has on patient outcomes. One of the effects we’d expect from Plan G is that it will improve adherence to medication regimes (if cost is a barrier to accessing medications then removing this barrier should improve adherence). 

Excel workbook (Interrupted time series.xlsx) contains two sheets. The sheet labelled ‘adherence’ contains the following information
•	SRV_YR: Year 
•	SRV_Month: Month 
•	ID: Patient ID
•	FULL_ADHERENCE: Dummy variable = 1 if ADHERENCE_RATIO >= 80%
•	ADHERENCE_RATIO: ADHERENT_DAYS/ TOTAL_DAYS
•	TOTAL_DAYS: Number of days a patient should have taken medication in the month
•	ADHERE_DAYS: Number of days a patient used medication in a month 
•	MISSING_DAYS: TOTAL_DAYS – ADHERE_DAYS

The sheet labeled ‘switch date’ contains 
•	ID: Patient ID
•	G START: The year and month the patient switched to plan G. All prior observations can be assumed to be from Plan I (Fair PharmaCare).

