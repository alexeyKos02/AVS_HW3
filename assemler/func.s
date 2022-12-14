	.file	"func.c"
	.intel_syntax noprefix
	.text
	.data
	.align 4
	.type	degree, @object
	.size	degree, 4
degree:
	.long	5					# degree = 5
	.local	A					static A
	.comm	A,8,8
	.section	.rodata
.LC1:
	.string	"ms"
.LC2:
	.string	"%lld %s\n"
	.text
	.globl	diff
	.type	diff, @function
diff:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	rax, rsi
	mov	r8, rdi
	mov	rsi, r8
	mov	rdi, r9
	mov	rdi, rax
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -24[rbp], rdi					# в стек end
	mov	QWORD PTR -48[rbp], rdx					# в стек кидаем st
	mov	QWORD PTR -40[rbp], rcx
	mov	rax, QWORD PTR -32[rbp]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rax					# преобразует и кладет значение st.tv_sec в xmm1
	movsd	xmm0, QWORD PTR .LC0[rip]				# в xmm0 кладет значение 10е8
	mulsd	xmm1, xmm0						# st.tv_sec *10e8
	mov	rax, QWORD PTR -24[rbp]					# в rax кладут st.tv_nsec
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax					# в xmm0 кладем st.tv_nsec
	addsd	xmm0, xmm1						# складываем две части
	cvttsd2si	rax, xmm0					# в rax кладем значение суммы
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -48[rbp]					# в rax кладем end.tv_sec
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rax					# в xmm1 кладем end.tv_sec
	movsd	xmm0, QWORD PTR .LC0[rip]				# в xmm0 кладет значение 10е8
	mulsd	xmm1, xmm0
	mov	rax, QWORD PTR -40[rbp]					# end.tv_sec *10e8
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax					# в xmm0 кладем end.tv_nsec
	addsd	xmm0, xmm1						# складываем обе части
	cvttsd2si	rax, xmm0					# преобразуем и кладем в rax сумму
	mov	QWORD PTR -16[rbp], rax					# в стек кидаем значение второй суммы
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR -16[rbp]					# tot1-tot2
	lea	rdx, .LC1[rip]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	nop
	leave
	ret
	.size	diff, .-diff
	.globl	Alg
	.type	Alg, @function
Alg:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	movsd	QWORD PTR -8[rbp], xmm0
	mov	eax, DWORD PTR degree[rip]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movsd	xmm0, QWORD PTR .LC3[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	mov	eax, DWORD PTR degree[rip]
	sub	eax, 1							# (degree - 1)
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mulsd	xmm0, QWORD PTR -8[rbp]					# (degree - 1) * number
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm3, QWORD PTR A[rip]
	movsd	QWORD PTR -32[rbp], xmm3
	mov	eax, DWORD PTR degree[rip]
	sub	eax, 1							# degree - 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT							# pow(number, degree - 1)
	movsd	xmm1, QWORD PTR -32[rbp]
	divsd	xmm1, xmm0						#  A / pow(number, degree - 1))
	movsd	xmm0, QWORD PTR -24[rbp]
	addsd	xmm0, xmm1
	mulsd	xmm0, QWORD PTR -16[rbp]				# degree * ((degree - 1) * number + A / pow(number, degree - 1));
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	ret
	.size	Alg, .-Alg
	.globl	Sqrt
	.type	Sqrt, @function
Sqrt:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	movsd	QWORD PTR -72[rbp], xmm0
	movsd	xmm0, QWORD PTR -72[rbp]
	movsd	QWORD PTR A[rip], xmm0				# A = number
	lea	rax, -48[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT				# clock_gettime(CLOCK_MONOTONIC, &st);
	movsd	xmm0, QWORD PTR .LC4[rip]
	mov	rax, QWORD PTR -72[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movq	rax, xmm0
	mov	QWORD PTR -16[rbp], rax				# corr = pow(number, 1.0 / 5);
	movsd	xmm0, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR .LC5[rip]			# 1/1000
	divsd	xmm0, xmm1					# corr /1000
	movsd	QWORD PTR -24[rbp], xmm0			# кладем в стек, аналогично кладем в переменную eps
	mov	rax, QWORD PTR .LC3[rip]
	movq	xmm0, rax
	call	Alg
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax				# alg = Alg(1);
	jmp	.L5
.L6:
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rax
	call	Alg						# Alg(alg)
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax				# alg = Alg(alg);
.L5:
	movsd	xmm0, QWORD PTR -8[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]
	movq	xmm1, QWORD PTR .LC6[rip]
	andpd	xmm0, xmm1					# fabs(alg - corr)
	comisd	xmm0, QWORD PTR -24[rbp]			# fabs(alg - corr) > eps
	ja	.L6
	lea	rax, -64[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT				# clock_gettime(CLOCK_MONOTONIC, &end);
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rdi, QWORD PTR -64[rbp]
	mov	rsi, QWORD PTR -56[rbp]
	mov	rcx, rdx
	mov	rdx, rax
	call	diff						# diff(end,st);
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	ret
	.size	Sqrt, .-Sqrt
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	-1717986918
	.long	1070176665
	.align 8
.LC5:
	.long	0
	.long	1083129856
	.align 16
.LC6:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
