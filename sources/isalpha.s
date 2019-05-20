section .text
global _ft_isalpha

_ft_isalpha:
	cmp edi, 65
	jge checkupper
	cmp edi, 97
	jge checklower
	jmp isnotalpha

checkupper:
	cmp edi, 90
	jbe isalpha
	jmp isnotalpha

checklower:
	cmp edi, 122
	jbe isalpha
	jmp isnotalpha

isalpha:
	mov rax, 1
	ret

isnotalpha: 
	mov rax, 0
	ret

; rdi 1st ; value to be compared (int, edi)
