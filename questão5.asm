#A =$A0,  B = $A1,  X = $A2  e Y  = $A3,
# (A/(B*Y))^X
 
   addi $sp,$sp,-12
     sw $a0,0($sp)
     sw $a3,4($sp)
     sw $ra,8($sp)
     add $a0,$zero,$a1
     add $a1,$zero,$a3
     jal Mult
     lw $a0,0($sp)
     lw $a3,4($sp)
     lw $ra,8($sp)
     addi $sp,$sp,12
     add $a3,$zero,$v0
     add $a1,$zero,$a0 #a2 deve ser recuperado!
     jal Div
     add $a0,$zero,$v0
     add $v0,$zero,$zero
     add $a3,$zero,$a2
     jal Pot
     jr $ra
 
Mult: add $t0,$zero,$zero # contador
loop:    slt $t1,$t0,$a1
     beq $t1,$zero,Exit
     addi $t0,$t0,1
     add $v0,$v0,$a0
     j loop
Exit:  jr $ra
 
Div: add $t0,$zero,$zero #a3/a2
loop2: slti $t1,$a1, 1
      bne $t1,$zero,Exit2
      addi $t0,$t0,1
      sub $a1,$a1,$a3
      add $v0, $zero, $t0
      j loop2
Exit2: jr $ra

Pot: addi $t2,$zero,1   # contador potenciacao -> ver casos de x ser zero e dar 1
loop3:slt $t3,$t2,$a3
    beq $t3,$zero,Exit3
    add $a0,$zero,$a0
    add $a1,$zero,$a0
    jal Mult
     addi $t2,$t2,1
    add $v0,$zero,$v0
     j loop3
Exit3:  
 
   
