section .text
global _ft_strcat
extern _ft_strlen

_ft_strcat:
	call _ft_strlen					; set rcx as the length of string
	push rdi						; save pointer start
	add rdi, rax					; rdi is first string, add rax to get to null

checkstring:
	mov cl, byte [rsi]				; adding a byte to r15
	cmp cl, 0						; check to see if 2nd param is null or not
	jne concatstring				; go to concat process if not null
	jmp returnstring				; if null, goes to return

concatstring:
	mov byte [rdi], byte [rsi]		; moving byte from 2nd to first
	add rdi, 1						; incrementing pointer
	add rsi, 1						; incrementing pointer
	jmp checkstring					; check string again

returnstring:
	mov byte [rdi], 0				; adding null terminator
	pop rdi							; getting back the start of address
	mov rax, rdi					; setting return value
	ret								; ret

; rdi 1st 
; rsi 2nd
; rdx 3rd
; rcx 4th
; rax return val

; https://imada.sdu.dk/Employees/kslarsen-bak/Courses/dm18-2007-spring/Litteratur/IntelnATT.htm