section .text
global _ft_isspace

_ft_isspace:
	cmp edi, 9
	jge checkspace
	jmp isnotspace

checkspace:
	cmp edi, 13
	jbe isspace
	cmp edi, 32
	je isspace
	jmp isnotspace

isspace:
	mov rax, 1
	ret

isnotspace: 
	mov rax, 0
	ret

; rdi 1st ; value to be compared (int, edi)
