section .text
global _ft_strcpy

_ft_strcpy:
	push rdi				; push pointer for later
	mov rcx, 0				; clear rcx 

docopy:
	mov cl, byte [rsi]		; moving byte to rcx (cl)
	mov byte [rdi], cl
	cmp cl, 0
	je exitstrcpy
	add rsi, 1
	add rdi, 1
	jmp docopy

exitstrcpy:
	pop rax					; pop pointer into rax for return
	ret

; rdi 1st pointer
; rsi 2nd what is being set
; rdx 3rd how much to set
; rcx 4th
; rax return val
; rcx ; count, rep will read repeat count here
