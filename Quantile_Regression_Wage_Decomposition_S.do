
cd "F:\Hard_Drive_Toshiba\Wage_paper\wage_gap"
use wage_estimates_61,clear
replace lambda_1=0 if SRG_2!=1
replace lambda_2=0 if SRG_2!=2
replace lambda_3=0 if SRG_2!=3
replace lambda_4=0 if SRG_2!=4
replace lambda_5=0 if SRG_2!=5


gen SC_ST=1 if SRG_2==1
replace SC_ST=0 if SRG_2==3	


gen OBC=1 if SRG_2==2
replace OBC=0 if SRG_2==3	


gen Muslim=1 if SRG_2==4
replace Muslim=0 if SRG_2==3	


gen OthMin=1 if SRG_2==5
replace OthMin=0 if SRG_2==3	
*******************************************************
use wage_estimates_61,clear
sort SRG_2
sum real_wages_2011  if SRG_2==1 , detail
gen STSC99=r(p99)
gen STSC90=r(p90)
gen STSC75=r(p75)
gen STSC50=r(p50)
gen STSC25=r(p25)
gen STSC10=r(p10)
sum real_wages_2011  if SRG_2==2 , detail
gen OBC99=r(p99)
gen OBC90=r(p90)
gen OBC75=r(p75)
gen OBC50=r(p50)
gen OBC25=r(p25)
gen OBC10=r(p10)
sum real_wages_2011  if SRG_2==3 , detail
gen HOT99=r(p99)
gen HOT90=r(p90)
gen HOT75=r(p75)
gen HOT50=r(p50)
gen HOT25=r(p25)
gen HOT10=r(p10)
sum real_wages_2011  if SRG_2==4 , detail
gen MOB99=r(p99)
gen MOB90=r(p90)
gen MOB75=r(p75)
gen MOB50=r(p50)
gen MOB25=r(p25)
gen MOB10=r(p10)
sum real_wages_2011  if SRG_2==5 , detail
gen OTM99=r(p99)
gen OTM90=r(p90)
gen OTM75=r(p75)
gen OTM50=r(p50)
gen OTM25=r(p25)
gen OTM10=r(p10)
tabstat STSC99 STSC90 STSC75 STSC50 STSC25 STSC10 OBC99 OBC90 OBC75 OBC50 OBC25 /*
*/ OBC10 HOT99 HOT90 HOT75 HOT50 HOT25 HOT10 MOB99 MOB90 MOB75 MOB50 MOB25 MOB10 OTM99 OTM90 OTM75 OTM50 OTM25 OTM10

sum real_wages_2011   , detail
gen All99=r(p99)
gen All90=r(p90)
gen All75=r(p75)
gen All50=r(p50)
gen All25=r(p25)
gen All10=r(p10)

gen quant_5=1 if real_wages_2011<=All10
replace quant_5=2 if real_wages_2011>All10 & real_wages_2011<=All25
replace quant_5=3 if real_wages_2011>All25 & real_wages_2011<=All50
replace quant_5=4 if real_wages_2011>All50 & real_wages_2011<=All75
replace quant_5=5 if real_wages_2011>All75 & real_wages_2011<=All90
replace quant_5=6 if real_wages_2011>All90 

twoway scatter STSC90 quant_5 if quant_5==5 ||  scatter STSC75 quant_5 if quant_5==4|| scatter STSC50 quant_5 if quant_5==3|| scatter STSC25 quant_5 if quant_5==2|| scatter STSC10 quant_5 if quant_5==1 /*
*/ || scatter OBC90 quant_5 if quant_5==5 || scatter OBC75 quant_5 if quant_5==4|| scatter OBC50 quant_5 if quant_5==3|| scatter OBC25 quant_5 if quant_5==2|| scatter OBC10 quant_5 if quant_5==1 /*
*/ || scatter HOT90 quant_5 if quant_5==5 || scatter HOT75 quant_5 if quant_5==4|| scatter HOT50 quant_5 if quant_5==3|| scatter HOT25 quant_5 if quant_5==2|| scatter HOT10 quant_5 if quant_5==1 /*
*/ || scatter MOB90 quant_5 if quant_5==5 || scatter MOB75 quant_5 if quant_5==4|| scatter MOB50 quant_5 if quant_5==3|| scatter MOB25 quant_5 if quant_5==2|| scatter MOB10 quant_5 if quant_5==1 /*
*/ || scatter OTM90 quant_5 if quant_5==5 || scatter OTM75 quant_5 if quant_5==4|| scatter OTM50 quant_5 if quant_5==3|| scatter OTM25 quant_5 if quant_5==2|| scatter OTM10 quant_5 if quant_5==1


