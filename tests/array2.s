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

	# push 8
	movq $8,%rbx

	# push 20
	movq $20,%r10

	# *
	imulq %r10,%rbx
     # func=malloc nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	#Assign to Local var a
	movq %rbx, 128(%rsp)
################# top = 0 ############
	#start the For statement

	# push 0
	movq $0,%rbx
	#Assign to Local var i
	movq %rbx, 120(%rsp)
for_evaluation_0:
	#Push Local var i
	movq 120(%rsp), %rbx

	# push 20
	movq $20,%r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC1
LC0:
	movq $0, %rbx
	jmp LC2
LC1:
	movq $1, %rbx
LC2:
	cmpq $0, %rbx
	jne for_statement_0
	jmp for_endAll_0
for_update_0:
	#Push Local var i
	movq 120(%rsp), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Local var i
	movq %r10, 120(%rsp)
	jmp for_evaluation_0
for_statement_0:
	#Push Local var i
	movq 120(%rsp), %r10
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $8, %r10
	addq %r10, %rbp

	# push 3
	movq $3,%r13
	#Push Local var i
	movq 120(%rsp), %r14

	# *
	imulq %r14,%r13
# dereference the array here
	movq %r13, (%rbp)
################# top = 0 ############
	jmp for_update_0
for_endAll_0:
	#top=0

	# push string "Ok so far\n" top=0
	movq $string0, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############
	#start the For statement

	# push 0
	movq $0,%rbx
	#Assign to Local var i
	movq %rbx, 120(%rsp)
for_evaluation_1:
	#Push Local var i
	movq 120(%rsp), %rbx

	# push 20
	movq $20,%r10
	# Equal Equal operator
	cmpq %r10, %rbx
	jl LC4
LC3:
	movq $0, %rbx
	jmp LC5
LC4:
	movq $1, %rbx
LC5:
	cmpq $0, %rbx
	jne for_statement_1
	jmp for_endAll_1
for_update_1:
	#Push Local var i
	movq 120(%rsp), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Local var i
	movq %r10, 120(%rsp)
	jmp for_evaluation_1
for_statement_1:
	#top=1

	# push string "%d: %d\n" top=1
	movq $string1, %r10
	#Push Local var i
	movq 120(%rsp), %r13
	#Push Local var i
	movq 120(%rsp), %r14
# Array Value
	movq 128(%rsp), %r15
	imulq $8, %r14
	addq %r14, %r15
	movq (%r15), %r15
	movq %r15, %r14
     # func=printf nargs=3
     # Move values from reg stack to reg args
	movq %r14, %rdx
	movq %r13, %rsi
	movq %r10, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r10
################# top = 0 ############
	jmp for_update_1
for_endAll_1:
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
	.string "Ok so far\n"

string1:
	.string "%d: %d\n"

