section .data
newline:
	.nl db 10

section .text
global _ft_puts
extern _ft_strlen

_ft_puts:
	call _ft_strlen 				; get size of rdi
	mov rdx, rax 					; move return to rdx for length
	mov rax, 0x2000004 				; value for write
	lea rsi, [rel rdi]				; msg copied to right registry
	push rdi 						; push value onto stack
	mov rdi, 1						; stdout
	syscall							; writing string
	jc helpivefallenandcantgetup	; because syscall can fail
	push rsi						; clear string
	lea rsi, [rel newline.nl]		; add newline to rsi to rint
	syscall							; writing new line		
	jc helpivefallenandcantgetup	; because syscall can fail	
	pop rsi							; clearing stack
	pop rdi							; clearing stack
	mov rax, 0						; return 0
	ret

helpivefallenandcantgetup:
	mov rax, -1
	ret

; rdi 1st 
; rsi 2nd
; rdx 3rd
; rcx 4th
; rax return val

; when syscall fails it sets the carry, jc will jump if carry is set
; note: cant access internal registry for carry
; note note: sad day