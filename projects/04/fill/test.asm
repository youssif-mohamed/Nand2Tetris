@SCREEN
D=A
@screen
M=D
@8192
D=A
@n      // Last SCREEN memory address.
M=D
@i      // Loop counter
M=0

(LOOP)
    @i
    M=0

    @KBD
    D=M
    @BLACK
    D;JNE   //If KBD != 0 goto BLACK
    @WHITE
    D;JEQ   //If KBD == 0 goto WHITE
    //@LOOP
    //0;JMP

(BLACK)
    // Test if i is less than n
    @i
    D=M
    @n
    D=D-M
    @LOOP
    D;JEQ   //If i > n goto back to LOOP

    // Loop trought the SCREEN memory filling it with -1
    @screen // Base SCREEN memory address
    D=M
    @i      // Loop counter 
    A=D+M   // Pointer: Access the register adress RAM[screen+i]
    M=-1    // Put the value -1 in the register RAM[screen+i]
    @i
    M=M+1   // i++
    @BLACK
    0;JMP

(WHITE)
    // Test if i is less than n
    @i
    D=M
    @n
    D=D-M
    @LOOP
    D;JEQ   //If i > n goto back to LOOP

    // Loop trought the SCREEN memory filling it with 0
    @screen // Base SCREEN memory address
    D=M
    @i      // Loop counter
    A=D+M   // Pointer: Access the register adress RAM[screen+i]
    M=0    // Put the value 0 in the register RAM[screen+i]
    @i
    M=M+1   // i++
    @WHITE
    0;JMP
