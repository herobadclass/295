	.file	"mul.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Incompatible multiplication: %d x %d times a %d x %d\n"
	.text
	.p2align 4,,15
	.globl	mul
	.type	mul, @function
mul:
.LFB41:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r9d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	cmpl	%r8d, %edx
	jne	.L24
	movq	%rdi, %rbx
	movl	%r9d, %esi
	movl	%ebp, %edi
	movq	%rcx, %r13
	call	newMatrix@PLT
	testq	%rax, %rax
	je	.L1
	testl	%ebp, %ebp
	jle	.L4
	leal	-1(%rbp), %edx
	movq	%rax, %rsi
	leaq	8(%rax,%rdx,8), %rdi
	leal	-1(%r14), %edx
	leaq	4(,%rdx,4), %r8
	.p2align 4,,10
	.p2align 3
.L5:
	testl	%r14d, %r14d
	jle	.L8
	movq	(%rsi), %rdx
	leaq	(%r8,%rdx), %rcx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	$0, (%rdx)
	addq	$4, %rdx
	cmpq	%rdx, %rcx
	jne	.L6
.L8:
	addq	$8, %rsi
	cmpq	%rsi, %rdi
	jne	.L5
.L4:
	testl	%r14d, %r14d
	jle	.L1
	leal	-1(%r14), %edx
	xorl	%r10d, %r10d
	leaq	4(,%rdx,4), %r14
	leal	-1(%r12), %edx
	leaq	4(,%rdx,4), %r11
	leal	-1(%rbp), %edx
	leaq	8(,%rdx,8), %rcx
	.p2align 4,,10
	.p2align 3
.L9:
	xorl	%r9d, %r9d
	testl	%r12d, %r12d
	jle	.L13
	.p2align 4,,10
	.p2align 3
.L12:
	movq	0(%r13,%r9,2), %rdx
	testl	%ebp, %ebp
	movl	(%rdx,%r10), %edx
	jle	.L10
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L11:
	movq	(%rbx,%rsi), %r8
	movq	(%rax,%rsi), %rdi
	addq	$8, %rsi
	movl	(%r8,%r9), %r15d
	addq	%r10, %rdi
	imull	%edx, %r15d
	addl	%r15d, (%rdi)
	cmpq	%rcx, %rsi
	jne	.L11
.L10:
	addq	$4, %r9
	cmpq	%r9, %r11
	jne	.L12
.L13:
	addq	$4, %r10
	cmpq	%r10, %r14
	jne	.L9
.L1:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L24:
	.cfi_restore_state
	movl	%edx, %ecx
	movl	%esi, %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	mul, .-mul
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
