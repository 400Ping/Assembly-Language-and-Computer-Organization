.data
#有使用chatgpt-4跟claude AI 生成程式跟加註解
#ID: .string "s1111111\n"
strchoise: .string "(Two characters last name + Two characters first name):1 \n(One character last name + Two characters first name):2 \n((Two characters last name + One character first name):3 \n(One character last name + One character first name):4 \n"

str1: .string "Please enter the strokes of the first character of the last name="
str2: .string "Please enter the strokes of the second character of the last name="
str3: .string "Please enter the strokes of the first character of the first name="
str4: .string "Please enter the strokes of the second character of the first name="
str5: .string "Please enter the strokes of the last name="
str6: .string "Please enter the strokes of the first name="

sky_str: .string "Sky"
people_str: .string "People"
land_str: .string "Land"
outside_str: .string "Outside"
total_str: .string "Total"
wood_str: .string " Wood"
water_str: .string " Water"
earth_str: .string " Earth"
fire_str: .string " Fire"
metal_str: .string " Metal"
equal: .string "= "
newline: .string "\n"

peoplegeneratesky: .string "People generate Sky"
peoplerestraintsky: .string "People restraint Sky"
skyequalpeople: .string "Sky equal People"
skygeneratepeople: .string "Sky generate People"
skyrestraintpeople: .string "Sky restraint People"
skyrestraintland:.string "Sky restraint Land"
landgeneratesky:.string "Land generate Sky"
landrestraintsky:.string "Land restraint Sky"
skyequalland: .string "Sky equal Land"
skygenerateland: .string "Sky generate Land"
skyrestraintout: .string "Sky restraint Outside"
outgeneratesky: .string "Outside generate Sky"
outrestraintsky: .string "Outside restraint Sky"
skyequalout: .string "Sky equal Outside"
skygenerateout: .string "Sky generate Outside"
skyrestrainttotal: .string "Sky restraint Total"
skygeneratetotal: .string "Sky generate Total"
totalrestraintsky: .string "Total restraint Total"
totalgeneratesky: .string "Total generate Total"
skyequaltotal: .string "Sky equal Total"
peoplerestraintout: .string "People restraint Outside"
outgeneratepeople: .string "Outside generate People"
outrestraintpeople: .string "Outside restraint People"
peopleequalout: .string "People equal Outside"
peoplegenerateout: .string "People generate Outside"
peoplerestraintland: .string "People restraint Land"
landgeneratepeople: .string "Land generate People"
landrestraintpeople: .string "Land restraint People"
peopleequalland: .string "People equal Land"
peoplegenerateland: .string "People generate Land"
peoplerestrainttotal:.string "People restraint Total"
totalgeneratepeople:.string "Total generate People"
totalrestraintpeople:.string "Total restraint People"
peopleequaltotal:.string "People equal Total"
peoplegeneratetotal:.string "People generate Total"
outgenerateland:.string "Outside generate Land"
outrestraintland:.string "Outside restraint Land"
landequalout:.string "Land equal Outside"
landgenerateout:.string "Land generate Outside"
landrestraintout:.string "Land restraint Outside"

totalrestraintland:.string "Total restraint Land"
totalgenerateland:.string "Total generate Land"
landequaltotal:.string "Land equal Total"
landgeneratetotal:.string "Land generate Total"
landrestrainttotal:.string "Land restraint Total"

outgeneratetotal:.string "Outside generate Total"
totalgenerateout:.string "Total generate Outside"
totalrestraintout:.string "Total restraint Outside"
outequaltotal:.string "Outside equal Total"
outrestrainttotal:.string "Outside restraint Total"
#有使用chatgpt-4跟claude AI 生成程式跟加註解

.text
main:
	# Display ID
	#la a0, ID
	#jal printString

	la a0 strchoise
	jal printString 
	jal input
	mv s0,a0
	
	li a0,0 
	j mode_loop
    	
mode_loop:
	li t0,1
   	beq s0,t0, mode1
   	li t0,2
    	beq s0,t0, mode2
    	li t0,3
    	beq s0,t0, mode3
    	li t0,4
    	beq s0,t0, mode4
    
   	# If none of the modes are selected, execute default behavior
    	jal CAL
    	
mode1: 
	mv t0, ra
	la a0, str1
	jal printString
	jal input 
	mv s1,a0 
	la a0, str2
	jal printString
	jal input
	mv s2,a0 
	la a0, str3
	jal printString
	jal input
	mv s3,a0 
	la a0, str4
	jal printString
	jal input
	mv s4,a0
	add s6,s1,s2
	add s6,s6,s3
	add s6,s6,s4
	mv ra, t0
	ret
	
