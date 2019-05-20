section .text
global _ft_strdup
extern _malloc		; system call malloc
extern _ft_strlen	
extern _ft_memcpy

_ft_strdup:
	push rdi			; push rdi to stack before mod
	call _ft_strlen		; get size of rdi
	mov rdi, rax		; moving size into rdi
	push rax			; saving size to stack
	sub rsp, 8			; aligning stack
	call _malloc		; calling malloc to get size, rax now has pointer to memory region
	add rsp, 8			; why 

	pop rdx				; getting back size
	pop rdi				; popping back rdi because i need it for rsi
	mov rsi, rdi		; setting what is being copied
	mov rdi, rax		; moving pointer to rdi for memcpy
	push rdi			; pushing rdi pointer to memory for ret
	call _ft_memcpy		; setting memcpy where rdi = pointer, rsi = copying, rdx = amount copy
	pop rdi				; getting back rdi

	mov rax, rdi		; return pointer
	ret

; rdi 1st pointer to what is being copied
; rsi 2nd 
; rdx 3rd 
; rcx 4th
; rax return val
; rcx ; count, rep will read repeat count here
