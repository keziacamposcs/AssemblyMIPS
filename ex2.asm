.data
msg1:.asciiz"\nDigite seu salario: "
msg2:.asciiz"\nSalario liquido: "
msg3:.asciiz"\nDesconto: "
msg4:.asciiz"\n\n\n: "
msg5:.asciiz"\nNao se aplica... "


n1:.float 0.08
n2:.float 0.09
n3:.float 0.11
n4:.float 1659.38
n5:.float 2765.66
n6:.float 5531.31

.text

# DESCONTOS
l.s $f2, n1
l.s $f3, n2
l.s $f4, n3

# SALARIO PARA VERIFICAR
l.s $f5, n4
l.s $f6, n5
l.s $f7, n6


# Digitando salario
li $v0, 4
la $a0, msg1
syscall

li $v0, 6
syscall
mov.s $f1, $f0

# Salario < 1659.38
c.lt.s $f1, $f5
bc1t se1
bc1f senao1

se1:
mul.s $f8, $f1, $f2
sub.s $f9, $f1, $f8

li $v0, 4
la $a0, msg3
syscall 

li $v0, 2
mov.s $f12, $f8
syscall 

li $v0, 4
la $a0, msg2
syscall 

li $v0, 2
mov.s $f12, $f9
syscall 

j fimse

senao1:

# Salario >= 1659.38 && Salario < 2765.66
c.lt.s $f1, $f6
bc1t se2
bc1f senao2

se2:
mul.s $f8, $f1, $f3
sub.s $f9, $f1, $f8

li $v0, 4
la $a0, msg3
syscall 

li $v0, 2
mov.s $f12, $f8
syscall 

li $v0, 4
la $a0, msg2
syscall 

li $v0, 2
mov.s $f12, $f9
syscall 

j fimse

senao2:

# Salario >= 1659.38 && Salario < 2765.66
c.lt.s $f1, $f7
bc1t se3
bc1f senao3

se3:
mul.s $f8, $f1, $f4
sub.s $f9, $f1, $f8

li $v0, 4
la $a0, msg3
syscall 

li $v0, 2
mov.s $f12, $f8
syscall 

li $v0, 4
la $a0, msg2
syscall 

li $v0, 2
mov.s $f12, $f9
syscall 

j fimse

senao3:
li $v0, 4
la $a0, msg4
syscall 

fimse:
li $v0, 4
la $a0, msg5
syscall 
