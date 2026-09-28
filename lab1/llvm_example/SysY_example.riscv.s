	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.file	"SysY_example.c"
	.option	push
	.option	arch, +zifencei
	.globl	scale_array                     # -- Begin function scale_array
	.p2align	1
	.type	scale_array,@function
scale_array:                            # @scale_array
# %bb.0:
	addi	sp, sp, -48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	addi	s0, sp, 48
	sd	a0, -24(s0)
	sw	a1, -28(s0)
	sw	a2, -32(s0)
	sw	zero, -36(s0)
	j	.LBB0_1
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -36(s0)
	lw	a1, -28(s0)
	bge	a0, a1, .LBB0_3
	j	.LBB0_2
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -24(s0)
	lw	a1, -36(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a1, 0(a0)
	lw	a2, -32(s0)
	mulw	a1, a1, a2
	sw	a1, 0(a0)
	lw	a0, -36(s0)
	addiw	a0, a0, 1
	sw	a0, -36(s0)
	j	.LBB0_1
.LBB0_3:
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	scale_array, .Lfunc_end0-scale_array
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +zifencei
	.globl	sum_positive                    # -- Begin function sum_positive
	.p2align	1
	.type	sum_positive,@function
sum_positive:                           # @sum_positive
# %bb.0:
	addi	sp, sp, -48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	addi	s0, sp, 48
	sd	a0, -24(s0)
	sw	a1, -28(s0)
	sw	zero, -32(s0)
	sw	zero, -36(s0)
	lui	a0, %hi(positive_count)
	sw	zero, %lo(positive_count)(a0)
	j	.LBB1_1
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -36(s0)
	lw	a1, -28(s0)
	bge	a0, a1, .LBB1_5
	j	.LBB1_2
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
	ld	a0, -24(s0)
	lw	a1, -36(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	blez	a0, .LBB1_4
	j	.LBB1_3
.LBB1_3:                                #   in Loop: Header=BB1_1 Depth=1
	lw	a0, -32(s0)
	ld	a1, -24(s0)
	lw	a2, -36(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	lw	a1, 0(a1)
	addw	a0, a0, a1
	sw	a0, -32(s0)
	lui	a0, %hi(positive_count)
	lw	a1, %lo(positive_count)(a0)
	addiw	a1, a1, 1
	sw	a1, %lo(positive_count)(a0)
	j	.LBB1_4
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	lw	a0, -36(s0)
	addiw	a0, a0, 1
	sw	a0, -36(s0)
	j	.LBB1_1
.LBB1_5:
	lw	a0, -32(s0)
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end1:
	.size	sum_positive, .Lfunc_end1-sum_positive
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +zifencei
	.globl	classify_average                # -- Begin function classify_average
	.p2align	1
	.type	classify_average,@function
classify_average:                       # @classify_average
# %bb.0:
	addi	sp, sp, -48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	addi	s0, sp, 48
	sw	a0, -24(s0)
	sw	a1, -28(s0)
	lw	a0, -28(s0)
	bnez	a0, .LBB2_2
	j	.LBB2_1
.LBB2_1:
	sw	zero, -20(s0)
	j	.LBB2_9
.LBB2_2:
	lw	a0, -24(s0)
	lw	a1, -28(s0)
	divw	a0, a0, a1
	sw	a0, -32(s0)
	lw	a0, -24(s0)
	lw	a1, -28(s0)
	remw	a0, a0, a1
	sw	a0, -36(s0)
	lw	a0, -32(s0)
	li	a1, 5
	blt	a0, a1, .LBB2_5
	j	.LBB2_3
.LBB2_3:
	lw	a0, -36(s0)
	bltz	a0, .LBB2_5
	j	.LBB2_4
.LBB2_4:
	li	a0, 1
	sw	a0, -20(s0)
	j	.LBB2_9
.LBB2_5:
	lw	a0, -32(s0)
	bltz	a0, .LBB2_7
	j	.LBB2_6
.LBB2_6:
	lw	a0, -32(s0)
	li	a1, 4
	blt	a1, a0, .LBB2_8
	j	.LBB2_7
.LBB2_7:
	li	a0, -1
	sw	a0, -20(s0)
	j	.LBB2_9
.LBB2_8:
	li	a0, 1
	sw	a0, -20(s0)
	j	.LBB2_9
.LBB2_9:
	lw	a0, -20(s0)
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end2:
	.size	classify_average, .Lfunc_end2-classify_average
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +zifencei
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -64
	sd	ra, 56(sp)                      # 8-byte Folded Spill
	sd	s0, 48(sp)                      # 8-byte Folded Spill
	sd	s1, 40(sp)                      # 8-byte Folded Spill
	addi	s0, sp, 64
	sw	zero, -28(s0)
	li	a0, -1
	sw	a0, -32(s0)
	li	a1, 1
	slli	a1, a1, 34
	addi	a1, a1, 7
	sd	a1, -40(s0)
	slli	a0, a0, 33
	addi	a0, a0, 3
	sd	a0, -48(s0)
	addi	a0, s0, -48
	li	a1, 5
	li	a2, 2
	call	scale_array
	addi	a0, s0, -48
	li	a1, 5
	call	sum_positive
	sw	a0, -52(s0)
	lw	a0, -52(s0)
	lui	s1, %hi(positive_count)
	lw	a1, %lo(positive_count)(s1)
	call	classify_average
	sw	a0, -56(s0)
	lw	a0, -52(s0)
	call	putint
	li	a0, 32
	call	putch
	lw	a0, %lo(positive_count)(s1)
	call	putint
	li	a0, 32
	call	putch
	lw	a0, -56(s0)
	call	putint
	li	a0, 10
	call	putch
	li	a0, 0
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
                                        # -- End function
	.option	pop
	.type	scale_factor,@object            # @scale_factor
	.section	.rodata,"a",@progbits
	.globl	scale_factor
	.p2align	2, 0x0
scale_factor:
	.word	2                               # 0x2
	.size	scale_factor, 4

	.type	positive_count,@object          # @positive_count
	.section	.sbss,"aw",@nobits
	.globl	positive_count
	.p2align	2, 0x0
positive_count:
	.word	0                               # 0x0
	.size	positive_count, 4

	.type	.L__const.main.values,@object   # @__const.main.values
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.L__const.main.values:
	.word	3                               # 0x3
	.word	4294967294                      # 0xfffffffe
	.word	7                               # 0x7
	.word	4                               # 0x4
	.word	4294967295                      # 0xffffffff
	.size	.L__const.main.values, 20

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
