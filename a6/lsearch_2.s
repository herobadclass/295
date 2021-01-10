	.globl	lsearch_2
#rdi = A[]
#rsi = n
#rdx = target
lsearch_2:
	testl	%esi, %esi				# if n <= 0
	jle	.endif						
	movslq	%esi, %rax				# rax = n
	leaq	-4(%rdi,%rax,4), %rax	# rax = A[n-1]
	movl	(%rax), %r9d			# tmp = A[n-1]
	movl	%edx, (%rax)			# A[n-1] = target
	cmpl	(%rdi), %edx			# if A[0] = target 
	je	.endloop
	movl	$1, %ecx				# i = 1
.loop:
	movl	%ecx, %r8d				# r8d = i
	addq	$1, %rcx				# i ++
	cmpl	%edx, -4(%rdi,%rcx,4)	# while A[i] =! target, loop
	jne	.loop
.found:
	movl	%r9d, (%rax)			# A[n-1] = tmp
	leal	-1(%rsi), %eax			# eax = n-1
	cmpl	%r8d, %eax				# if n-1 > i
	jg	.returni
	cmpl	%edx, %r9d				# if A[n-1] != target
	jne	.endif
	rep ret							# ret n - 1
.returni:
	movl	%r8d, %eax				# ret i
	ret
.endloop:
	xorl	%r8d, %r8d				# r8d = 0
	jmp	.found
.endif:
	movl	$-1, %eax				# ret -1
	ret
