        .data
arr:    .space 5                   #reserve a block of 5 bytes   
arrsz:  .byte  5                   #using as array  of characters       
brr:    .space 5                   
brrsz:  .byte  5
   
        .text
main:   lb   $s0,arrsz             #here giving size of 1st array in register $s0        
        lb   $s1,brrsz             #here giving size of 2nd array in register $s1     
        la   $s2,arr               #here giving base adderess of 1st array in register $s2                   
        la   $s3,brr               #here giving base adderess of 2nd array in register $s3
        move $s4,$s2               #moving base adderess of $s2 into $s4
        move $s5,$s3               #moving base adderess of $s3 into $s5
        li   $t0,0            
        li   $t2,'a'               #initialized value of $t2 as character 'a'       
        li   $t3,'A'               #initialized value of $t2 as character 'A'        
        li   $t1,0

iniarr: beq  $t0,$s0,loop          #checking condition
        sb   $s2,($s2)             #arr[i] = adderess of arr[i]   
        sb   $t2,0($s2)            #giving data in register $t2 into array
        sb   $s3,($s3)             #brr[i] = adderess of brr[i] 
        sb   $t3,0($s3)            #giving data in register $t2 into array    
        addi $t2,$t2,3             #increasing value of $t2 by 3 to go to 3rd character from current
        addi $t3,$t3,4             #increasing value of $t3 by 4 to go to 4th character from current     
        addi $s2,$s2,1             #step to adderess of next cell in array 
        addi $s3,$s3,1             #step to adderess of next cell in array 
        addi $t0,$t0,1             #increasing value of $t0 by 1    
        b    iniarr                #branching condition

loop:   beq  $t1,$s0,END           #condition check   
        lb $t4,0($s4)              #here created $t4 as temprory variable and gave value of 1st element of 1st array
        sb $s5,0($s4)              #here given value of 2nd array into 1st array
        lb $t5,0($s5)              #to check after swapping what value in 2nd array
        sb $t4,0($s5)              #finaly giving $t4 into 2nd array 
        addi $s4,$s4,1             #step to adderess of next cell in array
        addi $s5,$s5,1             #step to adderess of next cell in array
        addi $t1,$t1,1
        b    loop
         


END:
        jr $ra
