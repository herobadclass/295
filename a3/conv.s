	.globl conv
# %rdi = array1
# %rsi = array2
# %edx = n
# %al = return
# %rcx = m
# %r8 = hold
conv:
	mov $0, %al		#return = 0
	mov $0, %rcx		#m = 0
loop:
	cmp %ecx, %edx		#n - m ? 0
	jle endif
	mov %rcx, %r9		#%r9 = m
	neg %r9			#%r9 = -m
	add %rdx, %r9		#%r9 = n-m
	mov (%rdi, %rcx), %r8	#hold = x[m]
	imul -1(%rsi, %r9), %r8	#hold = hold*h[n-m-1]
	add %r8b, %al		#return = return + hold
	inc %rcx		#m++
	jmp loop
endif:
	ret