mode2:
	mv t0, ra
	li s1 1
	la a0, str5
	jal printString
	jal input 
	mv s2,a0 
	la a0, str3
	jal printString
	jal input
	mv s3,a0 
	la a0, str4
	jal printString
	jal input
	mv s4,a0 
	add s6,s2,s3
	add s6,s6,s4
	mv a0,s6
	mv ra ,t0	
	ret
    	
mode3: 
	mv t0,ra
	la a0, str1
	jal printString
	jal input 
	mv s1,a0 
	la a0, str2
	jal printString
	jal input
	mv s2,a0 
	la a0, str6
	jal printString
	jal input
	mv s3,a0 
	li s4 1	
	add s6,s1,s2
	add s6,s6,s3
	mv ra ,t0
	ret
	
mode4:
	mv t0,ra
	li s1 1
	la a0, str5
	jal printString
	jal input
	mv s2,a0 
	la a0, str6
	jal printString
	jal input
	mv s3,a0 
	li s4 1
	add s6,s2,s3
	mv ra ,t0
	ret
	
printString:
	li a7, 4 
	ecall
	ret
printInt:
	li a7, 1
	ecall
	ret
	
input:
	li a7 5
	ecall
	ret
	
CAL:	
    # 打印一個換行
    la a0, newline  
    li a7, 4
    ecall

    # 打印 "Sky" 
    la a0, sky_str
    jal printString

    # 打印 "="
    la a0, equal
    jal printString

    # 計算 s5 = s1 + s2
    add s5, s1, s2

    # 獲取 s5 的最後一位數字
    li t6, 10
    rem s7, s5, t6

    # 調用 output 函數更新 s7 (s5 的最後一位數字)
    mv a0, s7
    jal output
    mv s7, a0

    # 打印 s5 的值
    mv a0, s5
    jal printInt

    # 調用 computeWuXin 函數來確定 s5 對應的五行
    jal computeWuXin
    mv t1, a1

    # 重複上述步驟計算 People、Land、Outside 和 Total
    # ...
	
	la a0 people_str
	jal printString
	la a0 equal
	jal printString
	li s5 0
	add s5,s2,s3
	
	li t6,10
	rem s8,s5,t6
	mv a0,s8
	jal output
	mv s8,a0
	
	mv a0 s5
	jal printInt
	jal computeWuXin
	mv t2,a1
	
	la a0 land_str
	jal printString
	la a0 equal
	jal printString
	li s5 0
	add s5,s3,s4
	
	li t6,10
	rem s9,s5,t6
	mv a0,s9
	jal output
	mv s9,a0
	
	mv a0 s5
	jal printInt
	jal computeWuXin
	mv t3,a1
	
	la a0 outside_str
	jal printString
	la a0 equal
	jal printString
	li s5 0
	add s5,s1,s4
	
	li t6,10
	rem s10,s5,t6
	mv a0,s10
	jal output
	mv s10,a0
	
	mv a0 s5
	jal printInt
	jal computeWuXin
	mv t4,a1

	la a0 total_str
	jal printString
	la a0 equal
	jal printString
	
	li t6,10
	rem s11,s6,t6
	mv a0,s11
	jal output
	mv s11,a0
	
	mv a0,s6
	jal printInt
	jal computeWuXin
	mv t5,a1
	# 打印一個換行  
    	la a0, newline
    	li a7, 4
    	ecall

    	# 計算並打印五行之間的生克關係
    	sub a0, s7, s8
    	jal sky_to_people
    	
    	sub a0, s7, s9  
    	jal sky_to_land
	
	sub a0,s7,s10
	jal sky_to_out
	
	sub a0,s7,s11
	jal sky_to_total
	
	sub a0,s8,s9
	jal people_to_land
	
	sub a0,s8,s10
	jal people_to_out
	
	sub a0,s8,s11
	jal people_to_total
	
	sub a0,s9,s10
	jal land_to_out
	
	sub a0,s9,s11
	jal land_to_total
	
	sub a0,s10,s11
	jal out_to_total
	
	j end
	
