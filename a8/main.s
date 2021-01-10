	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Rank"
.LC1:
	.string	"Grade"
.LC2:
	.string	"Name"
.LC3:
	.string	"%15s  %5s  %4s\n"
.LC4:
	.string	"----"
.LC5:
	.string	"-----"
.LC6:
	.string	"----------"
.LC7:
	.string	"%15s  %2.2f  %3d\n"
.LC8:
	.string	"Number who passed: %d/%d\n"
.LC9:
	.string	"  Passing average: %2.2f\n"
.LC10:
	.string	"  Overall average: %2.2f\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC11:
	.string	"Sample %d completed in %d cycles.\n"
	.section	.rodata.str1.1
.LC12:
	.string	"Average of %ld cycles.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB34:
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
	leaq	num_passed(%rip), %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	cycles(%rip), %r12
	xorl	%ebp, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	.p2align 4,,10
	.p2align 3
.L3:
#APP
# 35 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	leaq	passing_avg(%rip), %r8
	leaq	avg(%rip), %rcx
	leaq	ranks(%rip), %rdx
	leaq	grades(%rip), %rdi
	movl	%esi, start_time(%rip)
	movq	%r13, %r9
	movl	$30, %esi
	call	compute_ranks@PLT
#APP
# 46 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	%esi, end_time(%rip)
	subl	start_time(%rip), %esi
	movslq	%ebp, %rax
	movl	%esi, (%r12,%rax,4)
	xorl	%eax, %eax
	cmpl	$19999, %esi
	setg	%al
	subl	%eax, %ebp
	addl	$1, %ebp
	cmpl	$20, %ebp
	jne	.L3
	leaq	.LC0(%rip), %r8
	leaq	.LC1(%rip), %rcx
	leaq	.LC2(%rip), %rdx
	leaq	.LC3(%rip), %rsi
	leaq	names(%rip), %rbp
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	ranks(%rip), %r13
	leaq	grades(%rip), %r14
	call	__printf_chk@PLT
	leaq	600(%rbp), %r15
	leaq	.LC4(%rip), %r8
	leaq	.LC5(%rip), %rcx
	leaq	.LC6(%rip), %rdx
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm0, %xmm0
	movl	0(%r13,%rbx), %ecx
	leaq	.LC7(%rip), %rsi
	movq	%rbp, %rdx
	movl	$1, %edi
	movl	$1, %eax
	addq	$20, %rbp
	cvtss2sd	(%r14,%rbx), %xmm0
	addq	$4, %rbx
	call	__printf_chk@PLT
	cmpq	%r15, %rbp
	jne	.L4
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	leaq	.LC11(%rip), %rbp
	movl	$1, %ebx
	call	_IO_putc@PLT
	movl	num_passed(%rip), %edx
	leaq	.LC8(%rip), %rsi
	movl	$30, %ecx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	pxor	%xmm0, %xmm0
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	cvtss2sd	passing_avg(%rip), %xmm0
	call	__printf_chk@PLT
	pxor	%xmm0, %xmm0
	leaq	.LC10(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	cvtss2sd	avg(%rip), %xmm0
	call	__printf_chk@PLT
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc@PLT
	movl	cycles(%rip), %ecx
	leaq	.LC11(%rip), %rsi
	movl	$1, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	movq	$0, total(%rip)
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L6:
	movl	(%r12,%rbx,4), %ecx
	leal	1(%rbx), %edx
	xorl	%eax, %eax
	movq	%rbp, %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpq	$9, %rbx
	jbe	.L5
	movslq	(%r12,%rbx,4), %rax
	addq	%rax, total(%rip)
.L5:
	addq	$1, %rbx
	cmpq	$20, %rbx
	jne	.L6
	movq	total(%rip), %rcx
	movabsq	$7378697629483820647, %rdx
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	movq	%rcx, %rax
	leaq	.LC12(%rip), %rsi
	sarq	$63, %rcx
	imulq	%rdx
	movl	$1, %edi
	xorl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	sarq	$2, %rdx
	subq	%rcx, %rdx
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE34:
	.size	main, .-main
	.comm	nul,8,8
	.globl	end_time
	.data
	.align 4
	.type	end_time, @object
	.size	end_time, 4
end_time:
	.long	125
	.globl	start_time
	.align 4
	.type	start_time, @object
	.size	start_time, 4
start_time:
	.long	150
	.comm	total,8,8
	.comm	cycles,80,32
	.comm	num_passed,4,4
	.comm	passing_avg,4,4
	.comm	avg,4,4
	.comm	ranks,120,32
	.globl	grades
	.align 32
	.type	grades, @object
	.size	grades, 120
grades:
	.long	1116918252
	.long	1109571666
	.long	1117708616
	.long	1112161649
	.long	1116593193
	.long	1115462042
	.long	1116350710
	.long	1110580920
	.long	1119577702
	.long	1118244700
	.long	1114077921
	.long	1110780150
	.long	1113708298
	.long	1116260270
	.long	1116933980
	.long	1116475228
	.long	1119194972
	.long	1111797268
	.long	1118713938
	.long	1118993121
	.long	1111917855
	.long	1113794806
	.long	1118529126
	.long	1112596808
	.long	1110457713
	.long	1113606062
	.long	1118529126
	.long	1112596808
	.long	1110457713
	.long	1113606062
	.globl	names
	.align 32
	.type	names, @object
	.size	names, 600
names:
	.string	"Velia"
	.zero	14
	.string	"Katia"
	.zero	14
	.string	"Lyndon"
	.zero	13
	.string	"Salley"
	.zero	13
	.string	"Quentin"
	.zero	12
	.string	"Toni"
	.zero	15
	.string	"Pok"
	.zero	16
	.string	"Kenton"
	.zero	13
	.string	"Adelia"
	.zero	13
	.string	"les"
	.zero	16
	.string	"Reggie"
	.zero	13
	.string	"Francene"
	.zero	11
	.string	"Abel"
	.zero	15
	.string	"Treva"
	.zero	14
	.string	"Bert"
	.zero	15
	.string	"Nila"
	.zero	15
	.string	"Dayle"
	.zero	14
	.string	"Tonie"
	.zero	14
	.string	"Camelia"
	.zero	12
	.string	"Elana"
	.zero	14
	.string	"Vergie"
	.zero	13
	.string	"Christel"
	.zero	11
	.string	"Kirby"
	.zero	14
	.string	"Leonardo"
	.zero	11
	.string	"Tangela"
	.zero	12
	.string	"Sharonda"
	.zero	11
	.string	"Liza"
	.zero	15
	.string	"Liziana"
	.zero	12
	.string	"Cassidy"
	.zero	12
	.string	"Manda"
	.zero	14
	.comm	buf,1024,32
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
