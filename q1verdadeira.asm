.data #é para armazenar valores na memória RAM
	arrayCirc: # array com as notas de circuitos
		.align 2 # align diz respeito ao tipo do array; ex: align 2 é int, align 3 é float
		.space 12 # é o tamanho; 12/3 - cada palavra tem 4 bits, logo, cada palavra ocupa 4 bits (array de 3 posições - 0,1,2,3-)
.text # é tipo a main - é o desenvolvimento do código
	jal trocaNotas #jal é pra chamar função / o método - e a função que está sendo chamada é a trocaNotas
	li $v0, 10 # o li chama a instrução syscall, que para o programa, com o 10 finaliza o programa - isso já é predefinido do mars 10 é exit
	syscall # serve para chamar o li - que nem o jal chama o método- primeiro passa o que vc quer no li e depois chama o li no syscall para executar
	
	trocaNotas:

        # essa primeira rodada de addi são os valores fictícios do array de arquitetura em cada registrador
	addi $t0, $zero, 1 
	addi $t1, $zero, 2
	addi $t2, $zero, 3
	addi $t3, $zero, 4
	
	# a pilha é pra armazenar os valores - nesse caso os do array de arquitetura-
	addi $a0, $a0, -16 # estamos abrindo a pilha aqui (4 x 4 - pq em cada posição da pilha tem 4 bits)
	sw $t0, 0($a0) # ele salva/aramazena o valor que está em t0, na posição 0 da pilha a0, logo está armazenando  o valor 1 na pilha a0
	sw $t1, 4($a0) # ele salva/ armazena o valor que está em t1, na posição 4 da pilha a0, logo está armazenando o valor 2 na pilha a0
	sw $t2, 8($a0) # ele salva/ armazena o valor que está em t2, na posição 8 da pilha a0, logo está armazenando o valor 3 na pilha a0
	sw $t3, 12($a0) 
	addi $a0, $a0, 16 # estamos fechando a pilha aqui
	
	# segunda rodada de addi são os valores fictícios do array de circuitos em cada registrador
	addi $t0, $zero, 4
	addi $t1, $zero, 3
	addi $t2, $zero, 2
	addi $t3, $zero, 1
	
	add $t4, $zero, $zero #zera contador pra começar a armazenar na posição zero do array
	
	
	sw $t0, arrayCirc($t4) # armazena o que tá em t0 na posicao t4 do array - que nesse caso é zero-
	addi $t4, $t4, 4   
	sw $t1, arrayCirc($t4) # armazena o que tá em t1 na posicão t4 do array - que nesse caso é quatro-
	addi $t4, $t4, 4
	sw $t2, arrayCirc($t4)
	addi $t4, $t4, 4
	sw $t3, arrayCirc($t4) 
	
	addi $a0, $a0, -16 # abrindo a pilha pra poder pegar os valores que já foram armazenados na pilha a0
	 # aqui nos lw estamos lendo o que está em cada posição e armazenando nos registrados de t0 até t3
	lw $t0, 0($a0)
	lw $t1, 4($a0)
	lw $t2, 8($a0)
	lw $t3, 12($a0)
	addi $a0, $a0, 16 #fechando a pilha
	
	addi $sp $sp, -16 # abrimos essa pilha para armazenar temporariamente os valores de arquitetura na pilha sp
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	add $sp, $sp, 16
	
	move $t4, $zero # move está setando o contador - cont das posições do array - para zero (esse contador é para pegar a posição do array de 4 em 4)
	
	# aqui estamos lendo os valores do array de circuitos e colocando os valores de cada posicao do em t0 até t3
	lw $t0, arrayCirc($t4) 
	addi $t4, $t4, 4
	lw $t1, arrayCirc($t4)
	addi $t4, $t4, 4
	lw $t2, arrayCirc($t4)
	addi $t4, $t4, 4
	lw $t3, arrayCirc($t4)
	
	addi $a0, $a0, -16 # abrimos a pilha para armazenar os valores de circuitos em arquitetura
	sw $t0, 0($a0)
	sw $t1, 4($a0)
	sw $t2, 8($a0)
	sw $t3, 12($a0)
	addi $a0, $a0, 16
	
	addi $sp, $sp, -16 # abrimos a pilha para pegar os valores de arquitetura que foram salvos temporariamente em sp
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	addi $sp, $sp, 16
	
	move $t4, $zero # seta o contador pra zero denovo para poder percorrer o array do início
	
	sw $t0, arrayCirc($t4) # está salvando os valores de arquitetura no array de circuitos
	addi $t4, $t4, 4
	sw $t1, arrayCirc($t4)
	addi $t4, $t4, 4
	sw $t2, arrayCirc($t4)
	addi $t4, $t4, 4
	sw $t3, arrayCirc($t4)
	
	jr $ra # para poder ele sair do método, ele vai pra quem chamou - ou seja, vai pro jal-