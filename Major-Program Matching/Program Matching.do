***The First Time
use "C:\Users\gse\Desktop\仇培林\学科专业表.dta", clear
help joinby
use "C:\Users\gse\Desktop\仇培林\浙江数据.dta", clear
drop major_name major_code 
joinby majorX yr4_coll using "C:\Users\gse\Desktop\仇培林\学科专业表.dta" , update 

use "C:\Users\gse\Desktop\备份\浙江数据.dta" 
drop major_name major_code 
joinby majorX yr4_coll using "C:\Users\gse\Desktop\仇培林\学科专业表.dta" , unmatched (master)

use "C:\Users\gse\Desktop\仇培林\成功匹配后的浙江数据.dta", clear
use "C:\Users\gse\Desktop\仇培林\成功和不成功匹配的浙江数据（1016完整）.dta", clear

***The Second Time
clear
import excel "C:\Users\gse\Desktop\仇培林第二遍\浙江-18-专业名称清理.xlsx", sheet("Sheet1") firstrow allstring
import excel "C:\Users\gse\Desktop\仇培林第二遍\major_name_list_4yr_2yr_2017.xlsx", sheet("Sheet1") firstrow allstring clear
use "C:\Users\gse\Desktop\仇培林第二遍\major_name_llist.dta"
use "C:\Users\gse\Desktop\仇培林第二遍\浙江数据.dta"
joinby majorX yr4_coll using "C:\Users\gse\Desktop\仇培林第二遍\major_name_llist.dta" , update 
save "C:\Users\gse\Desktop\仇培林第二遍\导出数据\匹配成功的730个数据.dta"

use "C:\Users\gse\Desktop\仇培林第二遍\浙江数据.dta"
joinby majorX yr4_coll using "C:\Users\gse\Desktop\仇培林第二遍\major_name_llist.dta" , unmatched (master) 
save "C:\Users\gse\Desktop\仇培林第二遍\导出数据\匹配成功和不成功的所有浙江数据.dta"
export excel using "C:\Users\gse\Desktop\仇培林第二遍\导出数据\Stata导出结果数据_含匹配和未匹配的.xls"
