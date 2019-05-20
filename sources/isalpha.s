section .text
global _ft_isalpha

_ft_isalpha:
	cmp edi, 97
	jge checklower
	cmp edi, 65
	jge checkupper
	jmp isnotalpha

checkupper:
	cmp edi, 90
	jle isalpha
	jmp isnotalpha

checklower:
	cmp edi, 122
	jle isalpha
	jmp isnotalpha

isalpha:
	mov rax, 1
	ret

isnotalpha: 
	mov rax, 0
	ret

; rdi 1st ; value to be compared (int, edi)
