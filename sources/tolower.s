section .text
global _ft_tolower

_ft_tolower:
	mov eax, edi
	cmp edi, 65
	jge checkvalue
	ret

checkvalue:
	cmp edi, 90
	jle tolower
	ret

tolower:
	add eax, 32
	ret


; rdi 1st ; value to be compared (int, edi)
