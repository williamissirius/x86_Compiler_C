	.text
.globl main
main:
# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15
	pushq %rbp
	subq $128,%rsp
	#Save arguments
	#top=0

	# push string "9>8=%d\n" top=0
	movq $string0, %rbx

	# push 9
	movq $9,%r10

	# push 8
	movq $8,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jl LC1
LC0:
	movq $0, %r10
	jmp LC2
LC1:
	movq $1, %r10
LC2:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "8<9=%d\n" top=0
	movq $string1, %rbx

	# push 8
	movq $8,%r10

	# push 9
	movq $9,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jl LC4
LC3:
	movq $0, %r10
	jmp LC5
LC4:
	movq $1, %r10
LC5:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "9<8=%d\n" top=0
	movq $string2, %rbx

	# push 9
	movq $9,%r10

	# push 8
	movq $8,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jl LC7
LC6:
	movq $0, %r10
	jmp LC8
LC7:
	movq $1, %r10
LC8:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "8<9=%d\n" top=0
	movq $string3, %rbx

	# push 8
	movq $8,%r10

	# push 9
	movq $9,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jl LC10
LC9:
	movq $0, %r10
	jmp LC11
LC10:
	movq $1, %r10
LC11:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "9>=8=%d\n" top=0
	movq $string4, %rbx

	# push 9
	movq $9,%r10

	# push 8
	movq $8,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jge LC13
LC12:
	movq $0, %r10
	jmp LC14
LC13:
	movq $1, %r10
LC14:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "8>=9=%d\n" top=0
	movq $string5, %rbx

	# push 8
	movq $8,%r10

	# push 9
	movq $9,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jge LC16
LC15:
	movq $0, %r10
	jmp LC17
LC16:
	movq $1, %r10
LC17:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "9>=9=%d\n" top=0
	movq $string6, %rbx

	# push 9
	movq $9,%r10

	# push 9
	movq $9,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jge LC19
LC18:
	movq $0, %r10
	jmp LC20
LC19:
	movq $1, %r10
LC20:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "9>=9=%d\n" top=0
	movq $string7, %rbx

	# push 9
	movq $9,%r10

	# push 9
	movq $9,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jge LC22
LC21:
	movq $0, %r10
	jmp LC23
LC22:
	movq $1, %r10
LC23:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "9<=8=%d\n" top=0
	movq $string8, %rbx

	# push 9
	movq $9,%r10

	# push 8
	movq $8,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jle LC25
LC24:
	movq $0, %r10
	jmp LC26
LC25:
	movq $1, %r10
LC26:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "8<=9=%d\n" top=0
	movq $string9, %rbx

	# push 8
	movq $8,%r10

	# push 9
	movq $9,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jle LC28
LC27:
	movq $0, %r10
	jmp LC29
LC28:
	movq $1, %r10
LC29:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "9<=9=%d\n" top=0
	movq $string10, %rbx

	# push 9
	movq $9,%r10

	# push 9
	movq $9,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jle LC31
LC30:
	movq $0, %r10
	jmp LC32
LC31:
	movq $1, %r10
LC32:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#top=0

	# push string "9<=9=%d\n" top=0
	movq $string11, %rbx

	# push 9
	movq $9,%r10

	# push 9
	movq $9,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	jle LC34
LC33:
	movq $0, %r10
	jmp LC35
LC34:
	movq $1, %r10
LC35:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
string0:
	.string "9>8=%d\n"

string1:
	.string "8<9=%d\n"

string2:
	.string "9<8=%d\n"

string3:
	.string "8<9=%d\n"

string4:
	.string "9>=8=%d\n"

string5:
	.string "8>=9=%d\n"

string6:
	.string "9>=9=%d\n"

string7:
	.string "9>=9=%d\n"

string8:
	.string "9<=8=%d\n"

string9:
	.string "8<=9=%d\n"

string10:
	.string "9<=9=%d\n"

string11:
	.string "9<=9=%d\n"

