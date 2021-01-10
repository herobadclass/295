	.file	"conv.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.text
	.p2align 4,,15
	.globl	conv
	.type	conv, @function
conv:
.LFB0:
	.cfi_startproc
	testl	%edx, %edx
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	jle	.L4
	movslq	%edx, %rax
	leaq	.LC0(%rip), %r14
	movq	%rdi, %rbp
	leaq	-2(%rsi,%rax), %r13
	leaq	-1(%rsi,%rax), %rbx
	leal	-1(%rdx), %eax
	xorl	%r12d, %r12d
	subq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L3:
	movzbl	0(%rbp), %eax
	movq	%r14, %rdi
	subq	$1, %rbx
	mulb	1(%rbx)
	addq	$1, %rbp
	addl	%eax, %r12d
	xorl	%eax, %eax
	movsbl	%r12b, %esi
	call	printf@PLT
	cmpq	%rbx, %r13
	jne	.L3
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%r12d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_restore_state
	xorl	%r12d, %r12d
	popq	%rbx
	.cfi_def_cfa_offset 40
	movl	%r12d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	conv, .-conv
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
