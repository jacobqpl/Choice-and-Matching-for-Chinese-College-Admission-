* chongqing wechat articles

clear
cd "C:\Users\jacob\Desktop\新文件\"

* 2020-07-10 如何预测2020年重庆文科考生要考多少分才能读重庆大学的法学专业?

/*
	// 2019 重庆
	import excel using "重庆大学.xlsx", sheet("2019") clear first
	gen year=2019

	tempfile tmp
	save `tmp.dta', replace

	import excel using "重庆大学.xlsx", sheet("2018") clear first
	gen year=2018

	tempfile tmp1
	save `tmp1.dta', replace

	import excel using "重庆大学.xlsx", sheet("2017") clear first
	gen year=2017

	append using `tmp.dta'
	append using `tmp1.dta'
	
	keep year 省份 类别 科类 控制线 一本批录取线 专业 最低分 平均分

	save "重庆大学.dta", replace
*/

	use "重庆大学.dta", clear
	
	keep if 科类=="文史"
	
	gen diff=一本-控制线
	
	preserve
		use "一分一段表_16_19_clean.dta", clear
		keep if track==1	// 文科
		keep if prov=="重庆"
		
		keep gaokao ranking year
		tempfile tmp
		save `tmp.dta', replace
	restore 
	
	mmerge year 最低分 using `tmp.dta', t(n:1) umatch(year gaokao)
	keep if _merge==3
	drop _merge
	
	rename ranking 最低分位次
	
	split 专业, p("（" "(") gen(t)
	
	cap drop group
	egen group=group(t1)
	sort group
	
	* gen 2010
	preserve
		duplicates drop group, force
		keep group 专业
		gen year=2020
		tempfile tmp
		save `tmp.dta', replace
	restore 
	
	append using `tmp.dta'
	
	sort group year
	
	// 法学类专业
	preserve
		keep  if regexm(专业, "法学类")

		tw  (scatter 最低分位次 year) /// 
			(line  最低分位次 year, /// 
			xlabel(2017(1)2020) /// 
			ylabel(800(200)1400) /// 
			title("重庆大学文科法学类录取分") /// 
			xtitle("高考年份"))		
	restore 
	graph export "C:\Users\jacob\Desktop\新文件\Graph1.png", as(png) name("Graph")
	s
	preserve
		keep  if regexm(专业, "法学类")

		reg 最低分位次 year
		predict yhat
		
		tw  (scatter 最低分位次 year) /// 
			(line yhat year if year>=2019) /// 
			(line  yhat year, /// 
			xlabel(2017(1)2020) /// 
			ylabel(800(200)1400) /// 
			title("重庆大学文科法学类录取分") /// 
			xtitle("高考年份") /// 
			ytitle("最低分位次") /// 
			legend(cols(2) order(2 3) /// 
			label(2 "原始分") label(3 "预测值")))
	restore 	
	graph export "C:\Users\jacob\Desktop\新文件\Graph2.png", as(png) name("Graph")

	
	preserve
		gen year2=year*year
		gen year3=year2*year
	
		reg 最低分位次 c.year##i.group c.year2##i.group
		predict yhat
		sort group year
		
		reg 最低分位次 year##i.group
		predict yhat1	
		
		reg 最低分位次 i.year i.group
		predict yhat2
		
		cap drop N
		bysort group: gen N=_N
		tab N
		keep if N==4
		tab group
		
		tw  (line  yhat year if group==1, lcolor(gs14)) /// 
			(line  yhat year if group==2, lcolor(gs13)) /// 
			(line  yhat year if group==3, lcolor(gs12)) /// 
			(line  yhat year if group==8, lcolor(gs11)) /// 
			(line  yhat year if group==10, lcolor(navy) lw(medthick)) /// 
			(line  yhat1 year if group==10, lcolor(maroon) lw(medthick) lp(dash)) /// 			
			(line  yhat2 year if group==10, lcolor(blue)) /// 
			(line  yhat year if group==11, lcolor(gs10)) /// 
			(line  yhat year if group==13, lcolor(gs9) /// 
			xlabel(2017(1)2020) /// 
			ylabel(800(200)1400) /// 
						title("重庆大学文科各专业录取分") /// 
			xtitle("高考年份") /// 
			ytitle("最低分位次") /// 
			legend(order(5 6 7) label(5 "二次项模型") /// 
			label(6 "一次交互项模型") label(7 "一次项模型") cols(3) ))		
	restore 		
	graph export "C:\Users\jacob\Desktop\新文件\Graph3.png", as(png) name("Graph")
	
	// 800-1100；606-613分 in 2019
