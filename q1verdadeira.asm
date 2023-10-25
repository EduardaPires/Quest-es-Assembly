.data #� para armazenar valores na mem�ria RAM
	arrayCirc: # array com as notas de circuitos
		.align 2 # align diz respeito ao tipo do array; ex: align 2 � int, align 3 � float
		.space 12 # � o tamanho; 12/3 - cada palavra tem 4 bits, logo, cada palavra ocupa 4 bits (array de 3 posi��es - 0,1,2,3-)
.text # � tipo a main - � o desenvolvimento do c�digo
	jal trocaNotas #jal � pra chamar fun��o / o m�todo - e a fun��o que est� sendo chamada � a trocaNotas
	li $v0, 10 # o li chama a instru��o syscall, que para o programa, com o 10 finaliza o programa - isso j� � predefinido do mars 10 � exit
	syscall # serve para chamar o li - que nem o jal chama o m�todo- primeiro passa o que vc quer no li e depois chama o li no syscall para executar
	
	trocaNotas:

        # essa primeira rodada de addi s�o os valores fict�cios do array de arquitetura em cada registrador
	addi $t0, $zero, 1 
	addi $t1, $zero, 2
	addi $t2, $zero, 3
	addi $t3, $zero, 4
	
	# a pilha � pra armazenar os valores - nesse caso os do array de arquitetura-
	addi $a0, $a0, -16 # estamos abrindo a pilha aqui (4 x 4 - pq em cada posi��o da pilha tem 4 bits)
	sw $t0, 0($a0) # ele salva/aramazena o valor que est� em t0, na posi��o 0 da pilha a0, logo est� armazenando  o valor 1 na pilha a0
	sw $t1, 4($a0) # ele salva/ armazena o valor que est� em t1, na posi��o 4 da pilha a0, logo est� armazenando o valor 2 na pilha a0
	sw $t2, 8($a0) # ele salva/ armazena o valor que est� em t2, na posi��o 8 da pilha a0, logo est� armazenando o valor 3 na pilha a0
	sw $t3, 12($a0) 
	addi $a0, $a0, 16 # estamos fechando a pilha aqui
	
	# segunda rodada de addi s�o os valores fict�cios do array de circuitos em cada registrador
	addi $t0, $zero, 4
	addi $t1, $zero, 3
	addi $t2, $zero, 2
	addi $t3, $zero, 1
	
	add $t4, $zero, $zero #zera contador pra come�ar a armazenar na posi��o zero do array
	
	
	sw $t0, arrayCirc($t4) # armazena o que t� em t0 na posicao t4 do array - que nesse caso � zero-
	addi $t4, $t4, 4   
	sw $t1, arrayCirc($t4) # armazena o que t� em t1 na posic�o t4 do array - que nesse caso � quatro-
	addi $t4, $t4, 4
	sw $t2, arrayCirc($t4)
	addi $t4, $t4, 4
	sw $t3, arrayCirc($t4) 
	
	addi $a0, $a0, -16 # abrindo a pilha pra poder pegar os valores que j� foram armazenados na pilha a0
	 # aqui nos lw estamos lendo o que est� em cada posi��o e armazenando nos registrados de t0 at� t3
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
	
	move $t4, $zero # move est� setando o contador - cont das posi��es do array - para zero (esse contador � para pegar a posi��o do array de 4 em 4)
	
	# aqui estamos lendo os valores do array de circuitos e colocando os valores de cada posicao do em t0 at� t3
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
	
	move $t4, $zero # seta o contador pra zero denovo para poder percorrer o array do in�cio
	
	sw $t0, arrayCirc($t4) # est� salvando os valores de arquitetura no array de circuitos
	addi $t4, $t4, 4
	sw $t1, arrayCirc($t4)
	addi $t4, $t4, 4
	sw $t2, arrayCirc($t4)
	addi $t4, $t4, 4
	sw $t3, arrayCirc($t4)
	
	jr $ra # para poder ele sair do m�todo, ele vai pra quem chamou - ou seja, vai pro jal-