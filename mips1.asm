.data

	arrayCirc: 
		.align 2
		.space 12

.text
	
	jal trocaNotas
	li $v0, 10
	syscall
	

	trocaNotas:

	addi $t0, $zero, 1
	addi $t1, $zero, 2
	addi $t2, $zero, 3
	addi $t3, $zero, 4
	
	addi $a0, $a0, -16
	sw $t0, 0($a0)
	sw $t1, 4($a0)
	sw $t2, 8($a0)
	sw $t3, 12($a0)
	addi $a0, $a0, 16
	
	addi $t0, $zero, 4
	addi $t1, $zero, 3
	addi $t2, $zero, 2
	addi $t3, $zero, 1
	
	add $t4, $zero, $zero #zera contador pra come�ar a armazenar na pos zero do array
	
	sw $t0, arrayCirc($t4)
	addi $t4, $t4, 4
	sw $t1, arrayCirc($t4)
	addi $t4, $t4, 4
	sw $t2, arrayCirc($t4)
	addi $t4, $t4, 4
	sw $t3, arrayCirc($t4) #ver como fazer dois arrays sem sobrescrever
	
	addi $a0, $a0, -16
	lw $t0, 0($a0)
	lw $t1, 4($a0)
	lw $t2, 8($a0)
	lw $t3, 12($a0)
	addi $a0, $a0, 16
	
	addi $sp $sp, -16
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	add $sp, $sp, 16
	
	move $t4, $zero
	
	lw $t0, arrayCirc($t4)
	addi $t4, $t4, 4
	lw $t1, arrayCirc($t4)
	addi $t4, $t4, 4
	lw $t2, arrayCirc($t4)
	addi $t4, $t4, 4
	lw $t3, arrayCirc($t4)
	
	addi $a0, $a0, -16
	sw $t0, 0($a0)
	sw $t1, 4($a0)
	sw $t2, 8($a0)
	sw $t3, 12($a0)
	addi $a0, $a0, 16
	
	addi $sp, $sp, -16
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	addi $sp, $sp, 16
	
	move $t4, $zero
	
	sw $t0, arrayCirc($t4)
	addi $t4, $t4, 4
	sw $t1, arrayCirc($t4)
	addi $t4, $t4, 4
	sw $t2, arrayCirc($t4)
	addi $t4, $t4, 4
	sw $t3, arrayCirc($t4)
	
	jr $ra