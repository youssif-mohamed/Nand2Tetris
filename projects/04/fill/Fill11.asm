// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(CHECK)
@KBD
D=M
@DARK // if there is any key is pressed it will go to Dark else it will continue
D;JNE

@SCREEN
D=A
@adress
A=D
// Initialize the LOOP
@i
M=1
@8192
D=A
@n
M=D
(loop)
// check the loop condition
@i
D=M
@n
D=D-M
// when all the screen is dark it will check the keyboard again
@CHECK
D;JGT
// set each register to 0000000000000000
@adress
M=0
A=A+1
// increment the loop
@i
M=M+1
@loop
0;JMP

(DARK)
@SCREEN
D=A
@adress
A=D
// Initialize the LOOP
@i
M=1
@8192
D=A
@n
M=D
(loop)
// check the loop condition
@i
D=M
@n
D=D-M
@CHECK
D;JGT
// set each register to 1111111111111111
@adress
M=-1
A=A+1
// increment the loop
@i
M=M+1
@loop
0;JMP
