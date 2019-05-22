section .text
global _ft_memcmp

_ft_memcmp:
	mov rax, 0				; clearing
	mov rcx, 0				; clearing

startcheck:
	mov al, byte [rdi]		; move byte into rax 8bit region al
	mov cl, byte [rsi]		; move byte into rcx 8bit region cl
	cmp al, cl				; check to see if equal
	jne exitmemcmp			; exit if not same

iteratenext:
	add rdi, 1				; move pointer by 1
	add rsi, 1				; move pointer by 1
	sub edx, 1				; reduce value by 1
	cmp edx, 0
	je exitmemcmp
	jmp startcheck			; go back to next char

exitmemcmp:
	sub eax, ecx			; sub the two for return
	ret

; rdi 1st 
; rsi 2nd 
; rdx 3rd 
; rcx 4th
; rax return val


; mov dil, byte [rsi]	; moving first value into rdi (dil byte)