section .text
global _ft_tolower

_ft_tolower:
	mov rax, edi
	cmp edi, 65
	jge checkvalue
	ret

checkvalue:
	cmp edi, 90
	jbe tolower
	ret

tolower:
	sub rax, 32
	ret


; rdi 1st ; value to be compared (int, edi)
