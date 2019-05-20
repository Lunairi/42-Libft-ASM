section .text
global _ft_toupper

_ft_toupper:
	mov rax, edi
	cmp edi, 97
	jge checkvalue
	ret

checkvalue:
	cmp edi, 122
	jbe toupper
	ret

toupper:
	add rax, 32
	ret


; rdi 1st ; value to be compared (int, edi)