computeWuXin:
	li t1 10
	rem t0,a0,t1
	beq t0, zero, return_water   
	li t1 1
    	beq t0, t1, return_wood   
    	li t1 2
    	beq t0, t1, return_wood     
    	li t1 3
    	beq t0, t1, return_fire    
    	li t1 4
    	beq t0, t1, return_fire      
    	li t1 5
    	beq t0, t1, return_earth      
    	li t1 6
    	beq t0, t1, return_earth      
    	li t1 7
    	beq t0, t1, return_metal     
    	li t1 8
    	beq t0, t1, return_metal     
    	li t1 9
    	beq t0, t1, return_water      
    	mv ra, t0
	ret
	
return_wood:
	la a0 wood_str
	li a7, 4
	li a1 0
	ecall
    	li a0, '\n' 
    	li a7, 11     
	ecall
	ret
return_fire:
	la a0 fire_str
	li a7, 4 
	li a1 1
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret
return_earth:
	la a0 earth_str
	li a7, 4 
	li a1 2
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret
return_metal:
	la a0 metal_str
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret
return_water:
	la a0 water_str
	li a7, 4 
	li a1 4
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret

out_to_total:
 	li a1, 0    
 	li a2, 1    
 	li a3, 2   
 	li a4, 3    
 	li a5, 4    
 	li a6, -1
 	li a7, -2
 	li t0, -3
 	li t1, -4
 	beq a0, a1, out_equal_total
 	beq a0, a2, total_generate_out
 	beq a0, a3, total_restraint_out
 	beq a0, a4, out_restraint_total
 	beq a0, a5, out_generate_total
 	beq a0, a6, out_generate_total
 	beq a0, a7, out_restraint_total
 	beq a0, t0, total_restraint_out
 	beq a0, t1, total_generate_out
 	j end
 	
land_to_total:
 	li a1, 0    
 	li a2, 1    
 	li a3, 2   
 	li a4, 3    
 	li a5, 4    
 	li a6, -1
 	li a7, -2
 	li t0, -3
 	li t1, -4
 	beq a0, a1, land_equal_total
 	beq a0, a2, total_generate_land
 	beq a0, a3, total_restraint_land
 	beq a0, a4, land_restraint_total
 	beq a0, a5, land_generate_total
 	beq a0, a6, land_generate_total
 	beq a0, a7, land_restraint_total
 	beq a0, t0, total_restraint_land
 	beq a0, t1, total_generate_land
 	j end
 	
land_to_out:
 	li a1, 0    
 	li a2, 1    
 	li a3, 2   
 	li a4, 3    
 	li a5, 4    
 	li a6, -1
 	li a7, -2
 	li t0, -3
 	li t1, -4
 	beq a0, a1, land_equal_out
 	beq a0, a2, out_generate_land
 	beq a0, a3, out_restraint_land
 	beq a0, a4, land_restraint_out
 	beq a0, a5, land_generate_out
 	beq a0, a6, land_generate_out
 	beq a0, a7, land_restraint_out
 	beq a0, t0, out_restraint_land
 	beq a0, t1, out_generate_land
 	j end
 	
people_to_total:
 	li a1, 0    
 	li a2, 1    
 	li a3, 2   
 	li a4, 3    
 	li a5, 4    
 	li a6, -1
 	li a7, -2
 	li t0, -3
 	li t1, -4
 	beq a0, a1, people_equal_total
 	beq a0, a2, total_generate_people
 	beq a0, a3, total_restraint_people
 	beq a0, a4, people_restraint_total
 	beq a0, a5, people_generate_total
 	beq a0, a6, people_generate_total
 	beq a0, a7, people_restraint_total
 	beq a0, t0, total_restraint_people
 	beq a0, t1, total_generate_people
 	j end
 	
people_to_out:
 	li a1, 0    
 	li a2, 1    
 	li a3, 2   
 	li a4, 3    
 	li a5, 4    
 	li a6, -1
 	li a7, -2
 	li t0, -3
 	li t1, -4
 	beq a0, a1, people_equal_out
 	beq a0, a2, out_generate_people
 	beq a0, a3, out_restraint_people
 	beq a0, a4, people_restraint_out
 	beq a0, a5, people_generate_out
 	beq a0, a6, people_generate_out
 	beq a0, a7, people_restraint_out
 	beq a0, t0, out_restraint_people
 	beq a0, t1, out_generate_people
 	j end
 	
