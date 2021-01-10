	.globl times
times:
	mov $0, %eax
	mov $0, %ecx
loop:
	cmp %ecx, %esi
	je endif
	add %edi, %eax
	inc %ecx
	jmp loop
endif:
	ret

