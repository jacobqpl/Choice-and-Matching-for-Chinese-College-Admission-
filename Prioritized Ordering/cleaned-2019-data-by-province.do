* Clean ksy data by province
* Created: 2020.07.09
* Updated: 2020.07.10
* Peilin Qiu

* Goal-1 同一招生单位，（1）录取名额(quota)求和；（2）多个录取志愿（一次、二次、降分、征集），保留优先级最高的一个观测值即可
* Goal-2 合并录取批次（征集），优先保留平行志愿分数，其次为征集，最后为降分投档


clear
cd "C:\Users\jacob\Desktop\Peilin Qiu"

	*-------------------------------------------------------------------------
	* 考试院数据特殊处理！
	* 每个省单独来
	* 高优先级省份： 云南、吉林、四川、宁夏、安徽江西、河北、河南、湖北、湖南、福建、贵州、辽宁、黑龙江
	*-------------------------------------------------------------------------
	
	**云南**已完成**
	global prov 云南
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N

          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,613      100.00      100.00
------------+-----------------------------------
      Total |      3,613      100.00


	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,613      100.00      100.00
------------+-----------------------------------
      Total |      3,613      100.00

	*加总quota
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		tab college prov if total_quota>2000

                      |    prov
              college |      云南 |     Total
----------------------+-----------+----------
 云南交通职业技术学院 |         1 |         1 
         云南农业大学 |         1 |         1 
         云南工商学院 |         1 |         1 
         云南师范大学 |         1 |         1 
 云南机电职业技术学院 |         1 |         1 
     云南经济管理学院 |         1 |         1 
 昆明冶金高等专科学校 |         1 |         1 
         昆明理工大学 |         1 |         1 
----------------------+-----------+----------
                Total |         8 |         8 

		
	save "clean-$prov.dta", clear
		
	
	**吉林**已完成**
	global prov 吉林
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N


          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,658      100.00      100.00
------------+-----------------------------------
      Total |      2,658      100.00



	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,650       99.70       99.70
          2 |          8        0.30      100.00
------------+-----------------------------------
      Total |      2,658      100.00

	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2			
	tab 批次
		
	replace 特殊类型=特殊类型+"/吉林B段" if regexm(批次, "B")	
		
		cap drop N1
		bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
		tab N1

         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,658      100.00      100.00
------------+-----------------------------------
      Total |      2,658      100.00
	
	
	*加总quota**没有quota值**
		tab quota in 1/10
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		tab college prov if total_quota>2000	

total_quota |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |      2,658      100.00      100.00
------------+-----------------------------------
      Total |      2,658      100.00
	
	save "clean-$prov.dta", clear

	
	**四川**已完成**
	global prov 四川
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N


          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      4,506      100.00      100.00
------------+-----------------------------------
      Total |      4,506      100.00


	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      4,506      100.00      100.00
------------+-----------------------------------
      Total |      4,506      100.00

	*加总quota**没有quota值**
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		tab college prov if total_quota>2000	  
	  
	save "clean-$prov.dta", clear
	
		
	**宁夏**已完成**
	global prov 宁夏
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N


          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      1,908      100.00      100.00
------------+-----------------------------------
      Total |      1,908      100.00


	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1

	
         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      1,908      100.00      100.00
------------+-----------------------------------
      Total |      1,908      100.00
	
	*加总quota
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		tab college prov if total_quota>1000
                      |    prov
              college |      宁夏 |     Total
----------------------+-----------+----------
             宁夏大学 |         1 |         1 
     宁夏大学新华学院 |         1 |         1 
----------------------+-----------+----------
                Total |         2 |         2 
	  
	  save "clean-$prov.dta", clear
		
	
	**安徽**已完成**
	global prov 安徽
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N


          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,940      100.00      100.00
------------+-----------------------------------
      Total |      3,940      100.00


	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1

	
         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,940      100.00      100.00
------------+-----------------------------------
      Total |      3,940      100.00
	
	*加总quota**no quota
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		tab college prov if total_quota>1000

total_quota |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |      3,940      100.00      100.00
------------+-----------------------------------
      Total |      3,940      100.00
	  
	  
	save "clean-$prov.dta", clear
	
	
	
	**江西**已完成**
	global prov 江西
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N


          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,527      100.00      100.00
------------+-----------------------------------
      Total |      3,527      100.00


	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,527      100.00      100.00
------------+-----------------------------------
      Total |      3,527      100.00

	 *加总quota**no quota
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		tab college prov if total_quota>2000

total_quota |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |      3,527      100.00      100.00
------------+-----------------------------------
      Total |      3,527      100.00
		
		
	save "clean-$prov.dta", clear	
	
	
	**河北**已完成-存在学校名称的问题**叶老师Check
	global prov 河北
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N

          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,663      100.00      100.00
