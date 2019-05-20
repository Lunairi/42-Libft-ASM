section .text
global _ft_memset

_ft_memset:
	push rdi		; push pointer for later
	mov rcx, rdx 	; move count to rcx for rep
	mov rax, rsi 	; rsi holds value to be filled with for stosb
	rep stosb 		; fills bytes 
	pop rdi			; bring back pointer
	mov rax, rdi	; return pointer
	ret

; rdi 1st pointer
; rsi 2nd what is being set
; rdx 3rd how much to set
; rcx 4th
; rax return val
; rcx ; count, rep will read repeat count here
