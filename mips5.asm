.text
.globl main
main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $s1, $v0

    move $a0, $s0
    move $a1, $s1
    jal pot
    move $s2, $v0

    li $v0, 4
    la $a0, resultPrompt
    syscall

    move $a0, $s2
    li $v0, 1
    syscall
    
    li $v0, 10
    syscall

.globl pot
pot:
    addiu $sp, $sp, -12
    sw $ra, 8($sp)
    sw $a0, 4($sp)
    sw $a1, 0($sp)

    beqz $a0, end
    beqz $a1, one

    li $v0, 1

loop:
    lw $t0, 4($sp)
    mul $v0, $v0, $t0
    
    lw $t1, 0($sp)
    addiu $t1, $t1, -1
    sw $t1, 0($sp)
    
    bgtz $t1, loop

    lw $ra, 8($sp)
    addiu $sp, $sp, 12
    jr $ra

one:
    li $v0, 1
    j end

end:
    lw $ra, 8($sp)
    addiu $sp, $sp, 12
    jr $ra
    
.data
    prompt1: .asciiz "Ingrese la base: "
    prompt2: .asciiz "Ingrese el exponente: "
    resultPrompt: .asciiz "El resultado es: "