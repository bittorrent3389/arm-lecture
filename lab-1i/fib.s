	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
    push {r3, r4, r5, lr}
    subs r4, r0, #0
    ble .L3 @ if ( r0 <= 0  ) goto .L3

    cmp r4, #1
    beq .L4 @ if ( r4 == 1  ) goto .L4

    sub r0, r4, #1  @ r0 = r4 - 1
    bl fibonacci    @ call fib(x-1)

    mov r5, r0      @ r5 = r0, r5 == fib(x-1)
    sub r0, r4, #2  @ r0 = r4 - 2
    bl fibonacci    @ call fib(x-2)

    add r0, r5, r0  @ r0 = fib(x-1) + fib(x-2)
    pop {r3, r4, r5, pc}
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
