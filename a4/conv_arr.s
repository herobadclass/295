	.globl conv_arr
	# %rdi = signal
	# %esi = N = 15
	# %rdx = h
	# %ecx = M = 3
	# %r8 = result
	# %r9 = i
	# %r10 = N + M - 2
	# ladj = min(i + 1, m) 
	# radj = m - min(m + n - (i + 1), m)
conv_arr:
	push %rbx		#saves 
	push %rbp		#saves 
	mov $0, %r9		#i = 0
loop:
	push %rdi		#saves signal
	mov %r9, %rdi
	inc %rdi		#rdi = i + 1
	
	push %rsi		#saves N
	mov %rcx, %rsi	#rsi = M
	
	call min		#min(i + 1, m) = ladj
	
	pop %rsi		#pop N
	push %rax		#saves ladj
	mov %rcx, %rdi
	add %rsi, %rdi
	sub %r9, %rdi	
	dec %rdi 		#rdi = m + n - (i + 1)
	push %rsi		#saves N
	mov %rcx, %rsi	#rsi = M
	
	call min		#min(-(i + 1) + M + N, M)
	
	pop %rsi		#pop N
	neg %rax
	add %rcx, %rax
	mov %rax, %r10	#r10 = m - min(m + n - (i + 1), m) = radj
	mov %r10, %r11
	neg %r11		#r11 = -radj	
	add %rdx, %r10	#r10 = h + radj	
	pop %rax		#pop ladj
	add %rax, %r11	#r11 = ladj - radj
	pop %rdi		#pop rdi
	neg %rax		#rax = -ladj
	add %r9, %rax
	inc %rax		#rax = -ladj + i + 1
	add %rdi, %rax	#rax = x - ladj + i + 1
	
	push %rdi		#saves signal
	push %rsi		#saves N
	push %rdx		#saves h
	
	mov %rax, %rdi	#rdi = x - ladj + i + 1
	mov %r10, %rsi	#rsi = h + radj	
	mov %r11, %rdx	#rdx = ladj - radj
	
	call conv		#conv(x + (i+1-ladj), h + radj, ladj-radj)
	#mov %rax, %r10
	#mov %r10b, (%r8, %r9)	#result[i] = conv(x + (i+1-ladj), h + radj, ladj-radj)
	inc %r9
	
	pop %rdx	#pop h
	pop %rsi	#pop N
	pop %rdi	#pop signal
	
	mov $0, %r10
	add %rsi, %r10
	add %rcx, %r10
	sub $2, %r10	#r10 = M + N - 2
	
	cmp %r9, %r10	#M + N - 2 - i ? 0
	jge loop
	
	pop %rbp
	pop %rbx
	
	ret
