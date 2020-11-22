.data
msg1:.asciiz"\nDigite o valor da venda: "
msg2:.asciiz"\nSalario final eh R$1200,00  + R$"


n1:.float 0.0
n2:.float 1500
n3:.float 0.1
n4:.float 0.2

.text

l.s $f2, n1
l.s $f3, n2
l.s $f4, n3
l.s $f5, n4

#Printf
li $v0, 4
la $a0, msg1
syscall 

# Scanf
li $v0, 6
syscall
mov.s $f1, $f0

# se venda = 0
c.eq.s $f1, $f2
bc1t se1
bc1f senao1

se1:
li $v0, 4
la $a0, msg2
syscall 

li $v0, 2
mov.s $f12, $f2
syscall 

j fimse

senao1:
# se venda <= 1500
c.le.s $f1, $f3
bc1t se2
bc1f senao2


se2:
mul.s $f6, $f1, $f4

# Printf
li $v0, 4
la $a0, msg2
syscall

li $v0, 2
mov.s $f12, $f6
syscall

j fimse

senao2:
mul.s $f6, $f3, $f4
sub.s $f7 ,$f1, $f3
mul.s $f8, $f7, $f5
add.s $f9, $f6, $f8

li $v0, 4
la $a0, msg2
syscall

li $v0, 2
mov.s $f12, $f9
syscall

fimse:
