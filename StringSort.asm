	.data
text0:	.asciiz "Enter string to sort: \n"
buf0:	.space 100
	.text
	.globl main
	
main:
	la $a0, text0
	li $v0, 4
	syscall
	la $a0, buf0
	la $a1, 100
	li $v0, 8
	syscall
	
	la $t1, buf0	#t1 - adres poczatkowy
	lb $t2, 1($t1)
	beqz $t2, end	
	
loop:
	move $t2, $t1	#t2 - adres aktualny
	move $t3, $t1	#t3 - adres najmniejszego
	lb $t5, ($t3)	#t5 - wartosc najmniejszego
	
mvAndComp:
	addi $t2, $t2, 1
	lb $t4, ($t2)
	beqz $t4, swap
	blt $t5, $t4, mvAndComp
	move $t3, $t2
	lb $t5, ($t3)
	j mvAndComp
swap:
	lb $t6, ($t1)
	sb $t5, ($t1)
	sb $t6, ($t3)
next:
	addi $t1, $t1, 1
	lb $t2, ($t1)
	beqz $t2, end
	j loop
end:
	li $v0, 4
	la $a0, buf0
	syscall
	li $v0, 10
	syscall
