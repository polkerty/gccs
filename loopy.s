.data

# Line 2: x:int



	.comm _x 4, 4
.text
.global main
main:

# Line 6: x:=3

	pushl $3 
	popl %eax 
	movl %eax, _x

# Line 7: if(x>0)then

	pushl _x 
	pushl $0 
	popl %ebx 
	popl %eax 
	cmpl %ebx, %eax
	jle .GR_false_0 
	pushl $1 
	jmp .DONE_1 
.GR_false_0:
	pushl $0 
.DONE_1:
	popl %eax 
	cmpl $0, %eax
	jne _IF_true_2 
	jmp _IF_false_3 
_IF_true_2:

# Line 8: loopwhilex>0

WHILE_top_5:
	pushl _x 
	pushl $0 
	popl %ebx 
	popl %eax 
	cmpl %ebx, %eax
	jle .GR_false_8 
	pushl $1 
	jmp .DONE_9 
.GR_false_8:
	pushl $0 
.DONE_9:
	popl %eax 
	cmpl $0, %eax
	jne WHILE_start_6 
	jmp WHILE_end_7 
WHILE_start_6:

# 9: out.writeint(x)

	pushl _x 
	call writeint 
	addl $4, %esp

# Line 10: x:=x-1

	pushl _x 
	pushl $1 
	popl %ebx 
	popl %eax 
	subl %ebx, %eax
	pushl %eax 
	popl %eax 
	movl %eax, _x
	jmp WHILE_top_5 
WHILE_end_7:
	jmp _IF_done_4 
_IF_false_3:

# 13: out.writeint(999)

	pushl $999 
	call writeint 
	addl $4, %esp
_IF_done_4:
	pushl $0 
	call exit 
