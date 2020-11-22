.data
msg1:.asciiz"\nDigite seu salario: "
msg2:.asciiz"\nFaixa 1 - Isento"
msg3:.asciiz"\nFaixa 2 - 7.5% = R$"
msg4:.asciiz"\nFaixa 3 - 15% = R$ "
msg5:.asciiz"\nFaixa 4 - 22.5% = R$ "
msg6:.asciiz"\nFaixa 5 - 27.5% = R$ "
msg7:.asciiz"\nImposto: "
msg8:.asciiz"\nSalario c/ desconto: "

n1:.float 0.075
n2:.float 0.15
n3:.float 0.225
n4:.float 0.275

n5:.float 1903.98
n6:.float 2826.65
n7:.float 3751.05
n8:.float 4664.68

.text

# DESCONTOS
l.s $f2, n1
l.s $f3, n2
l.s $f4, n3
l.s $f5, n4

# SALARIO PARA VERIFICAR
l.s $f6, n5
l.s $f7, n6
l.s $f8, n7
l.s $f9, n8


# Digitando salario 
li $v0, 4
la $a0, msg1
syscall

li $v0, 6
syscall
mov.s $f1, $f0

# Calcula Faixa --------------------------------------

# FAIXA 1
sub.s $f20, $f7, $f6
mul.s $f21, $f2, $f20

# --------------------------------------

# FAIXA 2
sub.s  $f22, $f8, $f7
mul.s $f23, $f3, $f22
add.s $f24, $f21, $f23

# --------------------------------------

# FAIXA 3
sub.s $f25, $f9, $f8
mul.s $f26, $f4, $f25
add.s $f27, $f24, $f26

# --------------------------------------

# FAIXA 4
sub.s $f28, $f1, $f9
mul.s $f29, $f5, $f28
add.s $f30, $f27, $f29

# --------------------------------------

# Imprimindo FAIXA 1 --------------------------------------
c.le.s $f1, $f6
bc1t se1
bc1f senao1

se1:
li $v0, 4
la $a0, msg2
syscall 

j fimse

senao1:

# Imprimindo FAIXA 2 --------------------------------------
c.le.s $f1, $f7
bc1t se2
bc1f senao2

se2:
li $v0, 4
la $a0, msg2
syscall 

li $v0, 4
la $a0, msg3
syscall 

li $v0, 2
mov.s $f12, $f21
syscall 

li $v0, 4
la $a0, msg7
syscall 

li $v0, 2
mov.s $f12, $f21
syscall 

li $v0, 4
la $a0, msg8
syscall 

sub.s $f1, $f1, $f21

li $v0, 2
mov.s $f12, $f1
syscall 

j fimse

senao2:

# Imprimindo FAIXA 3 --------------------------------------
c.le.s  $f1, $f8
bc1t se3
bc1f senao3

se3:
li $v0, 4
la $a0, msg2
syscall 

li $v0, 4
la $a0, msg3
syscall 

li $v0, 2
mov.s $f12, $f21
syscall

li $v0, 4
la $a0, msg4
syscall 

li $v0, 2
mov.s $f12, $f23
syscall

li $v0, 4
la $a0, msg7
syscall 

li $v0, 2
mov.s $f12, $f24
syscall

li $v0, 4
la $a0, msg8
syscall 

sub.s $f1, $f1, $f24

li $v0, 2
mov.s $f12, $f1
syscall 

j fimse

senao3:

# Imprimindo FAIXA 4 --------------------------------------

c.le.s $f1, $f9
bc1t se4
bc1f senao4

se4:

li $v0, 4
la $a0, msg2
syscall 

li $v0, 4
la $a0, msg3
syscall 

li $v0, 2
mov.s $f12, $f21
syscall

li $v0, 4
la $a0, msg4
syscall

li $v0, 2
mov.s $f12,  $f23
syscall

li $v0, 4
la $a0, msg5
syscall 

li $v0, 2
mov.s $f12,  $f26
syscall

li $v0, 4
la $a0, msg7
syscall 

li $v0, 2
mov.s $f12, $f27
syscall

li $v0, 4
la $a0, msg8
syscall 

sub.s $f1, $f1, $f27

li $v0, 2
mov.s $f12, $f1
syscall

j fimse

senao4:

# Imprimindo FAIXA 5 --------------------------------------

li $v0, 4
la $a0, msg2
syscall 

li $v0, 4
la $a0, msg3
syscall 

li $v0, 2
mov.s $f12, $f21
syscall

li $v0, 4
la $a0, msg4
syscall

li $v0, 2
mov.s $f12,  $f23
syscall

li $v0, 4
la $a0, msg5
syscall 

li $v0, 2
mov.s $f12,  $f26
syscall

li $v0, 4
la $a0, msg6
syscall 

li $v0, 2
mov.s $f12, $f29
syscall

li $v0, 4
la $a0, msg7
syscall 

li $v0, 2
mov.s $f12, $f30
syscall

li $v0, 4
la $a0, msg8
syscall 

sub.s $f1, $f1, $f30

li $v0, 2
mov.s $f12, $f1
syscall

fimse:
