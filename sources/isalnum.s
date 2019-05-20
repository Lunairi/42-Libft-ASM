section .text
global _ft_isalnum
extern _ft_isalpha
extern _ft_isdigit

_ft_isalnum:
	call _ft_isdigit
	cmp rax, 1
	je isalnum
	call _ft_isalpha
	cmp rax, 1
	je isalnum
	isnotalnum

isalnum:
	move rax, 1
	ret

isnotalnum:
	move rax, 0
	ret


; rdi 1st ; value to be compared (int, edi)
