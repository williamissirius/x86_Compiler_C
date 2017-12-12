 # Reserve space
	.data
i:
	.long 0
	.long 0

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
	#start the For statement

	# push 0
	movq $0,%rbx
	#Assign to Global var i
	movq %rbx, i
for_evaluation_0:
	movq i, %rbx

	# push 15
	movq $15,%r10
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
	movq i, %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Global var i
	movq %r10, i
	jmp for_evaluation_0
for_statement_0:
	#top=1

	# push string "i=%d\n" top=1
	movq $string0, %r10
	movq i, %r13
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r13, %rsi
	movq %r10, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r10
################# top = 0 ############
	jmp for_update_0
for_endAll_0:
	#top=0

	# push string "OK\n" top=0
	movq $string1, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
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
	.string "i=%d\n"

string1:
	.string "OK\n"

