.data

# Line 6: x:int


	.comm _x ,4, ,4

# Line 7: y:int


	.comm _y ,4, ,4

# Line 8: z:int


	.comm _z ,4, ,4

# Line 9: b1:boolean


	.comm _b1 ,4, ,4

# Line 10: b2:boolean



	.comm _b2 ,4, ,4
.text
.global main
main:

# Line 14: x:=5

	pushl $5 
	popl %eax 
	movl %eax, _x

# Line 15: y:=x*(8-x)

	pushl _x 
	pushl $8 
	pushl _x 
	popl %ebx 
	popl %eax 
	subl %ebx, %eax
	pushl %eax 
	popl %ebx 
	popl %eax 
	xorl %ecx, %ecx
	movl (%eax), %edx
	imull (%ebx), %edx
	movl (%edx), %eax
	pushl %eax 
	popl %eax 
	movl %eax, _y

# Line 17: b1:=true

	pushl $1 
	popl %eax 
	movl %eax, _b1

# Line 18: b2:=notfalse

	pushl $0 
	popl %eax 
	xorl $1, %eax
	pushl %eax 
	popl %eax 
	movl %eax, _b2

# Line 19: b2:=not(notb2orb1)

	pushl _b2 
	popl %eax 
	xorl $1, %eax
	pushl %eax 
	pushl _b1 
	popl %ebx 
	popl %eax 
	cmpl %eax, $0
	jne .OR_true_0 
	cmpl %ebx, $0
	jne .OR_true_0 
	pushl $0 
	jmp .DONE_1 
.OR_true_0:
	pushl $1 
.DONE_1:
	popl %eax 
	xorl $1, %eax
	pushl %eax 
	popl %eax 
	movl %eax, _b2

# 21: out.writeint(y)

	pushl _y 
	call writeint 
	leave  

# 22: out.writeint(x/2)

	pushl _x 
	pushl $2 
	popl %ebx 
	popl %eax 
	movl (%ebx), %ecx
	cltd  
	idivl (%ecx) 
	pushl %eax 
	call writeint 
	leave  

# Line 24: y:=y-x

	pushl _y 
	pushl _x 
	popl %ebx 
	popl %eax 
	subl %ebx, %eax
	pushl %eax 
	popl %eax 
	movl %eax, _y

# 25: out.writeint(y+4)

	pushl _y 
	pushl $4 
	popl %ebx 
	popl %eax 
	addl %ebx, %eax
	pushl %eax 
	call writeint 
	leave  

# 26: out.writeint(-(9-5))

	pushl $9 
	pushl $5 
	popl %ebx 
	popl %eax 
	subl %ebx, %eax
	pushl %eax 
	popl %eax 
	negl %eax 
	pushl %eax 
	call writeint 
	leave  

# 27: out.writeint(5-2*3+1)

	pushl $5 
	pushl $2 
	pushl $3 
	popl %ebx 
	popl %eax 
	xorl %ecx, %ecx
	movl (%eax), %edx
	imull (%ebx), %edx
	movl (%edx), %eax
	pushl %eax 
	popl %ebx 
	popl %eax 
	subl %ebx, %eax
	pushl %eax 
	pushl $1 
	popl %ebx 
	popl %eax 
	addl %ebx, %eax
	pushl %eax 
	call writeint 
	leave  
	pushl $0 
	call exit 