------------+-----------------------------------
      Total |      3,663      100.00



	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,651       99.67       99.67
          2 |         12        0.33      100.00
------------+-----------------------------------
      Total |      3,663      100.00

	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2		
	tab 学校名称 if N1==2

                               学校名称 |      Freq.     Percent        Cum.
----------------------------------------+-----------------------------------
             大连理工大学(中日合作办学) |          1        8.33        8.33
       大连理工大学(中白俄罗斯合作办学) |          1        8.33       16.67
             武汉理工大学(中外合作办学) |          1        8.33       25.00
                 武汉理工大学(马赛学院) |          1        8.33       33.33
   河北工业职业技术学院(张家口市宣化区) |          2       16.67       50.00
         河北工业职业技术学院(石家庄市) |          2       16.67       66.67
             西南交通大学(中外合作办学) |          1        8.33       75.00
   西南交通大学(峨眉校区)(中外合作办学) |          1        8.33       83.33
                 黔东南民族职业技术学院 |          1        8.33       91.67
         黔东南民族职业技术学院(凯里市) |          1        8.33      100.00
----------------------------------------+-----------------------------------
                                  Total |         12      100.00
	
	*加总quota
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		tab college prov if total_quota>2000

total_quota |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |      3,663      100.00      100.00
------------+-----------------------------------
      Total |      3,663      100.00
		
		
	save "clean-$prov.dta", clear
		
	
	**河南**已完成-特殊类型没处理好导致信息丢失**叶老师Check
	global prov 河南
	use "tmp1.dta", clear

	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N
	

          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,726      100.00      100.00
------------+-----------------------------------
      Total |      2,726      100.00


	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,722       99.85       99.85
          2 |          4        0.15      100.00
------------+-----------------------------------
      Total |      2,726      100.00
	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2
	tab 学校名称 if N1==2

                               学校名称 |      Freq.     Percent        Cum.
----------------------------------------+-----------------------------------
           南阳师范学院（中外合作办学） |          2       50.00       50.00
 南阳师范学院（中外合作办学）（较高收.. |          2       50.00      100.00
----------------------------------------+-----------------------------------
                                  Total |          4      100.00
		 
		 
	*加总quota
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		
	save "clean-$prov.dta", clear	
	
	
	**湖北**intake_tier清理完毕，但是备注还是有问题，需要进一步修改**叶老师Check
	global prov 湖北
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N


          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      4,665      100.00      100.00
------------+-----------------------------------
      Total |      4,665      100.00


	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,383       51.08       51.08
          2 |      2,282       48.92      100.00
------------+-----------------------------------
      Total |      4,665      100.00

	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2		
	tab intake_tier

                          intake_tier |      Freq.     Percent        Cum.
--------------------------------------+-----------------------------------
                                   11 |      1,253       26.86       26.86
                                   12 |        755       16.18       43.04
                                    3 |        846       18.14       61.18
                                    4 |        113        2.42       63.60
                                    5 |      1,414       30.31       93.91
                                    6 |        284        6.09      100.00
--------------------------------------+-----------------------------------
                                Total |      4,665      100.00
	
		cap drop d_tmp
		gen d_tmp=0
		
		replace d_tmp=1 if intake_tier=="3"
		replace d_tmp=2 if intake_tier=="4"	
		replace d_tmp=3 if intake_tier=="5"
		replace d_tmp=4 if intake_tier=="6"
		replace d_tmp=5 if intake_tier=="11"
		replace d_tmp=6 if intake_tier=="12"
		
		bysort prov 学校代号 学校名称 track tier 特殊类型 campus: egen min1=min(d_tmp)
		
		keep if d_tmp==min1 
		
		cap drop N1
		bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
		tab N1

         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,518       99.66       99.66
          2 |         12        0.34      100.00
------------+-----------------------------------
      Total |      3,530      100.00
	  
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2	
	tab 备注 if N1==2

                                   备注 |      Freq.     Percent        Cum.
----------------------------------------+-----------------------------------
                  中外合作（高收费)专业 |          1        8.33        8.33
                                 普通类 |          6       50.00       58.33
       武汉理工（中法合作（马赛学院)类) |          1        8.33       66.67
             法商学院（烹调工艺与营养） |          2       16.67       83.33
             法商学院（烹饪与营养教育） |          2       16.67      100.00
----------------------------------------+-----------------------------------
                                  Total |         12      100.00
	
	*加总quota
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		tab college prov if total_quota>2000

total_quota |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |      3,530      100.00      100.00
------------+-----------------------------------
      Total |      3,530      100.00
		
		
	save "clean-$prov.dta", clear	
	

	**湖南**平行一志愿/征集志愿/第二次征集志愿**暂时不做这个**
	global prov 湖南
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N

          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      4,683      100.00      100.00
