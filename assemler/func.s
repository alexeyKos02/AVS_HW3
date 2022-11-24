	.file	"func.c"
	.intel_syntax noprefix
	.text
	.data
	.align 4
	.type	degree, @object
	.size	degree, 4
degree:
	.long	5
	.local	A
	.comm	A,8,8
	.text
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
	movsd	xmm0, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	mov	eax, DWORD PTR degree[rip]
	sub	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mulsd	xmm0, QWORD PTR -8[rbp]
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm3, QWORD PTR A[rip]
	movsd	QWORD PTR -32[rbp], xmm3
	mov	eax, DWORD PTR degree[rip]
	sub	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movsd	xmm1, QWORD PTR -32[rbp]
	divsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	addsd	xmm0, xmm1
	mulsd	xmm0, QWORD PTR -16[rbp]
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
	sub	rsp, 48
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	xmm0, QWORD PTR -40[rbp]
	movsd	QWORD PTR A[rip], xmm0
	movsd	xmm0, QWORD PTR .LC1[rip]
	mov	rax, QWORD PTR -40[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movq	rax, xmm0
	mov	QWORD PTR -16[rbp], rax
	movsd	xmm0, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	mov	rax, QWORD PTR .LC0[rip]
	movq	xmm0, rax
	call	Alg
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
	jmp	.L4
.L5:
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rax
	call	Alg
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
.L4:
	movsd	xmm0, QWORD PTR -8[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]
	movq	xmm1, QWORD PTR .LC3[rip]
	andpd	xmm0, xmm1
	comisd	xmm0, QWORD PTR -24[rbp]
	ja	.L5
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
	.long	1072693248
	.align 8
.LC1:
	.long	-1717986918
	.long	1070176665
	.align 8
.LC2:
	.long	0
	.long	1083129856
	.align 16
.LC3:
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
