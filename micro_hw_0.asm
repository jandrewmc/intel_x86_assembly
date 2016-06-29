INCLUDE	PCMAC.INC
				
				.MODEL SMALL
				.STACK 100h
				.DATA

Multiplicand	DW		07fffh
Multiplier		DW		07fffh

				.CODE
				EXTERN	PutHex : NEAR	
Homework0		PROC

				mov		ax, @data
				mov		ds, ax

				mov		cx, 00010h			;initialize the loop counter to 											16
				mov		bx, Multiplicand	;place the multiplicand in BX 												register
				mov		ax, Multiplier		;place the multiplier in AX								 					register
				mov		dx, 00000h			;initialize DX to zero
				clc							;clear carry flag
theLoop:

				jnc		CarryFlag0
				jc		CarryFlag1				
CarryFlag0:
				test	ax, 1				;is lsb of ax 1
				jnz		CF0LSB1
				jz		CF0LSB0
CF0LSB0:
				sar		dx, 1
				rcr		ax, 1
				jmp		DONE
CF0LSB1:				
				sub		dx, bx
				sar		dx, 1
				rcr		ax, 1
				jmp 	DONE
CarryFlag1:
				test	ax, 1
				jnz		CF1LSB1
				jz		CF1LSB0
CF1LSB0:
				add		dx, bx
				sar		dx, 1
				rcr		ax, 1
				jmp 	DONE
CF1LSB1:
				sar		dx, 1
				rcr		ax, 1
				jmp		DONE

DONE:
				dec		cx
				jnz		theLoop

				mov 	bx, ax
				mov		ax, dx

				call    PutHex

				mov		ax, bx

				call	PutHex
				
				mov		al, 000h
				mov		ah, 4ch
				int		21h

Homework0		ENDP
				END		Homework0
