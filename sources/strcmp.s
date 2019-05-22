section .text
global _ft_strcmp

_ft_strcmp:
	push rdx				; preserve rdx
	mov rdx, 0				; clearing
	mov rcx, 0				; clearing

startcheck:
	mov dl, byte [rdi]		; move byte into rdx 8bit region dl
	mov cl, byte [rsi]		; move byte into rcx 8bit region cl

checknull:
	cmp dl, 0				; check if null
	je exitstrcmp

checkchar:
	cmp dl, cl				; check to see if equal
	jne exitstrcmp			; exit if not same

iteratenext:
	add rdi, 1				; move pointer by 1
	add rsi, 1				; move pointer by 1
	jmp startcheck			; go back to next char

exitstrcmp:
	mov rax, 0				; clearing it
	mov al, dl
	sub eax, ecx			; sub the two for return
	pop rdx
	ret

; rdi 1st 
; rsi 2nd 
; rdx 3rd 
; rcx 4th
; rax return val


; mov dil, byte [rsi]	; moving first value into rdi (dil byte)