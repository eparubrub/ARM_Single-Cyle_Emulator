
main:
        mov sp, #255
        add r0, r0, #9
        bl fib_iter_a
        b done_loop

fib_iter_a:
        sub sp, sp, #8 //preserve registers (benson instructed to do multiples of 8)
        str r4, [sp]
        mov r2, #1 //initialize variables
        mov r3, #0
        mov r4, #0
        cmp r0, #0 //if(n==0)
        beq done
        cmp r0, #1 //if(n==1)
        moveq r0, #1
        beq done
        mov r1, #2 // i = 2
loop:
        cmp r1, r0
        movgt r0, r4 //return new
        bgt done
        add r4, r2, r3 //new = old + older
        mov r3, r2 // older = old
        mov r2, r4 // old = new
        add r1, r1, #1
        b loop
done:
        ldr r4, [sp] //pop registers
        add sp, sp, #8
        bx lr
        
done_loop:      
        b done_loop
