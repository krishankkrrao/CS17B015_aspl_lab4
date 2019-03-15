        .data
arr:    .space 20                #reserve a block of 20 bytes       
arrsz:  .word  5                 #using as array  of integers
brr:    .space 20               
brrsz:  .word  5                               
    
        .text
main:   lw   $s0,arrsz           #here giving size of 1st array in register $s0  
        lw   $s1,brrsz           #here giving size of 2nd array in register $s1
        la   $s2,arr             #here giving base adderess of 1st array in register $s2
        la   $s3,brr             #here giving base adderess of 2nd array in register $s3 
        move $s4,$s2             #moving base adderess of $s2 into $s4
        move $s5,$s3             #moving base adderess of $s2 into $s4        
        li   $t0,0            
        li   $t2,1               #initialized value of $t2 as 1
        li   $t3,2               #initialized value of $t3 as 2          
        li   $t1,0

iniarr: beq  $t0,$s0,loop        #condition check
        sw   $s2,($s2)           #arr[i] = adderess of arr[i]     
        sw   $t2,0($s2)          #giving data in register $t2 into array
        sw   $s3,($s3)           #brr[i] = adderess of brr[i]    
        sw   $t3,0($s3)          #giving data in register $t2 into array    
        addi $t2,$t2,3           #increasing value of $t2 by 3
        addi $t3,$t3,4           #increasing value of $t3 by 4 
        addi $s2,$s2,4           #step to adderess of next cell in array 
        addi $s3,$s3,4           #step to adderess of next cell in array   
        addi $t0,$t0,1           #increasing value of $t0 by 1         
        b    iniarr              #branching condition

loop:   beq  $t1,$s0,END         #condition check      
        lw $t4,0($s4)            #here created $t4 as temprory variable and gave value of 1st element  of 1st array          
        sw $s5,0($s4)            #here given value of 2nd array into 1st array
        lw $t5,0($s5)            #to check after swapping what value in 2nd array
        sw $t4,0($s5)            #finaly giving $t4 into 2nd array 
        addi $s4,$s4,4           #step to adderess of next cell in array 
        addi $s5,$s5,4           #step to adderess of next cell in array
        addi $t1,$t1,1
        b    loop
         


END:
        jr $ra
