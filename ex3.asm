.data

msg1: .asciiz"\nIr para direita!"
msg2: .asciiz"\nIr para esquerda!"
msg3: .asciiz"\nDigite o número do quarto: "

.text

main:
li $v0, 4
la $a0, msg3
syscall

li $v0, 5
syscall

add $t1, $v0, $zero
rem $t2, $t1, 2
beq $t2, 0, se

j senao

se:

li $v0, 4
la $a0, msg1
syscall

j fimse

senao:

li $v0, 4
la $a0, msg2
syscall

fimse:
