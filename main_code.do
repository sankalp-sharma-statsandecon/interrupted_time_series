*Load data
import excel "econ_27_q2.xlsx", sheet("adherence") firstrow clear
ren *, lower
drop j k

*Create date
gen g_date = date(g_start,"YM")
format g_date %td
tostring srv_yr srv_mnth, replace
gen srv_yr_srv_mnth = srv_yr+"-"+srv_mnth
gen srv_date = date(srv_yr_srv_mnth,"YM")
format srv_date %td
*drop switch_date

*Create variables for estimation purposes
gen switch = 0
bysort id: replace switch = 1 if g_date <= srv_date
sort id srv_date switch
format id %20.0g
bysort id (srv_date): gen time_trend = _n


*Model
xtset id srv_date

*Logit model 
logit full_adherence time_trend switch c.time_trend#switch, or
	
*Two reg models
foreach i in adherence_ratio adhere_days {
	reg `i' time_trend switch c.time_trend#switch, vce(robust)
	}

*Create plot
use main, clear
collapse (mean) full_adherence (mean) adherence_ratio (mean) adhere_days, by (id switch_date)
twoway (scatter adherence_ratio i_date in 1/1000, sort mlabel(switch_date) msize(vtiny))
