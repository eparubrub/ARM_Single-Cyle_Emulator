main:
        mov sp, #255
        add r0, r0, #9
        bl fib_rec_a
        b done_loop
fib_rec_a:
        sub sp, sp, #4 //preserve registers (benson instructed to do multiples of 8)
        str r4, [sp]
        sub sp, sp, #4
        str r5, [sp]
        sub sp, sp, #4
        str r6, [sp]
        sub sp, sp, #4
        str lr, [sp]
        cmp r0, #1 //if r0 is greater than 1 go to else
        bgt fib_else 
        b done //if not return value
fib_else:
        sub r4, r0, #1 //r4 = n-1
        mov r0, r4 //r0 = n-1 for recursive call
        bl fib_rec_a
        mov r5, r0 //save the value from recursive call
        sub r0, r4, #1 //r0 = n-2 for recursive call
        bl fib_rec_a
        mov r6, r0 //save the value from recursive call
        add r0, r5, r6 //r0 = fib(n-1) + fib(n-2)
done:   
        ldr lr, [sp] //pop registers off
        add sp, sp, #4
        ldr r6, [sp]
        add sp, sp, #4          
        ldr r5, [sp]
        add sp, sp, #4
        ldr r4, [sp]
        add sp, sp, #4
        bx lr
done_loop:
        b done_loop
