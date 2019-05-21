section .bss
space: 
	.size resb 4096

section .text
global _ft_cat

_ft_cat:
	push rsi						; preserving rsi

readinput:
	mov rdx, 4096					; test size
	mov rax, 0x2000003 				; value for read
	lea rsi, [rel space.size]		; area to store msg
	syscall							; reading string
	jc exitcat						; because syscall can fail
	cmp rax, 0
	je exitcat

writeinput:
	mov rdx, rax					; set size to return of syscall read
	mov rax, 0x2000004 				; value for write
	push rdi						; preserve fd
	mov rdi, 1						; stdout
	syscall							; writing string
	pop rdi							; put bck fd
	jc exitcat						; because syscall can fail
	jmp readinput					; jump back to re-read

exitcat:
	pop rsi							; put back rsi
	ret

; rdi 1st 
; rsi 2nd
; rdx 3rd
; rcx 4th
; rax return val
