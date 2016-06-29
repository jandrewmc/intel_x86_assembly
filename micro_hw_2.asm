INCLUDE	PCMAC.INC
				
				.MODEL SMALL
				.STACK 100h
				.DATA

multiplic		DB		'Enter the Multiplicand: $' 
multipli		DB		'Enter the Multiplier: $'

				.CODE
				EXTERN	PutHex : NEAR, GetDec : NEAR	
Homework0		PROC

				mov		ax, @data
				mov		ds, ax

				_PutStr	multiplic
				call	GetDec
				mov		bx, ax

				_PutStr multipli	
				call	GetDec

				call BoothMultiply
				
				mov 	bx, ax
				mov		ax, dx
				call    PutHex
				mov		ax, bx
				call	PutHex
				
				mov 	ax, 04c00h
				int		21h

Homework0		ENDP

BoothMultiply	PROC
				mov		cx, 00010h			
				mov		dx, 00000h			
				clc							
theLoop:

				jnc		CarryFlag0
				jc		CarryFlag1				
CarryFlag0:
				test	ax, 1				
				jnz		CF0LSB1
				jz		DONE
CF0LSB1:				
				sub		dx, bx
				jmp 	DONE
CarryFlag1:
				test	ax, 1
				jnz		DONE
				jz		CF1LSB0
CF1LSB0:
				add		dx, bx
				jmp 	DONE
DONE:
				sar		dx, 1
				rcr		ax, 1
				
				dec		cx
				jnz		theLoop

				ret

BoothMultiply	ENDP
				END		Homework0
