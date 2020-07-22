; ----- THE LIFT COURSEWORK --------------------------

        JMP     Start   ; Skip past the data table.
        
        DB	10	; Hardware Timer Interrupt Vector
        DB      00      ; This one necessary but unused
	DB	20	; Numeric Keypad Interrupt Vector

        DB      "UP    "; Used to write "UP" to VDU     
        ORG     0C      ; "UP" starts at RAM 0C
        DB      "TOP"   ; Used to write "TOP" to VDU
        ORG     B0      ; "TOP" starts at RAM B0
        DB      "DOWN"  ; Used to write "DOWN" to VDU
        ORG     B5      ; "DOWN" starts at RAM B5
        DB      "BOTTOM"; Used to write "BOTTOM" to VDU

; ===== Hardware Timer =======
	ORG	10      ; Starts at RAM 10
	IRET            ; A return to where IP points to
; ============================

; ===== Keyboard Handler =====
Enter:                  ; Added a bit of Enter here because was lacking space underneath
        IN      06      ; Read lift status
        AND     AL, 20  ; Isolate the "UP" status bit, were it clicked
        OR      AL, 12  ; Invoke movement downwards
        OUT     06      ; Pass it to the lift
        JMP     CarryOn ; Go back to where lift was before

	ORG     20      ; Code starts at 20
	CLI		; Prevent re-entrant use
	PUSH    AL      ; Save AL on the stack
	PUSHF           ; Save the SR flags on the stack

	IN	08      ; Read the key-press
        CMP     AL,0D   ; Check if it's enter
        JZ      Enter   ; If yes, carry on with Enter procedures
        JNZ     CarryOn ; If not, do nothing

CarryOn:
	POPF            ; Pop flags on the stack
	POP	AL      ; Pop the AL on the stack
	IRET            ; Return to where IP points to on the stack
; ============================

Start:
        CLO             ; Close all windows
        OUT	08	; Display keypad peripheral
        OUT	06	; Display lift window 
Loop: 
        IN	06	; Read lift status
        ; Refresh the CL register, by pointing to C0 anew so VDU would be overwritten 
        AND     AL, 24  ; Check if it's not at the top
        CMP     AL, 20  ; If it's not at the top and 'up' sequence fits, it's the 'up' button
        JZ      UpButton; Jump to carry on with processing 'up' button
        IN	06      ; AL was altered, input from lift again
        AND     AL, 18  ; Check if lift is not at the bottom
        CMP     AL, 10  ; If it's not at bottom and 'down' sequence fits, it's the 'down' button
        JZ      DownButton ; Jump to continue 'down' sequence 
	JMP	Loop	; Loop if down button not pressed

; ----- Sets up the 'up' button --------------------------

UpButton:
        STI             ; Set (I) flag 
	OR	AL, 21	; Set UP motor bit and pressed 'up' button bit
        MOV     BL, 05  ; Tells VDUDisplay that "UP" will need to be written
        CALL    95      ; Calls the VDUDisplay
        OUT     06      ; Move the lift

; ----- Fixes the 'up' sequence so it doesn't crash --------------------------

UpBtnFix:
        IN      06      ; Read lift status 
        AND     AL, 16  ; Check if 'enter' was pressed and it's going down
        CMP     AL, 12  ; Compare it with the 'down' sequence
        JZ      FixDownFromUp ; If it is going down, jump elsewhere
        AND     AL, 14  ; Check if 'down' button was pressed
        MOV     [BC], AL ; Move it to RAM BC
        AND     AL, 04  ; Check if it reached the top
        CMP     AL, 04  ; Fix it so it wouldn't crash if it's at the top
        JZ      FixBoth ; If it's at the top, fix it
        JNZ     UpBtnFix ; If it's not at the top yet, keep looping

; ----- Sets up the 'down' button --------------------------

DownButton:
        MOV     AL, 12  ; Set up 'down' motor and 'down' bit
        OUT     06      ; Output it to the lift

; ----- Takes care of 'down' sequence if detected while checking the 'up' one --------------------------

FixDownFromUp:
        MOV     BL, B0  ; Tells VDUDisplay that "DOWN" will need to be written
        CALL    95      ; Calls the VDUDisplay
        CLI             ; Prevents user from clicking 'enter'

; ----- Fixes the 'down' sequence so it doesn't crash --------------------------

DownBtnFix:
        IN      06      ; Read lift status 
        AND     AL, 29  ; Check if 'up' button was pressed
        MOV     [BC], AL ; Save it to RAM BC
        AND     AL, 08  ; Check if it reached the bottom
        CMP     AL, 08  ; Fix it so it wouldn't crash if it's at the bottom
        JNZ     DownBtnFix ; If it's not at the bottom yet, keep looping

; ----- Final touches to stop both from crashing --------------------------
     
FixBoth:
        MOV     AL, [BC]; Stop the lift from crashing, input saved sequence
        OUT     06      ; Output to the lift
        CALL    95      ; Call the VDUDisplay
        JMP     Loop    ; Once displayed, iterate through main loop again

        MOV     CL, BF  ; Start one sooner than C0, otherwise it'll increment too soon

; ----- Displaying to the VDU --------------------------

VDUDisplay:
        INC     CL      ; Increment CL, so it is now pointint at the VDU display
        MOV     DL, [BL]; Add lift status letter to register DL
        INC     BL      ; Point to another letter
        CMP     DL, 00  ; Check if the letter is non-existent
        JZ      Return  ; If so, return to where called from
        MOV     [CL], DL; If not, display lift status letter to user
        JMP     VDUDisplay ; Continue to display the letters

; ----- Returning to where called from --------------------------

Return:
        RET             ; Return to where called from

	END             ; End the program
; --------------------------------------------------------------