section .data
initialize:
	.test db "Hello World!", 10
	.len equ $ - initialize.test

section .text
global _main

_main:
	mov rdi, 1 ; stdin 
	lea rsi, [rel initialize.test] ; msg
	mov rdx, initialize.len ; length
	mov rax, 0x2000004 ; value for write
	syscall
	mov rax, 0
	ret

; rdi 1st 
; rsi 2nd
; rdx 3rd
; rcx 4th
; rax return val