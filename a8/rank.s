	.file	"rank.c"
	.text
	.p2align 4,,15
	.globl	compute_ranks
	.type	compute_ranks, @function
compute_ranks:
.LFB0:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leal	-2(%rsi), %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	testl	%ebp, %ebp
	jle	.L41
	leal	-3(%rsi), %r11d
	pxor	%xmm4, %xmm4
	pxor	%xmm3, %xmm3
	xorl	%ebx, %ebx
	shrl	%r11d
	pxor	%xmm0, %xmm0
	movl	%r11d, %eax
	leaq	8(,%rax,8), %r10
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	movss	(%rdi,%rax), %xmm2
	movl	$1, (%rdx,%rax)
	ucomiss	.LC1(%rip), %xmm2
	movss	4(%rdi,%rax), %xmm1
	movl	$1, 4(%rdx,%rax)
	addss	%xmm2, %xmm0
	addss	%xmm1, %xmm3
	jb	.L3
	addss	%xmm2, %xmm4
	addl	$1, %ebx
.L3:
	ucomiss	.LC1(%rip), %xmm1
	jb	.L5
	addss	%xmm1, %xmm4
	addl	$1, %ebx
.L5:
	addq	$8, %rax
	cmpq	%r10, %rax
	jne	.L7
	leal	2(%r11,%r11), %eax
.L2:
	cmpl	%eax, %esi
	jle	.L8
	leal	-1(%rsi), %r10d
	subl	%eax, %r10d
	leaq	4(,%r10,4), %r12
	movslq	%eax, %r10
	xorl	%eax, %eax
	salq	$2, %r10
	leaq	(%rdx,%r10), %r11
	addq	%rdi, %r10
	.p2align 4,,10
	.p2align 3
.L11:
	movss	(%r10,%rax), %xmm1
	movl	$1, (%r11,%rax)
	ucomiss	.LC1(%rip), %xmm1
	addss	%xmm1, %xmm0
	jb	.L9
	addss	%xmm1, %xmm4
	addl	$1, %ebx
.L9:
	addq	$4, %rax
	cmpq	%r12, %rax
	jne	.L11
.L8:
	movaps	%xmm3, %xmm5
	testl	%ebp, %ebp
	addss	%xmm0, %xmm5
	jle	.L42
	leal	-3(%rsi), %r10d
	leaq	4(%rdx), %rax
	movq	%rdi, %r14
	shrl	%r10d
	movl	%r10d, %r11d
	leal	2(%r10,%r10), %r13d
	leaq	8(%rdi,%r11,8), %r12
	movslq	%r13d, %r15
	.p2align 4,,10
	.p2align 3
.L28:
	movss	(%r14), %xmm0
	movq	%rdi, %r10
	movss	4(%r14), %xmm1
	.p2align 4,,10
	.p2align 3
.L21:
	movss	(%r10), %xmm3
	ucomiss	%xmm0, %xmm3
	jbe	.L13
	addl	$1, -4(%rax)
.L13:
	movss	4(%r10), %xmm2
	ucomiss	%xmm0, %xmm2
	jbe	.L15
	addl	$1, -4(%rax)
.L15:
	ucomiss	%xmm1, %xmm3
	jbe	.L17
	addl	$1, (%rax)
.L17:
	ucomiss	%xmm1, %xmm2
	jbe	.L19
	addl	$1, (%rax)
.L19:
	addq	$8, %r10
	cmpq	%r12, %r10
	jne	.L21
	cmpl	%r13d, %esi
	jle	.L22
	movq	%r15, %r11
	.p2align 4,,10
	.p2align 3
.L27:
	movss	(%rdi,%r11,4), %xmm2
	ucomiss	%xmm0, %xmm2
	jbe	.L23
	addl	$1, -4(%rax)
.L23:
	ucomiss	%xmm1, %xmm2
	jbe	.L25
	addl	$1, (%rax)
.L25:
	addq	$1, %r11
	cmpl	%r11d, %esi
	jg	.L27
.L22:
	addq	$8, %r14
	addq	$8, %rax
	cmpq	%r10, %r14
	jne	.L28
	cmpl	%r13d, %esi
	jle	.L29
.L68:
	leal	-3(%rsi), %eax
	movslq	%r13d, %r11
	leaq	(%rdx,%r11,4), %rdx
	shrl	%eax
	leaq	8(%rdi,%rax,8), %r10
	.p2align 4,,10
	.p2align 3
.L30:
	testl	%ebp, %ebp
	jle	.L38
	movss	(%rdi,%r11,4), %xmm0
	movq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L35:
	movss	(%rax), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L31
	addl	$1, (%rdx)
.L31:
	movss	4(%rax), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L33
	addl	$1, (%rdx)
.L33:
	addq	$8, %rax
	cmpq	%rax, %r10
	jne	.L35
.L38:
	addq	$1, %r11
	addq	$4, %rdx
	cmpl	%r11d, %esi
	jg	.L30
.L36:
	pxor	%xmm0, %xmm0
	cvtsi2ss	%esi, %xmm0
	divss	%xmm0, %xmm5
.L39:
	testl	%ebx, %ebx
	je	.L40
	pxor	%xmm0, %xmm0
	cvtsi2ss	%ebx, %xmm0
	divss	%xmm0, %xmm4
.L40:
	movl	%ebx, (%r9)
	movss	%xmm5, (%rcx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movss	%xmm4, (%r8)
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
.L41:
	.cfi_restore_state
	pxor	%xmm4, %xmm4
	xorl	%ebx, %ebx
	pxor	%xmm3, %xmm3
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	jmp	.L2
.L42:
	xorl	%r13d, %r13d
	cmpl	%r13d, %esi
	jg	.L68
.L29:
	testl	%esi, %esi
	je	.L39
	jmp	.L36
	.cfi_endproc
.LFE0:
	.size	compute_ranks, .-compute_ranks
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	1112014848
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