------------+-----------------------------------
      Total |      4,683      100.00


	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      1,957       41.79       41.79
          2 |      1,382       29.51       71.30
          3 |      1,344       28.70      100.00
------------+-----------------------------------
      Total |      4,683      100.00

	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2
		/*
		replace d_tmp=1 if 录取志愿=="平行志愿" | 录取志愿=="1志愿" | 录取志愿=="一志愿"
		replace d_tmp=2 if 录取志愿=="2志愿" 	 | 录取志愿=="二志愿"			
		replace d_tmp=3 if 录取志愿=="首次征集"
		replace d_tmp=4 if 录取志愿=="二次征集" 
		replace d_tmp=5 if 录取志愿=="三次征集1志愿" | 录取志愿=="征集1志愿"
		replace d_tmp=6 if 录取志愿=="三次征集2志愿" | 录取志愿=="征集2志愿"
		replace d_tmp=7 if 录取志愿=="降分投档"
		*/
	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==3
		/*
		replace d_tmp=1 if 录取志愿=="平行志愿" | 录取志愿=="1志愿" | 录取志愿=="一志愿"
		replace d_tmp=2 if 录取志愿=="2志愿" 	 | 录取志愿=="二志愿"			
		replace d_tmp=3 if 录取志愿=="首次征集"
		replace d_tmp=4 if 录取志愿=="二次征集" 
		replace d_tmp=5 if 录取志愿=="三次征集1志愿" | 录取志愿=="征集1志愿"
		replace d_tmp=6 if 录取志愿=="三次征集2志愿" | 录取志愿=="征集2志愿"
		replace d_tmp=7 if 录取志愿=="降分投档"
		*/
	
	save "clean-$prov.dta", clear	
	
	
	**福建**注意tab N有很多问题,暂时先不管了***
	global prov 福建
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N

          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,066       32.51       32.51
          2 |        316        4.97       37.49
          3 |        318        5.00       42.49
          4 |        360        5.67       48.16
          5 |        225        3.54       51.70
          6 |        228        3.59       55.29
          7 |        231        3.64       58.92
          8 |        160        2.52       61.44
          9 |         81        1.27       62.72
         10 |         90        1.42       64.13
         11 |         88        1.38       65.52
         12 |         84        1.32       66.84
         13 |        130        2.05       68.89
         14 |         98        1.54       70.43
         15 |         60        0.94       71.37
         16 |        128        2.01       73.39
         17 |         85        1.34       74.72
         18 |         54        0.85       75.57
         19 |        133        2.09       77.67
         20 |         60        0.94       78.61
         21 |         42        0.66       79.27
         22 |         66        1.04       80.31
         23 |        161        2.53       82.85
         24 |        120        1.89       84.73
         25 |         50        0.79       85.52
         26 |         78        1.23       86.75
         27 |         81        1.27       88.02
         28 |        140        2.20       90.23
         29 |         58        0.91       91.14
         30 |         30        0.47       91.61
         31 |         93        1.46       93.08
         32 |         64        1.01       94.08
         33 |         66        1.04       95.12
         34 |         34        0.54       95.66
         35 |         35        0.55       96.21
         36 |         36        0.57       96.77
         37 |         37        0.58       97.36
         38 |         38        0.60       97.95
         42 |         84        1.32       99.28
         46 |         46        0.72      100.00
------------+-----------------------------------
      Total |      6,354      100.00



	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1



         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,065       32.50       32.50
          2 |        316        4.97       37.47
          3 |        318        5.00       42.48
          4 |        360        5.67       48.14
          5 |        225        3.54       51.68
          6 |        228        3.59       55.27
          7 |        224        3.53       58.80
          8 |        168        2.64       61.44
          9 |         81        1.27       62.72
         10 |         90        1.42       64.13
         11 |         88        1.38       65.52
         12 |         84        1.32       66.84
         13 |        130        2.05       68.89
         14 |         98        1.54       70.43
         15 |         60        0.94       71.37
         16 |        128        2.01       73.39
         17 |         85        1.34       74.72
         18 |         54        0.85       75.57
         19 |        133        2.09       77.67
         20 |         60        0.94       78.61
         21 |         42        0.66       79.27
         22 |         66        1.04       80.31
         23 |        161        2.53       82.85
         24 |        120        1.89       84.73
         25 |         50        0.79       85.52
         26 |         78        1.23       86.75
         27 |         81        1.27       88.02
         28 |        140        2.20       90.23
         29 |         58        0.91       91.14
         30 |         30        0.47       91.61
         31 |         93        1.46       93.08
         32 |         64        1.01       94.08
         33 |         66        1.04       95.12
         34 |         34        0.54       95.66
         35 |         35        0.55       96.21
         36 |         36        0.57       96.77
         37 |         37        0.58       97.36
         38 |         38        0.60       97.95
         42 |         84        1.32       99.28
         46 |         46        0.72      100.00
