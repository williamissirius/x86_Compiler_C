	.text
.globl sum
sum:
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
	movq %rsi,120(%rsp)

	# push 0
	movq $0,%rbx
	#Assign to Local var s
	movq %rbx, 104(%rsp)
################# top = 0 ############
	#start the For statement

	# push 0
	movq $0,%rbx
	#Assign to Local var i
	movq %rbx, 112(%rsp)
for_evaluation_0:
	#Push Local var i
	movq 112(%rsp), %rbx
	#Push Local var n
	movq 128(%rsp), %r10
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
	movq 112(%rsp), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Local var i
	movq %r10, 112(%rsp)
	jmp for_evaluation_0
for_statement_0:
	#Push Local var s
	movq 104(%rsp), %r10
	#Push Local var i
	movq 112(%rsp), %r13
# Array Value
	movq 120(%rsp), %r14
	imulq $8, %r13
	addq %r13, %r14
	movq (%r14), %r14
	movq %r14, %r13

	# +
	addq %r13,%r10
	#Assign to Local var s
	movq %r10, 104(%rsp)
################# top = 0 ############
	jmp for_update_0
for_endAll_0:
	#Push Local var s
	movq 104(%rsp), %rbx
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

	# push 5
	movq $5,%rbx

	# push 8
	movq $8,%r10

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

	# push 0
	movq $0,%rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 4
	movq $4,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 1
	movq $1,%rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 3
	movq $3,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 2
	movq $2,%rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 1
	movq $1,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 3
	movq $3,%rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 7
	movq $7,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 4
	movq $4,%rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 6
	movq $6,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############

	# push 5
	movq $5,%rbx
	#Push Local var a
	movq 128(%rsp), %r10
     # func=sum nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	call sum
	movq %rax, %rbx
	#Assign to Local var s
	movq %rbx, 120(%rsp)
################# top = 0 ############
	#top=0

	# push string "sum=%d\n" top=0
	movq $string0, %rbx
	#Push Local var s
	movq 120(%rsp), %r10
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
	.string "sum=%d\n"

