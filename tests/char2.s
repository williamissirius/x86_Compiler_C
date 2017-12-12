 # Reserve space
	.data
g:
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

	# push 20
	movq $20,%rbx
     # func=malloc nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	#Assign to Local var h
	movq %rbx, 128(%rsp)
################# top = 0 ############

	# push 0
	movq $0,%rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $1, %rbx
	addq %rbx, %rbp

	# push 65
	movq $65,%r10
	andq $255, %r10
	movq %r10, (%rbp)
################# top = 0 ############

	# push 1
	movq $1,%rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $1, %rbx
	addq %rbx, %rbp

	# push 66
	movq $66,%r10
	andq $255, %r10
	movq %r10, (%rbp)
################# top = 0 ############

	# push 2
	movq $2,%rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $1, %rbx
	addq %rbx, %rbp

	# push 67
	movq $67,%r10
	andq $255, %r10
	movq %r10, (%rbp)
################# top = 0 ############

	# push 3
	movq $3,%rbx
#dereference the pointer from here
	movq 128(%rsp), %rbp 
	imulq $1, %rbx
	addq %rbx, %rbp

	# push 0
	movq $0,%r10
	andq $255, %r10
	movq %r10, (%rbp)
################# top = 0 ############
	#top=0

	# push string "h=%s\n" top=0
	movq $string0, %rbx
	#Push Local var h
	movq 128(%rsp), %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
################# top = 0 ############

	# push 20
	movq $20,%rbx
     # func=malloc nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	#Assign to Global var g
	movq %rbx, g
################# top = 0 ############

	# push 0
	movq $0,%rbx
#dereference the pointer from here
	movq g, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $1, %rbx
	addq %rbx, %rbp

	# push 68
	movq $68,%r10
	andq $255, %r10
	movq %r10, (%rbp)
################# top = 0 ############

	# push 1
	movq $1,%rbx
#dereference the pointer from here
	movq g, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $1, %rbx
	addq %rbx, %rbp

	# push 69
	movq $69,%r10
	andq $255, %r10
	movq %r10, (%rbp)
################# top = 0 ############

	# push 2
	movq $2,%rbx
#dereference the pointer from here
	movq g, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $1, %rbx
	addq %rbx, %rbp

	# push 70
	movq $70,%r10
	andq $255, %r10
	movq %r10, (%rbp)
################# top = 0 ############

	# push 3
	movq $3,%rbx
#dereference the pointer from here
	movq g, %rbp

#GOBAL ARRAY RECOGNIZED
	imulq $1, %rbx
	addq %rbx, %rbp

	# push 0
	movq $0,%r10
	andq $255, %r10
	movq %r10, (%rbp)
################# top = 0 ############
	#top=0

	# push string "g=%s\n" top=0
	movq $string1, %rbx
	movq g, %r10
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
	.string "h=%s\n"

string1:
	.string "g=%s\n"

