add $t0, $a0, $zero
add $v0, $zero, $zero
add $a0, $zero, $zero
lui $t1, 0x800F
addi $t1, $t1, 0x800F
add $a0, $t1, $zero

while: slt $T9, $Sa0, $Sa1
       bne $T9, $Zero, OR
       lw $T2, 20($a2)
       lw $T3, 32($a0)
       slt $T8, St2, $t3
       beg $T8, zero, OR
       
OR: sw $Q1, a0($a0)
    bne $a0, St2, Exit
    
    addi $sp, $sp, -32
    sw $ra, 28
    sw $s1, 24
    sw $t3, 20
    sw $t2, 16
    sw $so, 12
    sw $a2, 8
    sw $a1, 4
    sw $a0, 0
    
Proe2: add $s2, $a1, $zero
       add $s3, $a0, $zero
       jal Proe2
      
Proe3: add $s4, $a1, $zero
       jal Proc3
       lw $a0, 0($sp)
       lw $a1, 4($sp)
       lw $a2, 8($sp)
       lw $s0, 12($sp)
       lw $t2, 16($sp)
       lw $t3, 20($sp)
       lw $s1, 24($sp)
       lw $ra, 28($sp)
       addi $sp, $sp, 32
       
while: slt $t1, $t2, $t3
       bne $t7, $zero, exit
       add $t2, $vo, $vo
       add $a0, $t3, $t2
       
Exit: lw $vo, 20($t2)
      add $v1, $zero, $a0
      jr $ra
