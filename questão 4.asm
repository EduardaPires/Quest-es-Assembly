 start: addi $s0, $zero, 1 #contador começando como 1
        add $t2, $zero, $zero ## contador de interações

    loop: ## carregando o primeiro valor do vetor que esta a0 e armazenando em t0 
    	lw $t0, 0($a0) #carregar primeiro valor do vetor a0 em t0
        slti $t1, $s0, 9 #pra que haja 10 nums (faz div enquanto for menor)
        beq $t1, $zero, divisao #só entra na div quando os valores forem carregados
        add $t3, $t3, $t0 ## acumulador dos valores de a0 em t2
        add $s0, $s0, 1 
        addi $a0, $a0, 4 #soma com 4 pra pular espaço da memória de bit em bit
        j loop

    divisao:slti $t4, $t3, 8
        bne $t4, $zero, exit
        addi $t2, $t2, 1 ## valor da divisao
        subi $t3, $t3, 8 ## resto 
        j divisao

    exit: add $v0, $t3, $zero
    add $v1, $t2, $zero
    jr $ra
