.data
high:    .space 128                #reserve a block of 128 bytes       
low:   .space 128               
 .text
main:
li $t0,-1431655766           # multiplicand
li $t1,-1431655766           # multiplier
li $t2,0                     # i counter
li $t3,32                    # '32-i' counter
la $s1,low                   # low kaa base adderess
la $s2,high                  # high kaa base adderess
li $t4,0                     # carry out
li $t8,0                     # final high
li $t9,0                     # final low


LOOP1:
      beq  $t3,$zero,END     # condition check
      andi $t5,$t1,1         # logical bitwise and
      beq  $t5,1,LOOP2       # branching condition
      beq  $t5,0,LOOP3       # branching condition      
LOOP2:
      move  $t6,$t0          # move value $t0 into $t6
      sllv  $t6,$t6,$t2      # shift left by value of $t2
      move  $t7,$t0          
      srlv  $t7,$t7,$t3      # shift right by value of $t2
      addu  $t8,$t8,$t6      
      sltu  $t4,$t8,$t6     
      addu  $t9,$t9,$t7
      addu  $t9,$t9,$t4  
      sw   $t6,0($s1)       #giving data in register $t6 into array
      sw   $t7,0($s2)       #giving data in register $t7 into array
      addi $s1,$s1,4
      addi $s2,$s2,4  
      j COUNTER
      
LOOP3:
      li   $t6,0
      li   $t7,0 
      addu  $t8,$t8,$t6
      sltu  $t4,$t8,$t6
      addu  $t9,$t9,$t7
      addu  $t9,$t9,$t4 
      sw   $t6,0($s1)
      sw   $t7,0($s2) 
      addi $s1,$s1,4
      addi $s2,$s2,4
      j COUNTER

COUNTER:
      srl  $t1,$t1,1
      addi  $t2,$t2,1
      addi  $t3,$t3,-1  
      j LOOP1
      
END:

     jr $ra  
     .end main 

