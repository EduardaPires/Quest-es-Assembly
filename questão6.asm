    lui $a1,0x2080 #pegar um valor de memória escrito em hexadecimal -> TEM 16 BITS, pode armazenar 4 palavras
    addi $a1,$a1,0x00 /#nsere valor - uso add só pra armazenar o resto da palavra que não coube
    lui $a2,0x3208 #
    addi $a2,$a2,0xFF0 #

   # ( -1020 < a1 < -5 && 50 < a2 < 150 )

Proc:

    addi $t1,$zero,-1020 #intervalos 
    addi $t2,$zero,-5
    addi $t0,$zero,50
    addi $t4,$zero,150
loop:    add $a1,$a1,$a1 #a1*2 //tem que ser repetida até preencher todo o intervalo de memória
    add $a2,$a2,$a2 #a2*2
    slt $t5,$a1,$t1 #se a1 for menor que t1, t5 é 1; precisa ser maior, ent t5 é zero enquanto estiver no loop
    bne $t5,$zero,Exit #se t5 for diferente de zero, vai pro exit
    slt $t5,$a1,$t2 
    beq $t5,$zero,Exit #se for zero, vai pro exit
    slt $t5,$a2,$t0 #mesma coisa com a outra palavra
    bne $t5,$zero,Exit
    slt $t5,$a1,$t4
    beq $t5,$zero,Exit
    j loop
Exit:  add $v0,$v0,$a1 
    add $v0,$v0,$a2 #pede no enunciado; elas só se sobrecreveriam se fosse v0, zero, ax, mas é v0, v0, ax
    jr $ra
