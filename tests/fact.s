	.text
.globl fact
fact:
# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15
	pushq %rbp
	subq $128,%rsp
	#Save arguments
	movq %rdi,128(%rsp)
	#start the if statement
if_statement_0:
	#Push Local var n
	movq 128(%rsp), %rbx

	# push 0
	movq $0,%r10
	# Equal Equal operator
	cmpq %r10, %rbx
	je LC1
LC0:
	movq $0, %rbx
	jmp LC2
LC1:
	movq $1, %rbx
LC2:
	cmpq $0, %rbx
	je if_else_0

	# push 1
	movq $1,%r10
	movq %rbx, %rax
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
######return statments################
	jmp if_end_0
if_else_0:
if_end_0:
	#Push Local var n
	movq 128(%rsp), %rbx
	#Push Local var n
	movq 128(%rsp), %r10

	# push 1
	movq $1,%r13

	# minus
	subq %r13, %r10
     # func=fact nargs=1
     # Move values from reg stack to reg args
	movq %r10, %rdi
	call fact
	movq %rax, %r10

	# *
	imulq %r10,%rbx
	movq %rbx, %rax
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
######return statments################
	addq $128,%rsp
# Restore registers
	popq %rbp
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
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

	# push string " Factorial of 5 = %d\n" top=0
	movq $string0, %rbx

	# push 5
	movq $5,%r10
     # func=fact nargs=1
     # Move values from reg stack to reg args
	movq %r10, %rdi
	call fact
	movq %rax, %r10
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
	.string " Factorial of 5 = %d\n"

