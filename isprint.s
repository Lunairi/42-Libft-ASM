section .text
global _ft_isprint

_ft_isprint:
	cmp edi, 32
	jge checkprint
	jmp isnotprint

checkprint:
	cmp edi, 127
	jbe isprint
	jmp isnotprint

isprint:
	mov rax, 1
	ret

isnotprint: 
	mov rax, 0
	ret

; rdi 1st ; value to be compared (int, edi)