------------+-----------------------------------
      Total |      6,354      100.00
	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2		
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==3
	...
	
		/*
		replace d_tmp=1 if 录取志愿=="平行志愿" | 录取志愿=="1志愿" | 录取志愿=="一志愿"
		replace d_tmp=2 if 录取志愿=="2志愿" 	 | 录取志愿=="二志愿"			
		replace d_tmp=3 if 录取志愿=="首次征集"
		replace d_tmp=4 if 录取志愿=="二次征集" 
		replace d_tmp=5 if 录取志愿=="三次征集1志愿" | 录取志愿=="征集1志愿"
		replace d_tmp=6 if 录取志愿=="三次征集2志愿" | 录取志愿=="征集2志愿"
		replace d_tmp=7 if 录取志愿=="降分投档"
		*/
		
	save "clean-$prov.dta", clear
	
		
	**贵州**注意最后出现的duplicate为2的是贵州大学和贵州民族大学的学校名称问题**
	global prov 贵州
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N

          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     12,607      100.00      100.00
------------+-----------------------------------
      Total |     12,607      100.00
	
	* take a try
	bro  if college=="中国民航大学" & track=="理科" & tier=="本科一批"
	tab  intake_tier 录取志愿 if college=="中国民航大学" & track=="理科" & tier=="本科一批"
	
	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      5,284       41.91       41.91
          2 |      4,986       39.55       81.46
          3 |      1,416       11.23       92.69
          4 |        224        1.78       94.47
          5 |        355        2.82       97.29
          6 |        342        2.71      100.00
------------+-----------------------------------
      Total |     12,607      100.00
	  
	  
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==3	  
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==4
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==5
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==6
	 
	tab intake_tier

                          intake_tier |      Freq.     Percent        Cum.
--------------------------------------+-----------------------------------
                                   22 |        252        2.00        2.00
                                   23 |        375        2.97        4.97
                                   24 |        174        1.38        6.35
                                   25 |        153        1.21        7.57
                                   26 |         94        0.75        8.31
                                   28 |        268        2.13       10.44
                                   29 |        174        1.38       11.82
                                   30 |         34        0.27       12.09
                                   32 |         53        0.42       12.51
                                   34 |         42        0.33       12.84
                                   37 |        728        5.77       18.62
                                   38 |        833        6.61       25.22
                                   39 |        476        3.78       29.00
                                   40 |        413        3.28       32.28
                                   41 |         56        0.44       32.72
                                   42 |        623        4.94       37.66
                                   43 |        798        6.33       43.99
                                   44 |        208        1.65       45.64
                                   46 |        239        1.90       47.54
                                   47 |         57        0.45       47.99
                                   48 |         89        0.71       48.70
                                   50 |         53        0.42       49.12
                                   52 |         90        0.71       49.83
                                   56 |        969        7.69       57.52
                                   57 |      1,022        8.11       65.62
                                   58 |        491        3.89       69.52
                                   59 |         93        0.74       70.25
                                   60 |        352        2.79       73.05
                                   61 |        413        3.28       76.32
                                   62 |        236        1.87       78.19
                                   63 |        123        0.98       79.17
                                   64 |        131        1.04       80.21
                                   65 |        236        1.87       82.08
                                   66 |         60        0.48       82.56
                                   67 |        808        6.41       88.97
                                   68 |        896        7.11       96.07
                                   69 |         63        0.50       96.57
                                   70 |         34        0.27       96.84
                                   71 |        398        3.16      100.00
--------------------------------------+-----------------------------------
                                Total |     12,607      100.00
	  
	 
	  tab 录取志愿
	  
           录取志愿 |      Freq.     Percent        Cum.
--------------------+-----------------------------------
           三次补报 |        109        1.71        1.71
           二次补报 |        412        6.47        8.19
           四次补报 |         55        0.86        9.05
               平行 |      4,178       65.65       74.70
               补报 |      1,540       24.20       98.90
           降分补报 |          4        0.06       98.96
         降分补报一 |         33        0.52       99.48
         降分补报二 |         33        0.52      100.00
--------------------+-----------------------------------
              Total |      6,364      100.00
	  
		cap drop d_tmp
		gen d_tmp=0
		
		replace d_tmp=1 if 录取志愿=="平行"
		replace d_tmp=2 if 录取志愿=="补报"	
		replace d_tmp=3 if 录取志愿=="二次补报"
		replace d_tmp=4 if 录取志愿=="三次补报"
		replace d_tmp=5 if 录取志愿=="四次补报"
		replace d_tmp=6 if 录取志愿=="降分补报"
		replace d_tmp=7 if 录取志愿=="降分补报一"
		replace d_tmp=8 if 录取志愿=="降分补报二"
		
		
		bysort prov 学校代号 college campus track tier 特殊类型 campus: egen min1=min(d_tmp)
		
		keep if d_tmp==min1 
		
		cap drop N1
		bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
		tab N1	  
	  

         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      6,853       65.51       65.51
          2 |      2,568       24.55       90.06
          3 |        684        6.54       96.60
          4 |         48        0.46       97.06
          5 |        140        1.34       98.39
          6 |        168        1.61      100.00
