; ----- EXAMPLE 8 ------- DATA TABLES --------------------------

	JMP	Start	; Skip past the data table.

	DB	90	; Data table begins. Both traffic lights red.
	DB	98	; Copy 10011000 into the AL register
	DB	84	; Copy 10000100 into the AL register.
	DB	88	; Copy 10001000 into the AL register.
        DB	90	; Both traffic lights red.
	DB	D0	; Copy 11010000 into the AL register. 
	DB	30	; Copy 00110000 into the AL register.
	DB	50	; Copy 01010000 into the AL register.
                        ; Last entry is also used as end marker

Start:
	MOV	BL,02	; 02 is start address of data table
Rep:
	MOV	AL,[BL]	; Copy data from table to AL
	OUT	01	; Output from AL register to port 01

	CMP	AL,50	; Last item in data table ???
	JZ	Start	; If yes then jump to Start
	INC	BL	; If no then point BL to the next entry
	JMP	Rep	; Jump back to do next table entry

	END
; --------------------------------------------------------------