people_to_land:
 	li a1, 0    
 	li a2, 1    
 	li a3, 2   
 	li a4, 3    
 	li a5, 4    
 	li a6, -1
 	li a7, -2
 	li t0, -3
 	li t1, -4
 	beq a0, a1, people_equal_land
 	beq a0, a2, land_generate_people
 	beq a0, a3, land_restraint_people
 	beq a0, a4, people_restraint_land
 	beq a0, a5, people_generate_land
 	beq a0, a6, people_generate_land
 	beq a0, a7, people_restraint_land
 	beq a0, t0, land_restraint_people
 	beq a0, t1, land_generate_people
 	j end
 	
sky_to_total:
 	li a1, 0    
 	li a2, 1    
 	li a3, 2   
 	li a4, 3    
 	li a5, 4    
 	li a6, -1
 	li a7, -2
 	li t0, -3
 	li t1, -4
	beq a0, a1, sky_equal_total
 	beq a0, a2, total_generate_sky
 	beq a0, a3, total_restraint_sky
 	beq a0, a4, sky_restraint_total
 	beq a0, a5, sky_generate_total
 	beq a0, a6, sky_generate_total
 	beq a0, a7, sky_restraint_total
 	beq a0, t0, total_restraint_sky
 	beq a0, t1, total_generate_sky
 	j end
 	
sky_to_out:
	li a1, 0    
	li a2, 1    
	li a3, 2   
	li a4, 3    
	li a5, 4    
	li a6, -1
	li a7, -2
	li t0, -3
	li t1, -4
	beq a0, a1, sky_equal_out
	beq a0, a2, out_generate_sky
	beq a0, a3, out_restraint_sky
	beq a0, a4, sky_restraint_out
	beq a0, a5, sky_generate_out
	beq a0, a6, sky_generate_out
	beq a0, a7, sky_restraint_out
	beq a0, t0, out_restraint_sky
	beq a0, t1, out_generate_sky
	j end
	
sky_to_land:
	li a1, 0    
	li a2, 1    
	li a3, 2   
	li a4, 3    
	li a5, 4    
	li a6, -1
	li a7, -2
	li t0, -3
	li t1, -4
	beq a0, a1, sky_equal_land
	beq a0, a2, land_generate_sky
	beq a0, a3, land_restraint_sky
	beq a0, a4, sky_restraint_land
	beq a0, a5, sky_generate_land
	beq a0, a6, sky_generate_land
	beq a0, a7, sky_restraint_land
	beq a0, t0, land_restraint_sky
	beq a0, t1, land_generate_sky
	j end
	
sky_to_people:
	li a1, 0    # 將t1設置為1
	li a2, 1    # 將t2設置為2
	li a3, 2    # 將t3設置為3
	li a4, 3    # 將t4設置為4
	li a5, 4    # 將t5設置為5
	li a6, -1
	li a7, -2
	li t0, -3
	li t1, -4
	beq a0, a1, sky_equal_people
	beq a0, a2, people_generate_sky
	beq a0, a3, people_restraint_sky
	beq a0, a4, sky_restraint_people
	beq a0, a5, sky_generate_people
	beq a0, a6, sky_generate_people
	beq a0, a7, sky_restraint_people
	beq a0, t0, people_restraint_sky
	beq a0, t1, people_generate_sky
	j end
 	
out_restraint_total:
 	la a0 outrestrainttotal
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
	
total_generate_out:
 	la a0 totalgenerateout
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret

total_restraint_out:
 	la a0 totalrestraintout
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
  
out_equal_total:
 	la a0 outequaltotal
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
 	 
out_generate_total:
 	la a0 outgeneratetotal
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
	ecall
 	ret
 	
land_restraint_total:
 	la a0 landrestrainttotal
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret

total_generate_land:
 	la a0 totalgenerateland
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret

total_restraint_land:
 	la a0 totalrestraintland
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
  
land_equal_total:
 	la a0 landequaltotal
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
 	 
land_generate_total:
 	la a0 landgeneratetotal
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
	ecall
 	ret
 	
land_restraint_out:
 	la a0 landrestraintout
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
 

out_generate_land:
 	la a0 outgenerateland
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret

out_restraint_land:
 	la a0 outrestraintland
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
  
land_equal_out:
 	la a0 landequalout
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
 
land_generate_out:
 	la a0 landgenerateout
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
	ecall
 	ret

people_restraint_total:
 	la a0 peoplerestrainttotal
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
 

total_generate_people:
 	la a0 totalgeneratepeople
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret

total_restraint_people:
 	la a0 totalrestraintpeople
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
  
people_equal_total:
 	la a0 peopleequaltotal
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
 	 
people_generate_total:
 	la a0 peoplegeneratetotal
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
	ecall
 	ret

