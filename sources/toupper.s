section .text
global _ft_toupper

_ft_toupper:
	mov eax, edi
	cmp edi, 97
	jge checkvalue
	ret

checkvalue:
	cmp edi, 122
	jle toupper
	ret

toupper:
	sub eax, 32
	ret


; rdi 1st ; value to be compared (int, edi)
