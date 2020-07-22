; ----- EXAMPLE 1 ------- ARITHMETIC --------------------------

; ===== WORK OUT 2 PLUS 2 ======================================
	CLO		; Close unwanted windows.
	MOV AL,1	; Copy a 1 into the AL register.
	MOV BL,4	; Copy a 4 into the BL register.
	MUL AL,BL	; Multiply AL by BL. Answer goes into AL.
	END		; Program ends
; ===== Program Ends ===========================================