people_restraint_out:
 	la a0 peoplerestraintout
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
 

out_generate_people:
 	la a0 outgeneratepeople
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret

out_restraint_people:
 	la a0 outrestraintpeople
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
  
people_equal_out:
 	la a0 peopleequalout
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
 
people_generate_out:
 	la a0 peoplegenerateout
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
	ecall
 	ret

people_restraint_land:
 	la a0 peoplerestraintland
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
 

land_generate_people:
 	la a0 landgeneratepeople
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret

land_restraint_people:
 	la a0 landrestraintpeople
 	li a7, 4 
 	li a1 3
	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
  
people_equal_land:
 	la a0 peopleequalland
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
 
people_generate_land:
 	la a0 peoplegenerateland
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret

sky_restraint_total:
 	la a0 skyrestrainttotal
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
 
total_generate_sky:
 	la a0 totalgeneratesky
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret

total_restraint_sky:
 	la a0 totalrestraintsky
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
  
sky_equal_total:
 	la a0 skyequaltotal
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret
 
sky_generate_total:
 	la a0 skygeneratetotal
 	li a7, 4 
 	li a1 3
 	ecall
     	li a0, '\n' 
     	li a7, 11
 	ecall
 	ret

sky_restraint_out:
	la a0 skyrestraintout
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret
out_generate_sky:
	la a0 outgeneratesky
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret

out_restraint_sky:
	la a0 outrestraintsky
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret
		
sky_equal_out:
	la a0 skyequalout
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret
	
sky_generate_out:
	la a0 skygenerateout
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret

sky_restraint_land:
	la a0 skyrestraintland
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret
	

land_generate_sky:
	la a0 landgeneratesky
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret

land_restraint_sky:
	la a0 landrestraintsky
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret
		
sky_equal_land:
	la a0 skyequalland
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret
	
sky_generate_land:
	la a0 skygenerateland
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret

sky_restraint_people:
	la a0 skyrestraintpeople
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret

people_generate_sky:
	la a0 peoplegeneratesky
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret

people_restraint_sky:
	la a0 peoplerestraintsky
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret
		
sky_equal_people:
	la a0 skyequalpeople
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret
	
sky_generate_people:
	la a0 skygeneratepeople
	li a7, 4 
	li a1 3
	ecall
    	li a0, '\n' 
    	li a7, 11
	ecall
	ret

output:
	# 初始化寄存器的值
	li a1, 1    # 將t1設置為1
	li a2, 2    # 將t2設置為2
	li a3, 3    # 將t3設置為3
	li a4, 4    # 將t4設置為4
	li a5, 5    # 將t5設置為5
	li a6, 6
	li a7, 7
	li t0, 8
	li t1, 9
	# 檢查每個寄存器的值，並更新它們
	beq a0, a1, reg1_done   # 如果s7等於t1，跳過reg1的更新
	beq a0, a2, reg1_done   # 如果s7等於t1，跳過reg1的更新
	beq a0, a3, reg2_done   # 如果s7等於t2，跳過reg2的更新
	beq a0, a4, reg2_done   # 如果s7等於t2，跳過reg2的更新
	beq a0, a5, reg3_done   # 如果s7等於t3，跳過reg3的更新
	beq a0, a6, reg3_done   # 如果s7等於t3，跳過reg3的更新
	beq a0, a7, reg4_done   # 如果s7等於t4，跳過reg4的更新
	beq a0, t0, reg4_done   # 如果s7等於t4，跳過reg4的更新
	beq a0, t1, reg5_done   # 如果s7等於t5，跳過reg5的更新
	beq a0, x0, reg5_done   # 如果s7等於t5，跳過reg5的更新
reg1_done:
    	mv a0, a1    # 將a0設置為t1，這樣你可以在調用該函數之後獲取新值
    	ret    # 返回

reg2_done:
	mv a0, a2    # 將a0設置為t1，這樣你可以在調用該函數之後獲取新值
    	ret    # 返回

reg3_done:
    	mv a0, a3    # 將a0設置為t1，這樣你可以在調用該函數之後獲取新值
    	ret    # 返回

reg4_done:
    	mv a0, a4    # 將a0設置為t1，這樣你可以在調用該函數之後獲取新值
    	ret    # 返回

reg5_done:
    	mv a0, a5    # 將a0設置為t1，這樣你可以在調用該函數之後獲取新值
    	ret    # 返回

end:
	li a7, 10
	ecall
