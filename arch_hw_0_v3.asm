.model small
.386
.stack 100h
.data

instructions	db	'Volume Calculator:', 13, 10
				db	'Enter values separated by a single', 13, 10
				db	'in feet and inches respectfully', 13, 10
				db	'example input:25 2(enter) this implies', 13, 10
				db	'that 25 is the number of feet and', 13, 10
				db	'2 is the number of inches.', 13, 10
				db 	'the maximum input value is 134ft 11in', 13, 10, '$'
length_message	db	'Enter the length: $'
			  	db  'Enter the width:  $'
				db	'Enter the height: $'

.code
		extern PutUDec : NEAR, GetDec : NEAR
Homework0		proc

				mov		ax, @data
				mov		ds, ax

				mov		dx, offset instructions
				mov 	ah, 9h
				int		21h

				mov		di, offset length_message
				mov		cx, 3
GetInput:
				mov		dx, di		
				mov		ah, 9h
				int		21h
				call	GetDec						

				mov		bx, 12
				mul		bx					
				shl		edx, 16
				mov		dx, ax					
											
				call	GetDec
				xor		ebx, ebx
				mov		bx, ax
				add		edx, ebx		
				push	edx

				add		di, 19

				dec		cx
				jnz		GetInput
				
				pop		eax
				pop		ebx

				mul		ebx				;max result fits in eax

				pop		ebx

				mul		ebx				;total result fits in eax`


				mov		ah, 4ch
				int		21h
Homework0		endp
				end		Homework0
