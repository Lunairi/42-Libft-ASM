section .text
global _ft_isascii

_ft_isascii:
	cmp edi, 0
	jge checkascii
	jmp isnotascii

checkascii:
	cmp edi, 127
	jbe isascii
	jmp isnotascii

isascii:
	mov rax, 1
	ret

isnotascii: 
	mov rax, 0
	ret

; rdi 1st ; value to be compared (int, edi)
