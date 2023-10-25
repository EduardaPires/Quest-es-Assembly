.text
	addi $a1, $zero, 445
	addi $t2, $zero, 820 # Armazena 820 em $t2
	addi $s0, $zero, -10 # Armazena -10 em $s0
	addi $t0, $zero, 0   # Armazena 0 em $t0
	addi $t1, $zero, 1   # Armazena 1 em $t1
	addi $t4, $zero, 0   # Armazena 0 em $t4
	addi $s1, $zero, 15  # Armazena 15 em $s1
	and $t3, $a1, $t1    # t3 só será 1 se os 2 valores forem ímpares, a1 e t1. Verifica se a entrada logia entre $a1 e $t1 e vê o bit mais a direita e armazena em $t3
	beq $t3, $zero, termine #Verifica se o $t3 é igual a zero se for termina o programa 
	slt $t3, $a1, $t2    # Verifica se $a1 é maior que $t2 se for $t3 igual a 0 se não retorna 1
	beq $t3, $zero, termine # Verifica se $t3 é igual a zero se for termina o programa
	
	loop: 
		slt $t3, $s1, $a1 # Verifica se $s1 é menor que $a1 se for $t3 é igual a 1 se não é igual a 0
		beq $t3, $zero, termine # Verifica se $t3 é igual se for termina o programa 
		add $t0, $t0, $s1 # Faz a soma entre $t0 + $s1
		addi $s1, $s1, 15 # Faz a soma de 15 em 15 em $s1
		addi $t4, $t4, 1 # Faz a soma de 1 em 1 em $t4
		j loop
		
	termine:
		add $v0, $t0, $zero #Pega o valor de $t0 em e coloca em %v0
		add $v1, $t4, $zero #Pega o valor de $t4 e armazena em $v1
		
		# O programa verifica se dois valores forem impar se for verifica se um é maior que o outro se for menor ele faz a progressão aritmetica ate o número ser maior ou igual.
		
		
		
		