twoway scatter STSC90 quant_5 if quant_5==5 ||  scatter STSC75 quant_5 if quant_5==4|| scatter STSC50 quant_5 if quant_5==3|| scatter STSC25 quant_5 if quant_5==2|| scatter STSC10 quant_5 if quant_5==1 /*
*/ || scatter HOT90 quant_5 if quant_5==5 || scatter HOT75 quant_5 if quant_5==4|| scatter HOT50 quant_5 if quant_5==3|| scatter HOT25 quant_5 if quant_5==2|| scatter HOT10 quant_5 if quant_5==1
*****************************************************************************************************************************
 *****Average Wages across quantiles
 gen    all_wages_q=STSC99  if _n==1
replace all_wages_q=OBC99 if _n==2
replace all_wages_q=HOT99 if _n==3
replace all_wages_q=MOB99  if _n==4
replace all_wages_q=OTM99 if _n==5
 
 
replace all_wages_q=STSC90  if _n==6
replace all_wages_q=OBC90 if _n==7
replace all_wages_q=HOT90 if _n==8
replace all_wages_q=MOB90  if _n==9
replace all_wages_q=OTM90 if _n==10

replace all_wages_q=STSC75  if _n==11
replace all_wages_q=OBC75 if _n==12
replace all_wages_q=HOT75 if _n==13
replace all_wages_q=MOB75  if _n==14
replace all_wages_q=OTM75 if _n==15

replace all_wages_q=STSC50  if _n==16
replace all_wages_q=OBC50 if _n==17
replace all_wages_q=HOT50 if _n==18
replace all_wages_q=MOB50  if _n==19
replace all_wages_q=OTM50 if _n==20

replace all_wages_q=STSC25  if _n==21
replace all_wages_q=OBC25 if _n==22
replace all_wages_q=HOT25 if _n==23
replace all_wages_q=MOB25 if _n==24
replace all_wages_q=OTM25 if _n==25


replace all_wages_q=STSC10  if _n==26
replace all_wages_q=OBC10 if _n==27
replace all_wages_q=HOT10 if _n==28
replace all_wages_q=MOB10  if _n==29
replace all_wages_q=OTM10 if _n==30


gen quant_6=6 if  _n>=1 & _n<=5
replace quant_6=5 if  _n>=6 & _n<=10
replace quant_6=4 if  _n>=11 & _n<=15
replace quant_6=3 if  _n>=16 & _n<=20
replace quant_6=2 if  _n>=21 & _n<=25 
replace quant_6=1 if  _n>=26 & _n<=30

gen SRC_1=1 if _n==1 | _n==6 | _n==11 | _n==16 | _n==21   | _n==26
replace SRC_1=2 if _n==2 | _n==7 | _n==12 | _n==17 | _n==22  | _n==27  
replace SRC_1=3 if _n==3 | _n==8 | _n==13 | _n==18 | _n==23 | _n==28  
replace SRC_1=4 if _n==4 | _n==9 | _n==14 | _n==19 | _n==24 | _n==29   
replace SRC_1=5 if _n==5 | _n==10 | _n==15 | _n==20 | _n==25 | _n==30   

twoway scatter (all_wages_q   SRC_1 ) if quant_6==1 || scatter (all_wages_q   SRC_1 ) if quant_6==2 || /*
*/ scatter (all_wages_q   SRC_1 ) if quant_6==3 || scatter (all_wages_q   SRC_1 ) if quant_6==4 || /*
*/ scatter ( all_wages_q   SRC_1 ) if quant_6==5 || scatter ( all_wages_q   SRC_1 ) if quant_6==6



**************Use from Here***********
kdensity ln_real_wages_2011 [aweight=multiply] if SC_ST==0  & religion_recode!=0 & real_wages_2011>lowest_1 & real_wages_2011<highest_1 & week_acty_dummy!=., gen(evalHoth densHoth) width(0.10) nograph
kdensity ln_real_wages_2011 [aweight=multiply] if SC_ST==1  & religion_recode!=0 & real_wages_2011>lowest_1 & real_wages_2011<highest_1 & week_acty_dummy!=., gen(evalSCST densSCST) width(0.10) nograph
set scheme s1color
label var evalHoth "Log(wage)"
label var evalSCST "Log(wage)"
graph twoway  (connected densSCST evalSCST, msymbol(i) lpattern(dash) clwidth(medium) lc(red) )  /*
   */   (connected densHoth  evalHoth, msymbol(i) lpattern(longdash) clwidth(medium) lc(blue) )  /*
   */   , ytitle("Density")ylabel(0.0 0.2 0.4 0.6 0.8 1.0) /*
   */   xlabel(1 2 3 4 5 6 7 8)  /* 
   */   legend(pos(7) col(2) lab(1 "SCST")  lab(2 "H Others")    /*
   */   region(lstyle(none)) symxsize(8) keygap(1) textwidth(34) ) 
