.data 
	vetorC:
		.align 2 #quando os valores são int é 2
		.space 12 #tamanho do array
.text
	
	add $t7, $zero, $zero #contador pra percorrer array
	addi $t0, $zero, 1 #valores (que devem ser de 0 a 4, pelo que a questão pede)
	addi $t1, $zero, 2
	addi $t2, $zero, 3
	
	addi $a1, $a1, -12 #Pilha de A -> a1 para armazenar os valores do array A
	sw $t0, 0($a1) #pega o valor que está em t0 e joga na pos 0 da pilha a1
	sw $t1, 4($a1)
	sw $t2, 8($a1)
	addi $a1, $a1, 12 #fecha pilha
	
	 addi $t0, $zero, 0 #valores que serão inseridos na pilha B (sp)
	 addi $t1, $zero, 2
	 addi $t2, $zero, 4
	 
	 #estamos fazendo 2 pilhas para depois comparar os valores de A e B, os valores de A em que A > B serão armazenados em C e vice versa com B
	 # A é crescente e B é decrescente
	 addi $sp, $sp, -12 #Pilha de B -> será armazenada em sp
	 sw $t0, 0($sp)
	 sw $t1, 4($sp)
	 sw $t2, 8($sp)
	 addi $sp, $sp, 12
	 
	 add $t4, $zero, $zero
	 
	 addi $a1, $a1, -12 #abrindo pilha apenas para acessar valores
	 lw $t5, 0($a1) #pega o primeiro valor da pilha A e armazena em t5
	 jal verificarValorA #vai dar erro durante as comparações
	 addi $a1, $a1, 12 #fechando pilha
	 
	 addi $sp, $sp, -12
	 lw $t6, 8($sp) #pega ultimo valor da pilha B e armazena em t6
	 jal verificarValorB #vai dar erro durante as comparações
	 addi $sp, $sp, 12
	 
	 jal comparacao #realiza comparação dos valores (de dupla em dupla), varrendo A de maneira crescente e B descrescente
	 
	 addi $a1, $a1, -12
	 lw $t5, 4($a1) #armazenando segundo elemento de A em t5
	 jal verificarValorA #vai dar erro durante as comparações
	 addi $a1, $a1, 12
	 
	 addi $sp, $sp, -12
	 lw $t6, 4($sp) #segundo elemento de B em t6
	 jal verificarValorB #vai dar erro durante as comparações
	 addi $sp, $sp, 12
	 
	 jal comparacao
	 
	 addi $a1, $a1, -12
	 lw $t5, 8($a1) #ultimo valor da pilha A em t5
	 jal verificarValorA #vai dar erro durante as comparações
	 addi $a1, $a1, 12
	 
	 addi $sp, $sp, -12
	 lw $t6, 0($sp) #primeiro valor da pilha de B em t5
	 jal verificarValorB #vai dar erro durante as comparações
	 addi $sp, $sp, 12
	 
	 jal comparacao

	 li $v0, 10 #encerra o programa
	 jr $ra	 
	 
	 comparacao:
	 	
	 	bgt $t5, $t6, adcA #maior que, se t5 for maior que t6, adiciona o elemento de A em C
	 	blt $t5, $t6, adcB #menor que, se t5 for menor que t6, adiciona o elemento de B em C
	 	beq $t5, $t6, adc0 #se for igual, adc 0
	 	
	 adc0:
	 	
	 	sw $zero, vetorC($t7) #carrega valor de 0 e armazena na pilha C; t7 é o contador, que irá armazenar cada pos de C
	 	addi $t7, $t7, 4 #acumula no contador 
	 	jr $ra
	 		
	 adcA:
	 	
	 	sw $t5, vetorC($t7) #carrega valor de t5 e armazena na pilha C; t7 é o contador, que irá armazenar cada pos de C
	 	addi $t7, $t7, 4 #acumula no contador 
	 	jr $ra
	 	
	 adcB:
	 	
	 	sw $t6, vetorC($t7) #carrega valor de t6 e armazena na pilha C; t7 é o contador, que irá armazenar cada pos de C
	 	addi $t7, $t7, 4
	 	jr $ra
	 	
	 verificarValorA: #se o valor for maior que 4, ele não é aceita e o programa é finalizado
	 
	 	bgt $t5, 4, sairProg
	 	jr $ra
	 	
	verificarValorB:
	 
	 	bgt $t6, 4, sairProg
	 	jr $ra
	 	
	 sair:
	 	
	 	jr $ra
	 	
	 sairProg:
	 
	 	li $v0, 10
	 	syscall