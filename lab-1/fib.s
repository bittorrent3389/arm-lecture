	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func
	.global fibonacci
	.type fibonacci, function
fibonacci:
	@push {r4, r5, r6, lr}
	mov r4, #0     @ sum = 0;
	mov r5, #1	   @ result = 1;
	mov r6, #-1    @ prev = -1;
.loop:		
	add r4, r5, r6
	mov r6, r5
	mov r5, r4

	subs r0, #1     @ r0 = r0 - 1 
	ite lt			 @ if (r0 < 0) then ... else ...
	movlt r0, r5 	 @ because r0 < 0, mov r0, r5
	bge .loop        @ if(r0 >= 0) goto .loop
	@pop {r4, r5, r6, pc}		@EPILOG
	bx lr 
	.size fibonacci, .-fibonacci
	.end