------------+-----------------------------------
      Total |     10,461      100.00


	  
	  
		br prov 学校代号 college campus track tier 特殊类型 intake_tier 最低分 if N1==2
		br prov 学校代号 college campus track tier 特殊类型 intake_tier 最低分 if N1==3
		br prov 学校代号 college campus track tier 特殊类型 intake_tier 最低分 if N1==4
		br prov 学校代号 college campus track tier 特殊类型 intake_tier 最低分 if N1==5
		br prov 学校代号 college campus track tier 特殊类型 intake_tier 最低分 if N1==6
		
		
	  	
		
		keep if intake_tier =="24" | intake_tier=="26" | intake_tier=="28" | intake_tier=="32" | intake_tier=="34" | intake_tier=="39" | intake_tier=="40" | intake_tier=="41" | intake_tier=="43" | intake_tier=="44" | intake_tier=="46" | intake_tier=="48" | intake_tier=="50" | intake_tier=="51" | intake_tier=="52"| intake_tier=="53" | intake_tier=="54" | intake_tier=="55" | intake_tier=="58" | intake_tier=="59" | intake_tier=="62" | intake_tier=="65" | intake_tier=="67" | intake_tier=="68" | intake_tier=="71"
		
		cap drop d_tmp1
		gen d_tmp1=0
		
		replace d_tmp1=1 if intake_tier=="24" | intake_tier=="25"
		replace d_tmp1=2 if intake_tier=="26"	
		replace d_tmp1=3 if intake_tier=="28"
		replace d_tmp1=4 if intake_tier=="32"
		replace d_tmp1=5 if intake_tier=="34"
		replace d_tmp1=6 if intake_tier=="39" | intake_tier=="40"
		replace d_tmp1=7 if intake_tier=="41"
		replace d_tmp1=8 if intake_tier=="43"
		replace d_tmp1=9 if intake_tier=="44"
		replace d_tmp1=10 if intake_tier=="46"
		replace d_tmp1=11 if intake_tier=="48"
		replace d_tmp1=12 if intake_tier=="50"
		replace d_tmp1=13 if intake_tier=="51"
		replace d_tmp1=14 if intake_tier=="52"
		replace d_tmp1=15 if intake_tier=="53"
		replace d_tmp1=16 if intake_tier=="54"
		replace d_tmp1=17 if intake_tier=="55"
		replace d_tmp1=18 if intake_tier=="58"
		replace d_tmp1=19 if intake_tier=="59"
		replace d_tmp1=20 if intake_tier=="62"
		replace d_tmp1=21 if intake_tier=="65"
		replace d_tmp1=22 if intake_tier=="67" | intake_tier=="68"
		replace d_tmp1=23 if intake_tier=="71"
		
		
		bysort prov 学校代号 college campus track tier 特殊类型 campus: egen min11=min(d_tmp1)
		
		keep if d_tmp1==min11 
		
		cap drop N1
		bysort prov 学校代号  college campus track tier 特殊类型: gen N1=_N
		tab N1	
	  

         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      4,058       99.85       99.85
          2 |          6        0.15      100.00
------------+-----------------------------------
      Total |      4,064      100.00


	   br prov 学校代号 学校名称 college campus track tier 特殊类型 intake_tier 最低分 if N1==2
	  
	  *加总quota**无quota
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		tab college prov if total_quota>2000
	  
	  save "clean-$prov.dta", clear
	
	
	**辽宁**已完成**
	global prov 辽宁
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N


          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,197      100.00      100.00
------------+-----------------------------------
      Total |      3,197      100.00


	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,323       72.66       72.66
          2 |        838       26.21       98.87
          3 |         36        1.13      100.00
------------+-----------------------------------
      Total |      3,197      100.00

	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2		
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==3	
	
	tab intake_tier

                          intake_tier |      Freq.     Percent        Cum.
--------------------------------------+-----------------------------------
                                   10 |        174        5.44        5.44
                                   11 |         12        0.38        5.82
                                   12 |        390       12.20       18.02
                                   13 |        426       13.32       31.34
                                   14 |         78        2.44       33.78
                                   15 |        114        3.57       37.35
                                    7 |        816       25.52       62.87
                                    8 |      1,119       35.00       97.87
                                    9 |         68        2.13      100.00
