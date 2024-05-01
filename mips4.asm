.text
.globl start
start:
	li $t4, -1
	li $v0, 4
	la $a0, prmp01
	syscall
	li $v0, 5
	syscall
	addi $t0, $v0, 0
	li $v0, 4
	la $a0, prmp02
	syscall
	li $v0, 5
	syscall
	addi $t1, $v0, 0
	mult $t0, $t1
	mflo $t2
	mfhi $t3
	bltz $t2, negative
	beq $t3, $zero, can_represent
	j cannot_represent
negative:
	beq $t3, $t4, can_represent
	j cannot_represent
can_represent:
	li $v0, 4
	la $a0, can_represent_msg
	syscall
	li $v0, 1
	addi $a0, $t2, 0
	syscall
	j end
cannot_represent:
	li $v0, 4
	la $a0, cannot_represent_msg
	syscall
end:
	li $v0, 10
	syscall
.data
	cannot_represent_msg: .asciiz "No es posible representar el valor en 32b"
	can_represent_msg: .asciiz "El valor es igual a: "
	prmp01: .asciiz "Ingrese el primer número: "
	prmp02: .asciiz "Ingrese el segundo número: "	