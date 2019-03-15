        .data
arr:    .space 20                #reserve a block of 20 bytes       
arrsz:  .word  5                 
brr:    .space 20               
brrsz:  .word  5                               
    
        .text
main:   lw   $s0,arrsz            
        lw   $s1,brrsz           
        la   $s2,arr             #giving 
        la   $s3,brr            
        move $s4,$s2             #moving base adderess of $s2 into $s4
        move $s5,$s3                    
        li   $t0,0            
        li   $t2,1               #initialized value of $t2 as 1
        li   $t3,2               #initialized value of $t3 as 2          
        li   $t1,0

iniarr: beq  $t0,$s0,loop        #condition check
        sw   $s2,($s2)           #arr[i] = adderess of arr[i]     
        sw   $t2,0($s2)          #giving data in register $t2 into array
        sw   $s3,($s3)           #brr[i] = adderess of brr[i]    
        sw   $t3,0($s3)           
        addi $t2,$t2,3          
        addi $t3,$t3,4          
        addi $s2,$s2,4            
        addi $s3,$s3,4            
        addi $t0,$t0,1                 
        b    iniarr              

loop:   beq  $t1,$s0,END        
        lw $t4,0($s4)                   
        sw $s5,0($s4)           
        lw $t5,0($s5)            
        sw $t4,0($s5)            
        addi $s4,$s4,4           
        addi $s5,$s5,4           
        addi $t1,$t1,1
        b    loop
         


END:
        jr $ra
