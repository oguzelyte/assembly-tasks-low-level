; ----- EXAMPLE 4 ------- COUNTING AND JUMP --------------------------

	MOV	AL,00	; Initial value of 0 stored in AL
        MOV     BL,01   ; Initial value of 1 stored in BL

Rep:	
        MOV     [A0],BL	; Copy the value of BL to RAM location [A0]
        ADD	BL,AL	; Add the value of AL to BL
        MOV     [A1],BL ; Copy the addition result to RAM location [A1]
        MOV     AL,[A0] ; Copy value in RAM location [A0] to AL
	JMP	Rep	; Jump back to Rep

	END		; Program Ends

; ===== Program Ends ===============================