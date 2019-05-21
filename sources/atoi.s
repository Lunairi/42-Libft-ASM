section .text
global _ft_atoi
extern _ft_isdigit
extern _ft_isspace

_ft_atoi:
	mov rcx, 0			; setting register to 0
	push rsi			; preserve
	mov rsi, rdi		; copying pointer to rsi
	push rdi			; preserve just incase
	push rdx			; clearing rdx
	mov rdx, 0			; using for conditional

copybyte: 
	mov rdi, 0
	mov dil, byte [rsi]	; moving first value into rdi (dil byte)
	cmp dil, 0			; check if null
	je exitatoi
	cmp edx, 0
	jne checkdigit

checkspace:	
	call _ft_isspace	; check to see if space
	cmp eax, 1
	je movepointer

checksymbol:
	cmp dil, 43			; check if +
	je ispos
	cmp dil, 45			; check if -
	je isneg

ispos:
	mov edx, 1
	jmp movepointer

isneg:
	mov edx, -1
	jmp movepointer

checkdigit:
	call _ft_isdigit	; checking to see if its a number
	cmp eax, 0
	je exitatoi

addint:
	sub rdi, 48			; ascii to int
	imul rcx, 10		; value stored in rdi multiplied by 10
	add rcx, rdi		; value stored in rdi added with the new value

movepointer:
	add rsi, 1			; mov the pointer of rdi by 1 to next value
	jmp copybyte

exitatoi:
	imul ecx, edx		; multiplies edx for neg/pos
	mov eax, ecx		; put stored value into rax for return
	pop rdx				; pop original rdx back
	pop rdi				; pop original pointer back into rdi
	pop rsi				; pop original rsi back
	ret




; rdi 1st <-- grab the value of the byte, check to see if its a #
; rsi 2nd <-- to copy pointer of the string, incremented
; rdx 3rd <-- checks condition
; rcx 4th <-- store the integer
; rax return val