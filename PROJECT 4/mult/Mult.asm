// Mult.asm
// Computes R2 = R0 * R1 using repeated addition

    @R0
    D=M          // D = R0 (multiplicand)
    @0
    D;JEQ        // If R0 == 0, skip to end

    @R1
    D=M          // D = R1 (multiplier)
    @0
    D;JEQ        // If R1 == 0, skip to end

    @R0
    D=M          // D = R0
    @multiplier
    M=D          // multiplier = R0

    @R1
    D=M
    @counter
    M=D          // counter = R1

    @R2
    M=0          // result = 0

(LOOP)
    @counter
    D=M
    @END
    D;JEQ        // If counter == 0, we're done

    @multiplier
    D=M
    @R2
    M=M+D        // R2 += multiplier

    @counter
    M=M-1        // counter--

    @LOOP
    0;JMP

(END)
    @END
    0;JMP        // Infinite loop (halt)
