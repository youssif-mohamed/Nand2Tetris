// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@i // Initialize I to 1
M=1
@R2 // Initialize RAM[2] to 0
M=0
(LOOP)
// loop condition: whenever I exceeds RAM[1] value terminate the loop n-i>0
@i
D=M
@R1
D=D-M
@END
D;JGT
// Multiplies through summation
@R0
D=M
@R2
M=D+M
// increment the LOOP
@i
M=M+1
@LOOP
0;JMP
(END) // infinite loop to end the program
0;JMP