***************************K-Density graph without generating variables********
**Graph_2005_2
twoway (kdensity ln_real_wages_2011 ) (kdensity ln_real_wages_2011  if  SRG_2==1 ) (kdensity /* 
*/ ln_real_wages_2011  if  SRG_2==2 ) (kdensity ln_real_wages_2011  if  SRG_2==3 ) (kdensity /*
*/ ln_real_wages_2011  if  SRG_2==4 ) (kdensity ln_real_wages_2011  if  SRG_2==5 ) , ytitle( /*
*/ "K-Density") xtitle("Log Real Wages") title("2005") graphregion(color(white)) xlabel(2(1)8) /*
 */ ytitle("Density")ylabel(0.0 0.2 0.4 0.6 0.8) /* 
   */  legend(pos(7) col(3) lab(1 "All Wage Workers") lab(2 "SC/ST")  lab(3 "OBC") /*
   */ lab(4 "H Other") lab(5 "Muslim")   lab(6 "Other Min.")  /*
   */   region(lstyle(none)) keygap(1) textwidth(34)) 

*******************************Quantile Regression******************************************
********************Run from here: Final Model**************
xi: sqreg log_daily_wages i.gen_edr1 exp exp2 i.Sex i.SRC i.Sector i.marital_dummy i.week_acty_dummy  i.SRG_2 if SRG_2!=. & discr_1!=1  & age>=21 & age<=60  & week_acty >=31 & ups_acty>=31 & acty_srlno_1==1 & real_wages_18_19>=Outl_L & real_wages_18_19<=Outl_H & gen_edr1!=. & exp!=. & Sex!=. & SRC!=. & Sector!=. & marital_dummy!=. & week_acty_dummy!=.,  quantile(.1 .3 .5 .7 .9) 
grqreg _ISRG_2_1, ci save(ab)

sqreg log_daily_wages i.gen_edr1 exp exp2 i.Sex i.SRC i.Sector i.marital_dummy i.week_acty_dummy  i.SRG_2 if SRG_2!=. & discr_1!=1  & age>=21 & age<=60  & week_acty >=31 & ups_acty>=31 & acty_srlno_1==1 & real_wages_18_19>=Outl_L & real_wages_18_19<=Outl_H & gen_edr1!=. & exp!=. & Sex!=. & SRC!=. & Sector!=. & marital_dummy!=. & week_acty_dummy!=.,  quantile(.1 .3 .5 .7 .9)


xi: sqreg log_daily_wages i.gen_edr1 exp exp2 i.Sex i.SRC i.Sector i.marital_dummy i.week_acty_dummy  i.SRG_2 if SRG_2!=. & discr_1!=1  & age>=21 & age<=60  & week_acty >=31 & ups_acty>=31 & acty_srlno_1==1 & real_wages_18_19>=Outl_L & real_wages_18_19<=Outl_H & gen_edr1!=. & exp!=. & Sex!=. & SRC!=. & Sector!=. & marital_dummy!=. & week_acty_dummy!=.,  quantile(.1 .3 .5 .7 .9)
grqreg __ISRG_2_3, ci save(cd)

use ab,clear
graph twoway (rcap _IiSRG_2_2_cihi _ISRG_2_2_cilo qtile)  (connected _ISRG_2_2 qtile, msize(small)) || (rcap _ISRG_2_3_cihi _ISRG_2_3_cilo qtile)  (connected _ISRG_2_3 qtile, msize(small)), xlabel(0.1 0.3 0.5 0.7 0.9) xtitle("Quantile") yline(0) ytitle("Log Wage Gap") title("2005") graphregion(color(white)) yscale(titlegap(*5)) legend()

