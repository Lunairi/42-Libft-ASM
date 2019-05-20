section .text
global _ft_bzero

_ft_bzero:
	mov rcx, rsi 	; move count to rcx for rep
	mov rax, 0 		; rax (al) holds value to be filled with for stosb
	rep stosb 		; fills bytes 
	ret

; rdi 1st ; address
; rsi 2nd ; size
; rcx ; count, rep will read repeat count here

; https://c9x.me/x86/html/file_module_x86_id_279.html
; https://www.aldeid.com/wiki/X86-assembly/Instructions/rep