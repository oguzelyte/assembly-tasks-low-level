# Assembly Tasks Low Level

 A compillation of assembly tasks done on an 8086 emulator (app included).

# Task 1-4

* Write a program that subtracts using SUB. (update comments and save as Task 1)
* Write a program that multiplies using MUL. (update comments and save as Task 2)
* Write a program that divides using DIV. (update comments and save as Task 3)
* Write a program that divides by zero. Make a note to avoid doing this later. (update comments and save as Task 4)

# Task 5

* Use the help page on Hexadecimal and Binary numbers. Work out which hexadecimal numbers will activate the correct traffic lights. Modify the program to step the lights through the UK traffic light sequence shown below, assuming the two sets of lights are at the opposite sides of a narrow bridge - traffic may only flow in one direction at a time and there should be a short period during which both traffic lights show red to allow traffic to exit the bridge. (update comments and save as Task 5)

# Task 6

* Look up the ASCII codes of H, E, L, L and O and copy these values to memory locations [C0], [C1], [C2], [C3] and [C4]. This is a simple and somewhat crude way to display text on a memory mapped display. (update comments and save as Task 6)

# Task 7-10

* Rewrite the example program to count backwards using DEC BL. (update comments and save as Task 7)
* Rewrite the example program to count in threes using ADD BL,3. (update comments and save as Task 8)
* Rewrite the program to count 1 2 4 8 16 using MUL BL,2. What happens when the count overflows? (update comments and save as Task 9)
* Here is a more difficult task. Count in BL 0 1 1 2 3 5 8 13 21 34 55 89 overflow. Here each number is the sum of the previous two. You will need to use two registers and at least one memory location for temporary storage of numbers (do not use PUSH/POP). If you have never programmed in assembler before, this is a real brain teaser. Remember that the result will overflow when it goes above 127. You may recognise this as the Fibonacci series, a number sequence first described by Leonardo Fibonacci of Pisa (1170-1230). (update comments and save as Task 10)

# Task 11-13

* Easy: Input characters and display each character at the top left position of the VDU by copying them all to address [C0]. (update comments and save as Task 11)
* Harder: Use BL to point to address [C0] and increment BL after each key press in order to see the text as you type it. (update comments and save as Task 12)
* Harder Still: Store all the text you type in RAM (not the VDU RAM) when you type it in. When you press Enter, display the stored text on the VDU display by copying it to the VDU RAM. (update comments and save as Task 13)

# Task 14

* Modify your traffic lights program from task 5 to use this delay procedure to set up realistic time delays between light changes. (update comments and save as Task 14)

# Task 15

* Write a procedure that doubles a number. Pass the single parameter into the procedure using a register. Use the same register to return the result. If you base your solution on the code above then remove unused procedures. (update comments and save as Task 15)

# Task 16

* Modify the traffic lights data table to step the lights through the UK traffic light sequence shown below, assuming the two sets of lights are at the opposite sides of a narrow bridge - traffic may only flow in one direction at a time and there should be a short period during which both traffic lights show red to allow traffic to exit the bridge. (update comments and save as Task 16)

# Task 17

* Write a program which calls three procedures. The first should continue to read characters from the keyboard and store in RAM until Enter is pressed. The second should convert any upper case characters in the stored text to lower case (do not convert any other characters). The third should display the complete line of text on the VDU display. (update comments and save as Task 17)


