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

	# push string "9==8%d\n" top=0
	movq $string0, %rbx

	# push 9
	movq $9,%r10

	# push 8
	movq $8,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	je LC1
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

	# push string "9==9=%d\n" top=0
	movq $string1, %rbx

	# push 9
	movq $9,%r10

	# push 9
	movq $9,%r13
	# Equal Equal operator
	cmpq %r13, %r10
	je LC4
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

	# push string "9!=8%d\n" top=0
	movq $string2, %rbx

	# push 9
	movq $9,%r10

	# push 8
	movq $8,%r13
	# Not Equal operator
	cmpq %r13, %r10
	jne LC7
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

	# push string "9!=9=%d\n" top=0
	movq $string3, %rbx

	# push 9
	movq $9,%r10

	# push 9
	movq $9,%r13
	# Not Equal operator
	cmpq %r13, %r10
	jne LC10
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
	.string "9==8%d\n"

string1:
	.string "9==9=%d\n"

string2:
	.string "9!=8%d\n"

string3:
	.string "9!=9=%d\n"

