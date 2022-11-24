	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC1:
	.string	"-c"
.LC2:
	.string	"Enter number"
.LC3:
	.string	"%lf"
.LC5:
	.string	"Error"
.LC6:
	.string	"Answer = %lf\n"
.LC7:
	.string	"-f"
.LC8:
	.string	"r"
.LC9:
	.string	"w"
.LC10:
	.string	"%lf\n"
.LC11:
	.string	"incorrect input"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	DWORD PTR -52[rbp], edi
	mov	QWORD PTR -64[rbp], rsi
	movsd	xmm0, QWORD PTR .LC0[rip]			
	movsd	QWORD PTR -40[rbp], xmm0			# кладем значение number = -1 в стек
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT					# strcmp(argv[1], "-c")
	test	eax, eax					# strcmp(argv[1], "-c") == 0 
	jne	.L2
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT					# printf("Enter number\n");
	lea	rax, -40[rbp]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT				# scanf("%lf", &number);
	movsd	xmm1, QWORD PTR -40[rbp]
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1					# number < 0
	jbe	.L20
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT					# printf("Error");
	mov	eax, 0
	jmp	.L17
.L20:
	mov	rax, QWORD PTR -40[rbp]
	movq	xmm0, rax
	call	Sqrt@PLT
	movq	rax, xmm0					# после вызова функции в rax кладется возращаемое значение
	mov	QWORD PTR -32[rbp], rax				# возвращенное значение кладется в стек. Соответсвует  double sq = Sqrt(number);
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT					# printf("Answer = %lf\n", sq);
	jmp	.L6
.L2:
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC7[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT					# strcmp(argv[1], "-f")
	test	eax, eax					# strcmp(argv[1], "-f") == 0 
	jne	.L7
	cmp	DWORD PTR -52[rbp], 4				# args != 4
	je	.L8
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT					# printf("Error");
	mov	eax, 0
	jmp	.L17
.L8:
	mov	rax, QWORD PTR -64[rbp]				#
	add	rax, 16						#
	mov	rax, QWORD PTR [rax]				#
	lea	rdx, .LC8[rip]					#
	mov	rsi, rdx					#
	mov	rdi, rax					#
	call	fopen@PLT					# fopen(argv[2], "r"). Все пустые выше - выполняют данную команду в совокупности 
	test	rax, rax					# fopen(argv[2], "r") != NULL
	je	.L9						# возвращает NULL			
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC8[rip]					
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT					# fopen(argv[2], "r")			
	jmp	.L10
.L9:
	mov	eax, 0						
.L10:
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC9[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT					# fopen(argv[3], "w")
	test	rax, rax					# fopen(argv[3], "w") != NULL
	je	.L11						# возращает NULL
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC9[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT					# fopen(argv[3], "w")
	jmp	.L12
.L11:
	mov	eax, 0
.L12:
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -8[rbp], 0				# in == NULL 
	je	.L13
	cmp	QWORD PTR -16[rbp], 0				# out == NULL 
	jne	.L14
.L13:
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT					# printf("Error");
	mov	eax, 0
	jmp	.L17
.L14:
	lea	rdx, -40[rbp]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC3[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT				# fscanf(in, "%lf", &number);
	movsd	xmm1, QWORD PTR -40[rbp]
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1					# number < 0
	jbe	.L21
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT					#  printf("Error");
	mov	eax, 0
	jmp	.L17
.L21:
	mov	rax, QWORD PTR -40[rbp]
	movq	xmm0, rax					# передает в xmm0 значение number для функции Sqrt
	call	Sqrt@PLT					# Sqrt(number)
	movq	rax, xmm0					
	mov	QWORD PTR -24[rbp], rax				# double sq = Sqrt(number);
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT					# fprintf(out, "%lf\n", sq);
	jmp	.L6
.L7:
	lea	rax, .LC11[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT					#  printf("incorrect input");
.L6:
	mov	eax, 0
.L17:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	-1074790400
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
