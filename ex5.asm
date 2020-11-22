.data
msg1: .asciiz"\nDigite a largura da piscina (em metros): "
msg2: .asciiz"\nDigite o altura da piscina (em metros): "
msg3: .asciiz"\nDigite o comprimeno da piscina (em metros): "

msg4: .asciiz"\nDigite a largura do ladrilho (em metros):"
msg5: .asciiz"\nDigite a comprimento do ladrilho (em metros):"

msg6: .asciiz"\nQuantitativo de Ladrilho:"

n1:.float 2.0

.text

l.s $f6, n1

#Solicitar ao usuário a largura da piscina em números reais...
li $v0, 4
la $a0, msg1
syscall

li $v0, 6
syscall
mov.s $f1, $f0

#Solicitar ao usuário a altura da piscina em números reais...
li $v0, 4
la $a0, msg2
syscall

li $v0, 6
syscall
mov.s $f2, $f0

#Solicitar ao usuário o comprimento da piscina em números reais...
li $v0, 4
la $a0, msg3
syscall

li $v0, 6
syscall
mov.s $f3, $f0

#Solicitar ao usuário a largura dos ladrilhos...
li $v0, 4
la $a0, msg4
syscall

li $v0, 6
syscall
mov.s $f4, $f0

#Solicitar ao usuário o comprimento dos ladrilhos...
li $v0, 4
la $a0, msg5
syscall

li $v0, 6
syscall
mov.s $f5, $f0

# 	Calculando
#	areapiscina = 2*(lag * alt) + 2*(comp *alt) + (lag * comp);

#(lag * alt)
mul.s $f20, $f1, $f2

#(comp *alt)
mul.s $f21, $f3, $f2

#(lag * comp)
mul.s $f22, $f1, $f3

#2*(lag * alt)
mul.s $f23, $f20, $f6

#2*(comp *alt)
mul.s $f24, $f21, $f6


add.s $f25, $f23, $f24
add.s $f26, $f25, $f22

# Area da Piscina eh $f26

# Calcular area dos ladrilhos:
mul.s $f27, $f4, $f5


# Quantidade necessario de ladrilhos:
div.s $f28, $f26, $f27


li $v0, 4
la $a0, msg6
syscall 

li $v0, 2
mov.s $f12, $f28
syscall