--------------------------------------+-----------------------------------
                                Total |      3,197      100.00
	
		
		cap drop d_tmp
		gen d_tmp=0
		
		replace d_tmp=1 if intake_tier=="7" | intake_tier=="8"
		replace d_tmp=2 if intake_tier=="9" | intake_tier=="10"	
		replace d_tmp=3 if intake_tier=="12"| intake_tier=="13"	
		replace d_tmp=4 if intake_tier=="14"| intake_tier=="15"	

		bysort prov 学校代号 college campus track tier 特殊类型 campus: egen min1=min(d_tmp)
		keep if d_tmp==min1 
		
		cap drop N1
		bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
		tab N1

         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,754      100.00      100.00
------------+-----------------------------------
      Total |      2,754      100.00
	
	
		*加总quota**quota变量是空集
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		
total_quota |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |      2,754      100.00      100.00
------------+-----------------------------------
      Total |      2,754      100.00
	

	save "clean-$prov.dta", clear
		
	
	**黑龙江**已完成**
	global prov 黑龙江
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N


          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,161      100.00      100.00
------------+-----------------------------------
      Total |      3,161      100.00


	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,052       64.92       64.92
          2 |      1,034       32.71       97.63
          3 |         75        2.37      100.00
------------+-----------------------------------
      Total |      3,161      100.00


	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2		
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==3
	
	tab intake_tier

                          intake_tier |      Freq.     Percent        Cum.
--------------------------------------+-----------------------------------
                                   10 |         15        0.47        0.47
                                   11 |        732       23.16       23.63
                                   12 |        138        4.37       28.00
                                   13 |         10        0.32       28.31
                                   14 |        452       14.30       42.61
                                   15 |         68        2.15       44.76
                                   16 |        884       27.97       72.73
                                   17 |        268        8.48       81.21
                                    8 |        526       16.64       97.85
                                    9 |         68        2.15      100.00
--------------------------------------+-----------------------------------
                                Total |      3,161      100.00
	
	cap drop d_tmp
		gen d_tmp=0
		
		replace d_tmp=1 if intake_tier=="8"
		replace d_tmp=2 if intake_tier=="9"	
		replace d_tmp=3 if intake_tier=="10"
		replace d_tmp=4 if intake_tier=="11"
		replace d_tmp=5 if intake_tier=="12"	
		replace d_tmp=6 if intake_tier=="13"
		replace d_tmp=7 if intake_tier=="14"
		replace d_tmp=8 if intake_tier=="15"
		replace d_tmp=9 if intake_tier=="16"
		replace d_tmp=10 if intake_tier=="17"
	
		bysort prov 学校代号 学校名称 track tier 特殊类型 campus: egen min1=min(d_tmp)
		keep if d_tmp==min1 
		cap drop N1
		bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
		tab N1

         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,594      100.00      100.00
------------+-----------------------------------
      Total |      2,594      100.00

	*加总quota
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		tab college prov if total_quota>2000

total_quota |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |      2,594      100.00      100.00
------------+-----------------------------------
      Total |      2,594      100.00

	  
	save "clean-$prov.dta", clear
	

		
	*----------------------------------------------------------
	* 低优先级省份： 内蒙古 吉林 四川 山东 河北 辽宁 重庆 陕西 黑龙江 广西
	*----------------------------------------------------------
	use "tmp1.dta", clear	
	tab prov
	
       prov |      Freq.     Percent        Cum.
------------+-----------------------------------
       云南 |      3,613        4.39        4.39
       吉林 |      2,658        3.23        7.61
       四川 |      4,506        5.47       13.09
       宁夏 |      1,908        2.32       15.40
       安徽 |      3,940        4.78       20.19
       山东 |      4,970        6.03       26.22
       广东 |      3,295        4.00       30.22
       广西 |      5,793        7.03       37.26
       江西 |      3,527        4.28       41.54
       河北 |      3,663        4.45       45.99
       河南 |      2,726        3.31       49.30
       湖北 |      4,665        5.66       54.96
       湖南 |      4,683        5.69       60.65
       福建 |      6,354        7.72       68.36
       贵州 |     12,607       15.31       83.67
       辽宁 |      3,197        3.88       87.55
       重庆 |      3,961        4.81       92.36
       陕西 |      3,131        3.80       96.16
     黑龙江 |      3,161        3.84      100.00
------------+-----------------------------------
      Total |     82,358      100.00
	*不存在内蒙古的信息
	
	**内蒙古**问题:data里没有内蒙古的数据**
	global prov 内蒙古
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N



	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2		
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==3		
		
	save "clean-$prov.dta", clear
	

	**山东**已完成**
	global prov 山东
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N


          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      4,970      100.00      100.00
------------+-----------------------------------
      Total |      4,970      100.00


	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1

         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,157       63.52       63.52
          2 |      1,742       35.05       98.57
          3 |         63        1.27       99.84
          4 |          8        0.16      100.00
------------+-----------------------------------
      Total |      4,970      100.00

	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2		
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==3		
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==4		
	tab intake_tier
	
                          intake_tier |      Freq.     Percent        Cum.
--------------------------------------+-----------------------------------
                            专科-征集 |        556       11.19       11.19
                        专科-首次录取 |      1,830       36.82       48.01
                            本科-征集 |        327        6.58       54.59
                        本科-首次录取 |      2,257       45.41      100.00
--------------------------------------+-----------------------------------
                                Total |      4,970      100.00
	
		cap drop d_tmp
		gen d_tmp=0
		
		replace d_tmp=1 if intake_tier=="本科-首次录取" | intake_tier=="专科-首次录取"
		replace d_tmp=2 if intake_tier=="本科-征集" | intake_tier=="专科-征集"
	
		bysort prov 学校代号 college campus track tier 特殊类型: egen min1=min(d_tmp)
		keep if d_tmp==min1 
		
		cap drop N1
		bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
		tab N1

         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      4,003       97.66       97.66
          2 |         96        2.34      100.00
------------+-----------------------------------
      Total |      4,099      100.00
	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2	
	br  if N1==2	
	**注意：这里的2已经被解决(叶老师那里的数据已经被清洗)。  
	
	
	*加总quota
		cap drop total_quota
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		tab college prov if total_quota>2000 	

                      |    prov
              college |      山东 |     Total
----------------------+-----------+----------
             临沂大学 |         1 |         1 
       山东中医药大学 |         2 |         2 
         山东交通学院 |         1 |         1 
         山东农业大学 |         2 |         2 
 山东医学高等专科学校 |         2 |         2 
         山东师范大学 |         2 |         2 
         山东建筑大学 |         2 |         2 
         山东理工大学 |         2 |         2 
         山东科技大学 |         2 |         2 
     山东第一医科大学 |         1 |         1 
         山东财经大学 |         2 |         2 
         曲阜师范大学 |         2 |         2 
             济南大学 |         2 |         2 
           滨州医学院 |         1 |         1 
             烟台大学 |         1 |         1 
             聊城大学 |         1 |         1 
         青岛农业大学 |         1 |         1 
             青岛大学 |         2 |         2 
         青岛滨海学院 |         1 |         1 
         青岛理工大学 |         2 |         2 
         青岛科技大学 |         2 |         2 
             鲁东大学 |         1 |         1 
         齐鲁工业大学 |         1 |         1 
----------------------+-----------+----------
                Total |        36 |        36 
	
	
	save "clean-$prov.dta", clear

	
	
	**重庆**已完成**
	global prov 重庆
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N


          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,961      100.00      100.00
------------+-----------------------------------
      Total |      3,961      100.00



	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,017       50.92       50.92
          2 |      1,404       35.45       86.37
          3 |        321        8.10       94.47
          4 |        180        4.54       99.02
          5 |         15        0.38       99.39
          6 |         24        0.61      100.00
------------+-----------------------------------
      Total |      3,961      100.00

	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2		
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==3	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==4		
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==5
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==6		

	tab 录取志愿 if N1==6

           录取志愿 |      Freq.     Percent        Cum.
--------------------+-----------------------------------
      三次征集1志愿 |          4       16.67       16.67
      三次征集2志愿 |          4       16.67       33.33
           二次征集 |          4       16.67       50.00
           平行志愿 |          4       16.67       66.67
           降分投档 |          4       16.67       83.33
           首次征集 |          4       16.67      100.00
--------------------+-----------------------------------
              Total |         24      100.00
	
		cap drop d_tmp
		gen d_tmp=0
		replace d_tmp=1 if 录取志愿=="平行志愿" | 录取志愿=="1志愿" | 录取志愿=="一志愿"
		replace d_tmp=2 if 录取志愿=="2志愿" 	 | 录取志愿=="二志愿"			
		replace d_tmp=3 if 录取志愿=="首次征集"
		replace d_tmp=4 if 录取志愿=="二次征集" 
		replace d_tmp=5 if 录取志愿=="三次征集1志愿" | 录取志愿=="征集1志愿"
		replace d_tmp=6 if 录取志愿=="三次征集2志愿" | 录取志愿=="征集2志愿"
		replace d_tmp=7 if 录取志愿=="降分投档"

		
		bysort prov 学校代号 学校名称 track tier 特殊类型 campus: egen min1=min(d_tmp)	
		
		keep if d_tmp==min1 
	
		cap drop N1
		bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
		tab N1

         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,878      100.00      100.00
