// Fill.asm
// Toggles screen fill based on keyboard input

    @KBD
    D=M           // Read keyboard input
    @WHITE
    D;JEQ         // If no key is pressed (D == 0), go to WHITE

// BLACK loop
(BLACK)
    @SCREEN
    D=A
    @addr
    M=D           // addr = SCREEN base address

    @8192
    D=A
    @i
    M=D           // i = 8192 (number of words on the screen)

(BLACK_LOOP)
    @addr
    A=M
    M=-1          // Set pixel to black (all bits = 1)

    @addr
    M=M+1         // addr++

    @i
    M=M-1         // i--

    @i
    D=M
    @BLACK_LOOP
    D;JGT         // Repeat loop while i > 0

    @KBD
    D=M
    @BLACK
    D;JNE         // If key is still pressed, keep filling black

    @WHITE
    0;JMP

// WHITE loop
(WHITE)
    @SCREEN
    D=A
    @addr
    M=D           // addr = SCREEN base address

    @8192
    D=A
    @i
    M=D           // i = 8192

(WHITE_LOOP)
    @addr
    A=M
    M=0           // Set pixel to white (all bits = 0)

    @addr
    M=M+1         // addr++

    @i
    M=M-1         // i--

    @i
    D=M
    @WHITE_LOOP
    D;JGT         // Repeat loop while i > 0

    @KBD
    D=M
    @WHITE
    D;JEQ         // If no key is pressed, keep filling white

    @BLACK
    0;JMP
