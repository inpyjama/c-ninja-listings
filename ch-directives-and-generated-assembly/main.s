	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	initialized_array
	.data
	.align	2
	.type	initialized_array, @object
	.size	initialized_array, 14
initialized_array:
	.string	"Hello, World!"
	.globl	initialized_int
	.section	.sdata,"aw"
	.align	2
	.type	initialized_int, @object
	.size	initialized_int, 4
initialized_int:
	.word	10
	.globl	uninitialized_int
	.section	.sbss,"aw",@nobits
	.align	2
	.type	uninitialized_int, @object
	.size	uninitialized_int, 4
uninitialized_int:
	.zero	4
	.text
	.align	2
	.globl	function
	.type	function, @function
function:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	lui	a5,%hi(initialized_int)
	lw	a5,%lo(initialized_int)(a5)
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	addi	a4,a5,1
	lui	a5,%hi(uninitialized_int)
	sw	a4,%lo(uninitialized_int)(a5)
	lui	a5,%hi(uninitialized_int)
	lw	a5,%lo(uninitialized_int)(a5)
	addi	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	function, .-function
	.ident	"GCC: () 10.2.0"
