main:
        mov sp, #256

        sub sp, sp, #4
        mov r0, #0
        str r0, [sp]

        sub sp, sp, #4
        mov r0, #-1
        str r0, [sp]

        sub sp, sp, #4
        mov r0, #-2
        str r0, [sp]

        sub sp, sp, #4
        mov r0, #-3
        str r0, [sp]

        mov r0, sp
        mov r1, #5
        bl find_max_a   
        b end
        
find_max_a:
        sub sp, sp, #4
        str r6, [sp]
        sub sp, sp, #4 //preserve registers (benson instructed to do multiples of 8)
        str r5, [sp]
        sub sp, sp, #4
        str r4, [sp]
        ldr r3, [r0] //r3 = max
        mov r5, #0 //r5 = i
        mov r2, #0 //r2 = addresses and iterator
loop:
        cmp r5, r1 //iterator compare
        beq done
        add r6, r0, r2 //load number then increment
        ldr r4, [r6]
        add r2, r2, #4
        cmp r4, r3 //if r4>max then max = r4
        movgt r3, r4
        add r5, r5, #1
        b loop

done:
        ldr r4, [sp] //pop registers off
        add sp, sp, #4
        ldr r5, [sp] 
        add sp, sp, #4
        ldr r6, [sp]
        add sp, sp, #4
        mov r0, r3
        bx lr
end:
        b end
