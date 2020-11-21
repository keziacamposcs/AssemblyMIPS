.data
msg1:.asciiz"Digite sua altura: "
msg2:.asciiz"Digite o seu peso: "
msg3:.asciiz"Resultado: Magreza grave"
msg4:.asciiz"Resultado: Magreza moderada"
msg5:.asciiz"Resultado: Magreza leve"
msg6:.asciiz"Resultado: Saudavel"
msg7:.asciiz"Resultado: Sobrepeso"
msg8:.asciiz"Resultado: Obesidade gau 1"
msg9:.asciiz"Resultado: Obesidade grau 2 (severa)"
msg10:.asciiz"Resultado: Obesidade grau 3 (morbida)"


n1:.float 16.0
n2:.float 17.0
n3:.float 18.5
n4:.float 25.0
n5:.float 30.0
n6:.float 35.0
n7:.float 40.0

.text

main:

l.s $f5, n1
l.s $f6, n2
l.s $f7, n3
l.s $f8, n4
l.s $f9, n5
l.s $f10, n6
l.s $f11, n7

#	altura
li $v0, 4
la $a0, msg1
syscall

li $v0, 6
syscall
mov.s $f1, $f0
#-----------------------------------------

#	peso
li $v0, 4
la $a0, msg2
syscall

li $v0, 6
syscall
mov.s $f2, $f0
#-----------------------------------------

#	Calculando IMC

mul.s $f3, $f1, $f1

div.s $f4, $f2, $f3
#-----------------------------------------

# IMC<16 Magreza grave
c.lt.s $f4, $f5
bc1t se1
bc1f senao1

se1:
li $v0, 4
la $a0, msg3
syscall

j fimse

senao1:

# IMC>=16 && IMC<17	Magreza moderada
c.le.s $f4, $f6
bc1t se2
bc1f senao2

se2:
li $v0, 4
la $a0, msg4
syscall

j fimse

senao2:

# IMC>=17 && IMC<18.5	Magreza leve
c.lt.s $f4, $f7
bc1t se3
bc1f senao3

se3:
li $v0, 4
la $a0, msg5
syscall

j fimse

senao3:

# IMC>=18.5 && IMC<25	Saudavel
c.lt.s $f4, $f8
bc1t se4
bc1f senao4

se4:
li $v0, 4
la $a0, msg6
syscall

j fimse

senao4:

# IMC>=25 && IMC<30	 Sobrepeso
c.lt.s $f4, $f9
bc1t se5
bc1f senao5

se5:
li $v0, 4
la $a0, msg7
syscall

j fimse

senao5:

# IMC>=30 && IMC<35	 Obesidade grau 1
c.lt.s $f4, $f10
bc1t se6
bc1f senao6

se6:
li $v0, 4
la $a0, msg8
syscall

j fimse

senao6:

# IMC>=35 && IMC<40	 Obesidade grau 2
c.lt.s $f4, $f11
bc1t se7
bc1f senao7

se7:
li $v0, 4
la $a0, msg9
syscall

j fimse

senao7:

# IMC>=40	 Obesidade grau 3
li $v0, 4
la $a0, msg10
syscall

fimse: