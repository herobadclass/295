	.globl sum_float

	# var map:
	#   %xmm0:  total
	#   %rdi:   F[n] (base pointer)
	#   %rsi:   n
	#   %rdx:   counter
	#   %rcx:   q.tail
	#   %r8:   	q.head

sum_float:
	movq	%rdi, %r8				# q.head = F[0]
	movq	%rdi, %rcx				# q.tail = F[0]
	movq	$1, %rdx				# counter = 1

loop:
	xorps	%xmm0, %xmm0            # total <- 0.0
	cmpq	%rdx, %rsi             
	je		endloop                 # while (counter < n) {
	
	movq 	(%rdi), %r9
	cmpq	%r9, (%r8)				#	q.head - f.head ? 0
	jl 		qx
	movq	(%rdi), %xmm0			#	x = dequeue f.head
	addq 	$4, %rdi
	jmp 	fx
qx:	
	movq	(%r8), %xmm0			#	x = dequeue q.head
	addq 	$4, %r8
fx:
	movq 	(%rdi), %r9
	cmpq	%r9, (%r8)				#	q.head - f.head ? 0
	jl 		qy
	addss	(%rdi), %xmm0			#	dequeue f.head + x
	addq 	$4, %rdi
	jmp		fy
qy:	
	addss	(%r8), %xmm0			#	dequeue q.head + x
	addq 	$4, %r8
fy:
	movq	%xmm0, (%rcx)			#	push x + y
	addq	$4, %rcx
	
	incq	%rdx           	    	#   F++
	jmp		loop                    # }

endloop:
	movq	(%r8), %xmm0
	ret
