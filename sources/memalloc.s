section .text
global _ft_memalloc
extern _ft_bzero
extern _ft_strlen
extern _malloc

_ft_memalloc:
	push rdi			; saving size
	sub rsp, 8			; aligning stack
	call _malloc		; calling malloc to get size, rax now has pointer to memory region
	add rsp, 8			; why 

	pop rdi				; taking size from stack and putting into rdi for bzero
	push rax			; saving pointer in stack
	call _ft_bzero
	pop rax				; moving the pointer back to return
	ret

; rdi 1st 
; rsi 2nd 
; rdx 3rd 
; rcx 4th
; rax return val

