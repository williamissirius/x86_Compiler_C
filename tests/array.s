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

	# push 8
	movq $8,%rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $8, %rbx
	addq %rbx, %rbp

	# push 9
	movq $9,%r10
# dereference the array here
	movq %r10, (%rbp)
################# top = 0 ############
	#top=0

	# push string "a[8]=%d\n" top=0
	movq $string0, %rbx

	# push 8
	movq $8,%r10
# Array Value
	movq 128(%rsp), %r13
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r13
	movq %r13, %r10
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
	.string "a[8]=%d\n"

