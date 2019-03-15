        .data
res:    .space 20                #reserve a block of 5 bytes       
 
.text
main:
li $t0,4294967295                #entry of 1st number from $t0 to $t3
li $t1,2147483648
li $t2,4294967295  
li $t3,2147483648
li $t4,2147483648                #entry of 2nd number from $t4 to $t7
li $t5,4294967295  
li $t6,2147483648
li $t7,4294967295   
li $t8,0                         #carry out
li $s4,0                         #overflowed carry out
li $s0,0                         #for $t0 + $t4
li $s1,0                         #for $t1 + $t5
li $s2,0                         #for $t2 + $t6
li $s3,0                         #for $t3 + $t7
la $s5,res


addu  $s0,$t0,$t4                # adding 1st 32bit from right and keeping in $s0
sltu  $t8,$s0,$t4                # checking for carry out
addu  $t1,$t1,$t8                # adding carry to $t1
addu  $s1,$t1,$t5                
sltu  $t8,$s1,$t5                # checking for carry out
addu  $t2,$t2,$t8
addu  $s2,$t2,$t6
sltu  $t8,$s2,$t6                # checking for carry out
addu  $t3,$t3,$t8
addu  $s3,$t3,$t7
sltu  $s4,$s3,$t7                # checking for carry out



li    $t0,$zero                  # made $t == 0                
sw    $s4,res($t0)               # storing final resultant sum into array res
addi  $t0,$t0,4
sw    $s3,res($t0)
addi  $t0,$t0,4
sw    $s2,res($t0)
addi  $t0,$t0,4
sw    $s1,res($t0)
addi  $t0,$t0,4
sw    $s0,res($t0)





jr $ra  
.end main 

