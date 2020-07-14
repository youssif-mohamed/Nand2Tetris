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
@8192
D=A
@N
M=D
@SCREEN
D=A
@ADDRESS
M=D

(CHECK)
@I // Initialize i
M=0

@KBD // check the keyboard status
D=M

@DARK
D;JNE
@BRIGHT
D;JEQ

(DARK)
@I
D=M
@N
D=D-M
@CHECK
D;JEQ
@I
D=M
@ADDRESS
A=M+D //point to screen memory address
M=-1
@I
M=M+1
@DARK
0;JMP

(BRIGHT)
@I
D=M
@N
D=D-M
@CHECK
D;JEQ
@I
D=M
@ADDRESS
A=M+D
M=0
@I
M=M+1
@BRIGHT
0;JMP