**********************************************************************
* compute RIF for the 10th, 50th and 90th quantiles for SC_ST and Hindu;
foreach  qt in 10 25 50 75 90 99{	
   gen rif_`qt'=.
}
pctile eval1=ln_real_wages_2011 if SC_ST==1 , nq(100) 
kdensity ln_real_wages_2011 if SC_ST==1, at(eval1) gen(evalSC_ST_A densSC_ST_A) width(0.10) nograph
foreach  qt in 10 25 50 75 90 99 {	
 local qc = `qt'/100.0
 replace rif_`qt'=evalSC_ST_A[`qt']+`qc'/densSC_ST_A[`qt'] if ln_real_wages_2011>=evalSC_ST_A[`qt'] & SC_ST==1
 replace rif_`qt'=evalSC_ST_A[`qt']-(1-`qc')/densSC_ST_A[`qt'] if ln_real_wages_2011<evalSC_ST_A[`qt'] & SC_ST==1
}
pctile eval2=ln_real_wages_2011 if SC_ST==0 , nq(100) 
kdensity ln_real_wages_2011 if SC_ST==0, at(eval2) gen(evalHoth_A densHoth_A) width(0.10) nograph
foreach  qt in 10 25 50 75 90 99{	
 local qc = `qt'/100.0
 replace rif_`qt'=evalHoth_A[`qt']+`qc'/densHoth_A[`qt'] if ln_real_wages_2011>=evalHoth_A[`qt'] & SC_ST==0
 replace rif_`qt'=evalHoth_A[`qt']-(1-`qc')/densHoth_A[`qt'] if ln_real_wages_2011<evalHoth_A[`qt'] & SC_ST==0
}
 sort SC_ST
by SC_ST: sum rif_10 rif_25 rif_50 rif_75 rif_90 rif_99

****************Run this*************
***rif_10******
oaxaca rif_10 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_1 lambda_3 , by(SC_ST) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_1 lambda_3) relax
est store STSC_10
***rif_50******
oaxaca rif_50 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_1 lambda_3 , by(SC_ST) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_1 lambda_3) relax
est store STSC_50

***rif_75******
oaxaca rif_75 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_1 lambda_3 , by(SC_ST) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_1 lambda_3) relax 
est store STSC_75

***rif_90******
oaxaca rif_90 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_1 lambda_3, by(SC_ST) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_1 lambda_3) relax
est store STSC_90

***rif_99******
oaxaca rif_99 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_1 lambda_3, by(SC_ST) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_1 lambda_3) relax
est store STSC_99

esttab   STSC_10 STSC_50 STSC_75 STSC_90 STSC_99 ,label append b(a4 %9.4f)  se(4)  /*
*/ nostar nogaps  ar2  not

********************************************************************************************************************************

* compute RIF for the 10th, 50th and 90th quantiles for OBC and Hindu;
pctile eval3=ln_real_wages_2011 if OBC==1 , nq(100) 
kdensity ln_real_wages_2011 if OBC==1, at(eval3) gen(evalOBC_A densOBC_A) width(0.10) nograph
foreach  qt in 10 25 50 75 90 99{	
 local qc = `qt'/100.0
 replace rif_`qt'=evalOBC_A[`qt']+`qc'/densOBC_A[`qt'] if ln_real_wages_2011>=evalOBC_A[`qt'] & OBC==1
 replace rif_`qt'=evalOBC_A[`qt']-(1-`qc')/densOBC_A[`qt'] if ln_real_wages_2011<evalOBC_A[`qt'] & OBC==1
}

 sort OBC
by OBC: sum rif_10 rif_25 rif_50 rif_75 rif_90 rif_99


***rif_10******
oaxaca rif_10 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_2 lambda_3 , by(OBC) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_2 lambda_3) relax
est store OBC_10
***rif_50******
oaxaca rif_50 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_2 lambda_3 , by(OBC) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_2 lambda_3) relax
est store OBC_50
***rif_75******
oaxaca rif_75 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_2 lambda_3 , by(OBC) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_2 lambda_3) relax 
est store OBC_75
***rif_90******
oaxaca rif_90 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_2 lambda_3, by(OBC) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_2 lambda_3) relax
est store OBC_90
***rif_99******
oaxaca rif_99 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_2 lambda_3, by(SOBC) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_2 lambda_3) relax
est store OBC_99

esttab   OBC_10 OBC_50 OBC_75 OBC_90 OBC_99 ,label append b(a4 %9.4f)  se(4)  /*
*/ star(* 0.10 ** 0.05 *** 0.01) nogaps  ar2  not
********************************************************************************************************************************

