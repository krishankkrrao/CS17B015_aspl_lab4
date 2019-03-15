main:
li $s0, 20
li $t0, 0
li $t1, 0
li $t4, 0
LOOP: andi  $t2,$s0, 1
      add   $t0,$t0, $t2
      bne   $t2,$t4, EXIT
      addi  $t1,$t1,1

EXIT: srl   $s0,$s0,1      
      bne   $s0,$zero,LOOP
