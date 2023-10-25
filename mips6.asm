.text
	#vai verificar se os valores estão no intervalo
    lui $a1,0x1001 #pegar um valor de memória escrito em hexadecimal -> TEM 16 BITS, pode armazenar 4 palavras
    addi $a1,$a1,0x0000 #insere valor - uso add só pra armazenar o resto da palavra que não coube
    lui $a2,0x1001
    addi $a2,$a2,0x0020
    add $t6, $zero, $zero #contador das copias feitas, ele é acumula 2 de par em par de palavras copiadas

    # -1020 < a1 < -5 && 50 < a2 < 150 )

Proc:

    addi $t1,$zero,-1021 #//armazena os intervalos 
    addi $t2,$zero,-4
    addi $t0,$zero,49
    addi $t4,$zero,151
loop:   
    #funciona com 4 valores, vendo de dupla em dupla a primeira será do primeiro intervalo e a segunda do segundo intervalo 
    lw $s0, 0($a1) #lê o que foi colocado na posição 0 da pilha a1, e armazena em s0 //negativo
    lw $s1, 4($a1) #positivo
    lw $s2, 8($a1) #negativo
    lw $s3, 12($a1) #positivo
    
    #verificar se os nums estão no intervalo:
    
    slt $t5,$t1,$s0 #//se a1 for menor que t1, t5 é 1; precisa ser maior, ent t5 é zero enquanto estiver no loop
    beq $t5,$zero,Exit #//se t5 for igual de zero, vai pro exit
    
    slt $t5,$s0,$t2 #//
    beq $t5,$zero,Exit #//se for zero, vai pro exit
    
    slt $t5,$t0,$s1 #//mesma coisa com a outra palavra	
    beq $t5,$zero,Exit
    
    slt $t5,$t4,$s1
    bne $t5,$zero,Exit
    
    slt $t5,$t1,$s2 #//se a1 for menor que t1, t5 é 1; precisa ser maior, ent t5 é zero enquanto estiver no loop
    beq $t5,$zero,Exit #//se t5 for igual de zero, vai pro exit
    
    slt $t5,$s2,$t2 #//
    beq $t5,$zero,Exit #//se for zero, vai pro exit
    
    slt $t5,$t0,$s3 #//mesma coisa com a outra palavra	
    beq $t5,$zero,Exit
    
    slt $t5,$t4,$s3
    bne $t5,$zero,Exit  
    
    #se tudo estiver certo, os valores em a1 são armazenados na outra pilha (a2)
    
    sw $s0, 0($a2)
    sw $s1, 4($a2)
    addi $t6, $t6, 2 #adiciona no contador
    sw $s2, 8($a2)
    sw $s3, 12($a2)
    addi $a1, $a1, 4 #para percorrer a pilha a1
   # addi $a2, $a2, 8 
    addi $t6, $t6, 2 #adiciona no contador
    j loop
Exit:  
	add $v0,$zero,$t6
	