* compute RIF for the 10th, 50th and 90th quantiles for Muslims and Hindu;
pctile eval4=ln_real_wages_2011 if Muslim==1 , nq(100) 
kdensity ln_real_wages_2011 if Muslim==1, at(eval4) gen(evalMuslim_A densMuslim_A) width(0.10) nograph
foreach  qt in 10 25 50 75 90 99{	
 local qc = `qt'/100.0
 replace rif_`qt'=evalMuslim_A[`qt']+`qc'/densMuslim_A[`qt'] if ln_real_wages_2011>=evalMuslim_A[`qt'] & Muslim==1
 replace rif_`qt'=evalMuslim_A[`qt']-(1-`qc')/densMuslim_A[`qt'] if ln_real_wages_2011<evalMuslim_A[`qt'] & Muslim==1
}

 sort Muslim
by Muslim: sum rif_10 rif_25 rif_50 rif_75 rif_90 rif_99


***rif_10******
oaxaca rif_10 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_4 lambda_3 , by(Muslim) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_4 lambda_3) relax
est store Muslim_10
***rif_50******
oaxaca rif_50 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_4 lambda_3 , by(Muslim) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_4 lambda_3) relax
est store Muslim_50
***rif_75******
oaxaca rif_75 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_4 lambda_3 , by(Muslim) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_4 lambda_3) relax 
est store Muslim_75
***rif_90******
oaxaca rif_90 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_4 lambda_3, by(Muslim) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_4 lambda_3) relax
est store Muslim_90
***rif_99******
oaxaca rif_99 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_4 lambda_3, by(Muslim) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_4 lambda_3) relax
est store Muslim_99

esttab   Muslim_10 Muslim_50 Muslim_75 Muslim_90 Muslim_99 ,label append b(a4 %9.4f)  se(4)  /*
*/ star(* 0.10 ** 0.05 *** 0.01) nogaps  ar2  not
********************************************************************************************************************************

* compute RIF for the 10th, 50th and 90th quantiles for OthMin and Hindu;
pctile eval5=ln_real_wages_2011 if OthMin==1 , nq(100) 
kdensity ln_real_wages_2011 if OthMin==1, at(eval5) gen(evalOthMin_A densOthMin_A) width(0.10) nograph
foreach  qt in 10 25 50 75 90 99 {	
 local qc = `qt'/100.0
 replace rif_`qt'=evalOthMin_A[`qt']+`qc'/densOthMin_A[`qt'] if ln_real_wages_2011>=evalOthMin_A[`qt'] & OthMin==1
 replace rif_`qt'=evalOthMin_A[`qt']-(1-`qc')/densOthMin_A[`qt'] if ln_real_wages_2011<evalOthMin_A[`qt'] & OthMin==1
}

 sort OthMin
by OthMin: sum rif_10 rif_25 rif_50 rif_75 rif_90 rif_99


***rif_10******
oaxaca rif_10 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_5 lambda_3 , by(OthMin) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_5 lambda_3) relax
est store OthMin_10
***rif_50******
oaxaca rif_50 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_5 lambda_3 , by(OthMin) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_5 lambda_3) relax
est store OthMin_50
***rif_75******
oaxaca rif_75 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_5 lambda_3 , by(OthMin) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_5 lambda_3) relax 
est store OthMin_75
***rif_90******
oaxaca rif_90 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_5 lambda_3, by(OthMin) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_5 lambda_3) relax
est store OthMin_90
***rif_99******
oaxaca rif_99 age age_2 normalize(ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6) /*
*/  normalize( sector_dum1  sector_dum2) normalize(marital_dum1  marital_dum2) /*
*/normalize(industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15) /*
*/ normalize(sex_dum1 sex_dum2) lambda_5 lambda_3, by(OthMin) weight(1)  detail(groupdem:age age_2 sex_dum1 sex_dum2 sector_dum1 sector_dum2 marital_dum1 marital_dum2, grouped:ed_dum1 ed_dum2 ed_dum3 ed_dum4 ed_dum5 ed_dum6, groupind:industry_name_11  industry_name_12 industry_name_13 industry_name_14 industry_name_15, groupselect:lambda_5 lambda_3) relax
est store OthMin_99

esttab   OthMin_10 OthMin_50 OthMin_75 OthMin_90 OthMin_99 ,label append b(a4 %9.4f)  se(4)  /*
*/ star(* 0.10 ** 0.05 *** 0.01) nogaps  ar2  not
***********************************************************************************************************************************
***********************************************************************************************************************************


