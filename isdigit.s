section .text
global _ft_isdigit

_ft_isdigit:
	cmp edi, 48
	jge checkdigit
	jmp isnotdigit

checkdigit:
	cmp edi, 57
	jbe isdigit
	jmp isnotdigit

isdigit:
	mov rax, 1
	ret

isnotdigit: 
	mov rax, 0
	ret

; rdi 1st ; value to be compared (int, edi)
