	.globl sqrt
sqrt:
	movl $0, %eax		# result = 0
	movl $32768, %ecx	# bitmask = 1000 0000 0000 0000
loop:
	or %ecx, %eax		# changes the nth bit of result to 1
	movl %eax, %edx
	imul %edx, %edx		# edx = result * result
	cmp %edx, %edi
	jge keep		# jump if x >= result * result
	xor %ecx, %eax		# changes the nth bit of result to 0
keep:
	shr $1, %ecx		# shifts bitmask to the right by 1 bit filling with 0
	jne loop		# jump till bitmask = 0000 0000 0000 0000
	ret