------------+-----------------------------------
      Total |      2,878      100.00

		
	*加总quota
		cap drop total_quota
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		tab college prov if total_quota>2000 		

                      |    prov
              college |      重庆 |     Total
----------------------+-----------+----------
         重庆交通大学 |         1 |         1 
         重庆理工大学 |         1 |         1 
----------------------+-----------+----------
                Total |         2 |         2 

		
	save "clean-$prov.dta", clear	
	
	
	**陕西**已完成--模板**
	global prov 陕西
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N


          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,131      100.00      100.00
------------+-----------------------------------
      Total |      3,131      100.00


	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1

/*
         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,077       66.34       66.34
          2 |      1,054       33.66      100.00
------------+-----------------------------------
      Total |      3,131      100.00
*/

	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2		
	tab intake_tier
		
		cap drop d_tmp
		gen d_tmp=0
		
		replace d_tmp=1 if intake_tier=="本科一批"
		replace d_tmp=2 if intake_tier=="本科一批征集"	
		replace d_tmp=3 if intake_tier=="本科二批"
		replace d_tmp=4 if intake_tier=="本科二批征集"
		replace d_tmp=5 if intake_tier=="专科批"
		replace d_tmp=6 if intake_tier=="专科批征集"
		
		bysort prov 学校代号 学校名称 track tier 特殊类型 campus: egen min1=min(d_tmp)
		
		keep if d_tmp==min1 
		
		cap drop N1
		bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
		tab N1
	
         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      2,604      100.00      100.00
------------+-----------------------------------
      Total |      2,604      100.00
	
	
	*加总quota
		cap drop total_quota
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		tab total_quota
		tab college prov if total_quota>2000 

              college |      陕西 |     Total
----------------------+-----------+----------
         宝鸡文理学院 |         1 |         1 
     杨凌职业技术学院 |         1 |         1 
           西安医学院 |         1 |         1 
         西安工业大学 |         1 |         1 
         西安理工大学 |         1 |         1 
         西安石油大学 |         1 |         1 
         西安科技大学 |         1 |         1 
         西安邮电大学 |         1 |         1 
         陕西理工大学 |         1 |         1 
         陕西科技大学 |         1 |         1 
----------------------+-----------+----------
                Total |        10 |        10 
	
	
	save "clean-$prov.dta", clear	
	
	
	**广西**完成--但是quota是no observation**
	global prov 广西
	use "tmp1.dta", clear	
	
	keep if prov=="$prov"
	
	cap drop N
	bysort prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 (raw_ad_min): gen N=_N
	tab N

          N |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      5,793      100.00      100.00
------------+-----------------------------------
      Total |      5,793      100.00


	* 招生单位
	cap drop N1
	bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
	tab N1


         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      1,713       29.57       29.57
          2 |      2,686       46.37       75.94
          3 |        915       15.79       91.73
          4 |        304        5.25       96.98
          5 |        175        3.02      100.00
------------+-----------------------------------
      Total |      5,793      100.00


	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==2		
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==3
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==4	
	br prov 学校代号 学校名称 track 批次 tier 特殊类型 intake_tier 录取志愿 campus 备注 raw_ad_min if N1==5

	tab intake_tier
		
		cap drop d_tmp
		gen d_tmp=0
		
		replace d_tmp=1 if intake_tier=="本科一批"
		replace d_tmp=2 if intake_tier=="本科一批征集"	
		replace d_tmp=3 if intake_tier=="本科一批第二次征集"
		replace d_tmp=4 if intake_tier=="本科二批"
		replace d_tmp=5 if intake_tier=="本科二批征集"	
		replace d_tmp=6 if intake_tier=="本科二批第二次征集"
		replace d_tmp=7 if intake_tier=="本科二批第三次征集"
		replace d_tmp=8 if intake_tier=="本科二批第四次征集"
		replace d_tmp=9 if intake_tier=="专科批"
		replace d_tmp=10 if intake_tier=="专科批第一次征集"
		replace d_tmp=11 if intake_tier=="专科批第二次征集"
		
		bysort prov 学校代号 学校名称 track tier 特殊类型 campus: egen min1=min(d_tmp)
		keep if d_tmp==min1 
		cap drop N1
		bysort prov 学校代号 college campus track tier 特殊类型: gen N1=_N
		tab N1

         N1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      3,472      100.00      100.00
------------+-----------------------------------
      Total |      3,472      100.00
		
		
		*加总quota--quota变量是空集
		tab quota in 1/10
		cap drop total_quota
		bysort prov 学校代号 college campus track tier 特殊类型: egen total_quota=sum(quota)
		bro total_quota
		tab total_quota
		tab college prov if total_quota>500

total_quota |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |      3,472      100.00      100.00
------------+-----------------------------------
      Total |      3,472      100.00
		

	save "clean-$prov.dta", clear
		

		
		