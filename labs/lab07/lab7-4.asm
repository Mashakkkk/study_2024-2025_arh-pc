%include 'in_out.asm'
section .data
msg_x db 'Введите значение переменной x: ',0h
msg_a db 'Введите значение переменной a: ',0h
res db 'Результат: ',0h

section .bss
x resb 80
a resb 80

section .text
global _start
_start:
; ---------- Ввод значения x
mov eax, msg_x
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax, x
call atoi
mov edi, eax ; edi = x
; ---------- Ввод значения a
mov eax, msg_a
call sprint
mov ecx, a
mov edx, 80
call sread
mov eax, a
call atoi
mov esi, eax ; esi = a
; ---------- Сравнение x и a
cmp edi, esi
jl less_than_a ; если x < a, переход на less_than_a
; ---------- x >= a, вычисляем x + 10
mov eax, edi
add eax, 10
jmp print_result
less_than_a:
; ---------- x < a, вычисляем a + 10
mov eax, esi
add eax, 10
; ---------- Вывод результата
print_result:
mov edi, eax
mov eax, res
call sprint ; Вывод сообщения 'Результат: '
mov eax, edi
call iprintLF ; Вывод результата
call quit ; Выход

