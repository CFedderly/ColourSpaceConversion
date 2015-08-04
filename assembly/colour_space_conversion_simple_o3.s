	.arch armv5
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"colour_space_conversion.c"
	.global	__aeabi_fmul
	.global	__aeabi_f2iz
	.global	__aeabi_i2f
	.global	__aeabi_fadd
	.text
	.align	2
	.global	convert_rgb_to_ycc
	.type	convert_rgb_to_ycc, %function
convert_rgb_to_ycc:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #0]
	cmp	r2, #0
	ldr	r1, [r1, #12]
	sub	sp, sp, #44
	movne	ip, #0
	str	r2, [sp, #20]
	str	r0, [sp, #4]
	str	r3, [sp, #24]
	str	r1, [sp, #8]
	strne	ip, [sp, #12]
	strne	ip, [sp, #36]
	beq	.L6
.L3:
	ldr	r2, [sp, #24]
	cmp	r2, #0
	beq	.L5
	ldr	ip, [sp, #8]
	ldr	r3, [sp, #36]
	ldr	lr, [sp, #4]
	ldr	r3, [ip, r3]
	ldr	lr, [lr, #12]
	mov	ip, #0
	str	r3, [sp, #28]
	str	ip, [sp, #16]
	str	r3, [sp, #32]
	mov	fp, ip
	str	lr, [sp, #0]
.L4:
	ldr	r4, [sp, #28]
	ldr	r1, .L9
	ldr	r0, [r4, fp]!	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	ldr	r1, .L9
	mov	r7, r0
	ldr	r0, [r4, #4]	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	ldr	lr, [sp, #32]
	mov	r4, r0
	ldr	r1, .L9
	ldr	r0, [lr, #8]	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	mov	r1, r7, asl #8
	mov	r6, r0, asl #4
	mov	r5, r0, asl #6
	mov	r3, r7, asl #3
	add	r2, r6, r5
	add	r3, r3, r1
	rsb	r3, r7, r3
	mov	r1, r2, asl #2
	mov	r8, r0
	add	r2, r2, r1
	mov	sl, r4, asl #5
	mov	r0, r4, asl #12
	mov	r3, r3, asl #3
	add	r3, r3, r7
	add	r0, sl, r0
	add	r2, r2, r8
	add	r0, r0, r3
	mov	r2, r2, asl #1
	add	r0, r0, r2
	mov	r0, r0, asr #12
	bl	__aeabi_i2f
	mov	r1, #973078528
	bl	__aeabi_fmul
	ldr	r1, .L9+4
	bl	__aeabi_fadd
	mov	r3, r4, asl #2
	mov	r9, r7, asl #2
	add	r3, r3, sl
	mov	r1, r7, asl #4
	sub	r5, r5, r8, asl #2
	add	r3, r3, r4
	add	r1, r9, r1
	mov	r2, r5, asl #4
	mov	r3, r3, asl #2
	rsb	r1, r7, r1
	ldr	lr, [sp, #0]
	ldr	ip, [sp, #36]
	rsb	r2, r5, r2
	add	r3, r3, r4
	sub	r1, r7, r1, asl #4
	mov	r1, r1, asl #2
	sub	r3, r4, r3, asl #4
	rsb	r2, r8, r2
	ldr	r5, [lr, ip]
	mov	r2, r2, asl #2
	add	r3, r3, r1
	add	r3, r3, r2
	str	r0, [r5, fp]!	@ float
	mov	r0, r3, asr #12
	bl	__aeabi_i2f
	mov	r1, #973078528
	bl	__aeabi_fmul
	mov	r1, #1124073472
	bl	__aeabi_fadd
	mov	r3, r4, asl #6
	sub	r3, r3, r4, asl #4
	mov	r1, r7, asl #6
	rsb	r1, r9, r1
	rsb	r3, r4, r3
	mov	ip, r8, asl #7
	mov	r2, r1, asl #4
	mov	r3, r3, asl #3
	add	r6, r6, ip
	add	r3, r3, r4
	rsb	r2, r1, r2
	sub	r4, r4, r3, asl #2
	rsb	r2, r7, r2
	add	r6, r6, r8
	mov	r2, r2, asl #2
	mov	r4, r4, asl #1
	mov	r6, r6, asl #2
	add	r4, r4, r2
	add	r6, r6, r8
	rsb	r4, r6, r4
	str	r0, [r5, #4]	@ float
	mov	r0, r4, asr #12
	bl	__aeabi_i2f
	mov	r1, #973078528
	bl	__aeabi_fmul
	mov	r1, #1124073472
	bl	__aeabi_fadd
	ldr	r2, [sp, #16]
	ldr	ip, [sp, #32]
	ldr	r3, [sp, #24]
	add	r2, r2, #1
	add	ip, ip, #12
	cmp	r3, r2
	str	r2, [sp, #16]
	str	r0, [r5, #8]	@ float
	add	fp, fp, #12
	str	ip, [sp, #32]
	bhi	.L4
.L5:
	ldr	r2, [sp, #12]
	ldr	ip, [sp, #36]
	ldr	r3, [sp, #20]
	add	r2, r2, #1
	add	ip, ip, #4
	cmp	r3, r2
	str	r2, [sp, #12]
	str	ip, [sp, #36]
	bhi	.L3
.L6:
	add	sp, sp, #44
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L10:
	.align	2
.L9:
	.word	1149239296
	.word	1098907648
	.size	convert_rgb_to_ycc, .-convert_rgb_to_ycc
	.global	__aeabi_fsub
	.global	__aeabi_f2d
	.global	__aeabi_dmul
	.global	__aeabi_dadd
	.global	__aeabi_d2f
	.global	__aeabi_f2uiz
	.align	2
	.global	convert_ycc_to_rgb
	.type	convert_ycc_to_rgb, %function
convert_ycc_to_rgb:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r2, [r0, #4]
	sub	sp, sp, #44
	cmp	r2, #0
	str	r0, [sp, #12]
	mov	fp, r1
	ble	.L16
	mov	r1, #0
	ldr	r3, [r0, #0]
	str	r1, [sp, #28]
	mov	r8, #4
.L13:
	cmp	r3, #0
	ble	.L15
	ldr	r3, [sp, #28]
	ldr	r1, [sp, #28]
	mov	r2, #0
	mov	r3, r3, asl #2
	str	r2, [sp, #32]
	str	r3, [sp, #36]
	mov	r7, r1, asl #3
	mov	r9, r2
.L14:
	ldr	r2, [sp, #12]
	ldr	r1, [sp, #36]
	ldr	r3, [r2, #12]
	mov	r2, r9, asl #1
	ldr	r4, [r3, r1]
	ldr	r1, .L18
	ldr	r0, [r4, r9, asl #1]	@ float
	add	r4, r4, r2
	bl	__aeabi_fsub
	bl	__aeabi_f2d
	ldr	r2, .L18+4
	ldr	r3, .L18+8
	bl	__aeabi_dmul
	stmia	sp, {r0-r1}
	ldr	r0, [r4, #8]	@ float
	mov	r1, #1124073472
	bl	__aeabi_fsub
	bl	__aeabi_f2d
	mov	r5, r0
	mov	r6, r1
	ldr	r0, [r4, #4]	@ float
	mov	r1, #1124073472
	bl	__aeabi_fsub
	bl	__aeabi_f2d
	ldr	r2, .L18+12
	str	r0, [sp, #16]
	str	r1, [sp, #20]
	ldr	r3, .L18+16
	mov	r0, r5
	mov	r1, r6
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldmia	sp, {r0-r1}
	bl	__aeabi_dadd
	bl	__aeabi_d2f
	ldr	r1, .L18+20
	bl	__aeabi_fmul
	bl	__aeabi_f2uiz
	ldr	r2, .L18+24
	mov	sl, r0
	ldr	r3, .L18+28
	mov	r0, r5
	mov	r1, r6
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldmia	sp, {r0-r1}
	bl	__aeabi_dadd
	ldr	r2, .L18+32
	mov	r4, r0
	mov	r5, r1
	ldr	r3, .L18+36
	add	r1, sp, #16
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	bl	__aeabi_d2f
	ldr	r1, .L18+20
	bl	__aeabi_fmul
	bl	__aeabi_f2uiz
	ldr	r2, .L18+40
	mov	r4, r0
	ldr	r3, .L18+44
	add	r1, sp, #16
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldmia	sp, {r0-r1}
	bl	__aeabi_dadd
	bl	__aeabi_d2f
	ldr	r1, .L18+20
	bl	__aeabi_fmul
	bl	__aeabi_f2uiz
	ldr	r3, [fp, #12]
	and	sl, sl, #255
	ldr	r2, [r3, r7]
	and	r4, r4, #255
	strb	sl, [r2, r9]
	ldr	r1, [fp, #12]
	ldr	r2, [sp, #32]
	ldr	r3, [r1, r7]
	add	r2, r2, #1
	add	r3, r3, r9
	str	r2, [sp, #32]
	strb	r4, [r3, #1]
	ldr	r2, [fp, #12]
	and	r0, r0, #255
	ldr	r3, [r2, r7]
	add	ip, r9, #3
	add	r3, r3, r9
	strb	r0, [r3, #2]
	ldr	r2, [fp, #12]
	ldr	r3, [r2, r7]
	strb	sl, [r3, ip]
	ldr	r2, [fp, #12]
	ldr	r3, [r2, r7]
	add	r3, r3, ip
	strb	r4, [r3, #1]
	ldr	r2, [fp, #12]
	ldr	r3, [r2, r7]
	add	r3, r3, ip
	strb	r0, [r3, #2]
	ldr	r2, [fp, #12]
	ldr	r3, [r2, r8]
	strb	sl, [r3, r9]
	ldr	r2, [fp, #12]
	ldr	r3, [r2, r8]
	add	r3, r3, r9
	strb	r4, [r3, #1]
	ldr	r2, [fp, #12]
	ldr	r3, [r2, r8]
	add	r3, r3, r9
	strb	r0, [r3, #2]
	ldr	r2, [fp, #12]
	add	r9, r9, #6
	ldr	r3, [r2, r8]
	strb	sl, [r3, ip]
	ldr	r2, [fp, #12]
	ldr	r3, [r2, r8]
	add	r3, r3, ip
	strb	r4, [r3, #1]
	ldr	r2, [fp, #12]
	ldr	r3, [r2, r8]
	add	r3, r3, ip
	strb	r0, [r3, #2]
	ldr	r1, [sp, #12]
	ldr	r2, [sp, #32]
	ldr	r3, [r1, #0]
	cmp	r3, r2
	bgt	.L14
	ldr	r2, [r1, #4]
.L15:
	ldr	r1, [sp, #28]
	add	r8, r8, #8
	add	r1, r1, #1
	cmp	r1, r2
	str	r1, [sp, #28]
	blt	.L13
.L16:
	add	sp, sp, #44
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L19:
	.align	2
.L18:
	.word	1098907648
	.word	1992864825
	.word	1072865214
	.word	1271310320
	.word	1073318199
	.word	1132462080
	.word	-1821066134
	.word	-1075182568
	.word	-584115552
	.word	-1076296156
	.word	790273982
	.word	1073751261
	.size	convert_ycc_to_rgb, .-convert_ycc_to_rgb
	.align	2
	.global	free_rgb_array
	.type	free_rgb_array, %function
free_rgb_array:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	stmfd	sp!, {r4, r5, r6, lr}
	cmp	r3, #0
	mov	r5, r0
	ble	.L21
	mov	r4, #0
.L22:
	ldr	r3, [r5, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r5, #4]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L22
.L21:
	ldr	r0, [r5, #12]
	bl	free
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, lr}
	b	free
	.size	free_rgb_array, .-free_rgb_array
	.align	2
	.global	free_ycc_array
	.type	free_ycc_array, %function
free_ycc_array:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	stmfd	sp!, {r4, r5, r6, lr}
	cmp	r3, #0
	mov	r5, r0
	ble	.L26
	mov	r4, #0
.L27:
	ldr	r3, [r5, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r5, #4]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L27
.L26:
	ldr	r0, [r5, #12]
	bl	free
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, lr}
	b	free
	.size	free_ycc_array, .-free_ycc_array
	.align	2
	.global	free_pixel_array
	.type	free_pixel_array, %function
free_pixel_array:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	stmfd	sp!, {r4, r5, r6, lr}
	cmp	r3, #0
	mov	r5, r0
	ble	.L31
	mov	r4, #0
.L32:
	ldr	r3, [r5, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r5, #4]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L32
.L31:
	ldr	r0, [r5, #12]
	bl	free
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, lr}
	b	free
	.size	free_pixel_array, .-free_pixel_array
	.align	2
	.global	free_bmp_info
	.type	free_bmp_info, %function
free_bmp_info:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r4, r0
	ldr	r0, [r0, #56]
	bl	free
	mov	r0, r4
	ldmfd	sp!, {r4, lr}
	b	free
	.size	free_bmp_info, .-free_bmp_info
	.align	2
	.global	mmalloc
	.type	mmalloc, %function
mmalloc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	malloc
	cmp	r0, #0
	ldmnefd	sp!, {r4, pc}
	ldr	r0, .L40
	bl	puts
	mvn	r0, #0
	bl	exit
.L41:
	.align	2
.L40:
	.word	.LC0
	.size	mmalloc, .-mmalloc
	.align	2
	.global	write_to_bmp
	.type	write_to_bmp, %function
write_to_bmp:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	mov	r4, r0
	sub	sp, sp, #8
	mov	r8, r1
	ldr	r0, .L52
	ldr	r1, .L52+4
	bl	fopen
	mov	r7, r0
	mov	r1, #2
	mov	r2, #1
	mov	r3, r7
	mov	r0, r4
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, r1
	bl	fwrite
	mov	r1, #2
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #8
	bl	fwrite
	mov	r1, #2
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #10
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #12
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #16
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #20
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #24
	bl	fwrite
	mov	r1, #2
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #28
	bl	fwrite
	mov	r1, #2
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #30
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #32
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #36
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #40
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #44
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #48
	bl	fwrite
	mov	r3, r7
	add	r0, r4, #52
	mov	r1, #4
	mov	r2, #1
	bl	fwrite
	ldr	r3, [r8, #4]
	cmp	r3, #0
	addgt	sl, sp, #8
	movgt	r3, #48
	strgtb	r3, [sl, #-1]!
	movgt	r9, #0
	ble	.L49
.L44:
	ldr	r3, [r8, #0]
	cmp	r3, #0
	movgt	r6, #0
	movgt	r5, r9, asl #2
	movgt	r4, r6
	ble	.L48
.L45:
	ldr	r3, [r8, #12]
	mov	r1, #1
	ldr	r0, [r3, r5]
	mov	r2, r1
	add	r0, r0, r4
	mov	r3, r7
	add	r0, r0, #2
	bl	fwrite
	ldr	r3, [r8, #12]
	mov	r1, #1
	ldr	r0, [r3, r5]
	mov	r2, r1
	add	r0, r0, r4
	add	r0, r0, r1
	mov	r3, r7
	bl	fwrite
	ldr	r3, [r8, #12]
	mov	r1, #1
	ldr	r0, [r3, r5]
	mov	r2, r1
	add	r0, r0, r4
	mov	r3, r7
	bl	fwrite
	ldr	r3, [r8, #0]
	add	r6, r6, #1
	cmp	r6, r3
	add	r4, r4, #3
	blt	.L45
.L48:
	ldrsb	r3, [r8, #10]
	cmp	r3, #0
	ble	.L46
	mov	r4, #0
.L47:
	mov	r1, #1
	mov	r3, r7
	mov	r0, sl
	mov	r2, r1
	bl	fwrite
	ldrsb	r3, [r8, #10]
	add	r4, r4, #1
	cmp	r4, r3
	blt	.L47
.L46:
	ldr	r3, [r8, #4]
	add	r9, r9, #1
	cmp	r9, r3
	blt	.L44
.L49:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L53:
	.align	2
.L52:
	.word	.LC1
	.word	.LC2
	.size	write_to_bmp, .-write_to_bmp
	.align	2
	.global	allocate_ycc_array
	.type	allocate_ycc_array, %function
allocate_ycc_array:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, r0
	mov	r0, #16
	bl	malloc
	subs	r5, r0, #0
	beq	.L63
	ldr	r0, [r4, #4]
	add	r0, r0, r0, lsr #31
	mov	r0, r0, asr #1
	str	r0, [r5, #4]
	ldr	r3, [r4, #0]
	mov	r0, r0, asl #2
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	str	r3, [r5, #0]
	bl	malloc
	subs	r6, r0, #0
	beq	.L63
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ble	.L57
	mov	r4, #0
.L59:
	ldr	r3, [r5, #0]
	mov	r0, r3, asl #4
	sub	r0, r0, r3, asl #2
	bl	malloc
	cmp	r0, #0
	beq	.L63
	ldr	r3, [r5, #4]
	str	r0, [r6, r4, asl #2]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L59
.L57:
	str	r6, [r5, #12]
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, pc}
.L63:
	ldr	r0, .L64
	bl	puts
	mvn	r0, #0
	bl	exit
.L65:
	.align	2
.L64:
	.word	.LC0
	.size	allocate_ycc_array, .-allocate_ycc_array
	.global	__aeabi_ui2f
	.align	2
	.type	get_rgb_pixel_array, %function
get_rgb_pixel_array:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	fp, r1
	ldr	r1, [r1, #4]
	sub	sp, sp, #36
	ands	r3, r1, #1
	movne	r2, r1
	str	r1, [sp, #12]
	ldr	r1, [fp, #0]
	addne	r2, r2, #1
	movne	r3, #1
	ldrb	r4, [fp, #10]	@ zero_extendqisi2
	strne	r2, [sp, #12]
	str	r3, [sp, #20]
	ands	r3, r1, #1
	movne	r2, r1
	str	r1, [sp, #8]
	ldr	r1, [sp, #12]
	addne	r2, r2, #1
	movne	r3, #1
	mov	r6, r0
	mov	r0, r1, asl #2
	strne	r2, [sp, #8]
	str	r3, [sp, #16]
	bl	malloc
	cmp	r0, #0
	str	r0, [sp, #24]
	beq	.L93
	mov	r0, #12
	bl	malloc
	subs	r7, r0, #0
	beq	.L93
	ldr	r3, [fp, #4]
	cmp	r3, #0
	ble	.L73
	ldr	r1, [sp, #8]
	mov	r2, r4, asl #24
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	mov	r2, r2, asr #24
	str	r3, [sp, #28]
	str	r2, [sp, #4]
	mov	r9, #0
.L78:
	ldr	r0, [sp, #28]
	bl	malloc
	subs	sl, r0, #0
	beq	.L93
	ldr	r8, [fp, #0]
	ldr	r2, [sp, #24]
	cmp	r8, #0
	str	sl, [r2, r9, asl #2]
	ble	.L75
	mov	r5, #0
	mov	r4, r5
.L76:
	ldrb	r0, [r6, #0]	@ zero_extendqisi2
	bl	__aeabi_ui2f
	mov	r1, #998244352
	bl	__aeabi_fmul
	str	r0, [r7, #8]	@ float
	ldrb	r0, [r6, #1]	@ zero_extendqisi2
	bl	__aeabi_ui2f
	mov	r1, #998244352
	bl	__aeabi_fmul
	str	r0, [r7, #4]	@ float
	ldrb	r0, [r6, #2]	@ zero_extendqisi2
	bl	__aeabi_ui2f
	mov	r1, #998244352
	bl	__aeabi_fmul
	add	r5, r5, #1
	str	r0, [r7, #0]	@ float
	add	r3, sl, r4
	cmp	r8, r5
	ldmia	r7, {r0, r1, r2}
	add	r6, r6, #3
	add	r4, r4, #12
	stmia	r3, {r0, r1, r2}
	bgt	.L76
.L75:
	ldr	r3, [sp, #4]
	add	r9, r9, #1
	cmp	r3, #0
	addgt	r6, r6, r3
	ldr	r3, [fp, #4]
	cmp	r3, r9
	bgt	.L78
.L73:
	ldr	r1, [sp, #20]
	cmp	r1, #0
	beq	.L79
	ldr	r8, [fp, #0]
	cmp	r8, #0
	ble	.L80
	ldr	r2, [sp, #12]
	ldr	r1, [sp, #24]
	mov	r3, r2, asl #2
	sub	r3, r3, #4
	sub	r2, r2, #2
	mov	r4, #0
	ldr	r6, [r1, r3]
	ldr	r5, [r1, r2, asl #2]
	mov	lr, r4
.L81:
	add	r4, r4, #1
	add	ip, r6, lr
	add	r3, r5, lr
	cmp	r8, r4
	ldmia	r3, {r0, r1, r2}
	add	lr, lr, #12
	stmia	ip, {r0, r1, r2}
	bgt	.L81
.L80:
	ldr	r2, [sp, #12]
	str	r2, [fp, #4]
.L79:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L82
	ldr	r1, [sp, #12]
	cmp	r1, #0
	ble	.L83
	ldr	r2, [sp, #8]
	mov	lr, #0
	mov	r3, r2, asl #4
	sub	r3, r3, r2, asl #2
	sub	r5, r3, #24
	sub	r4, r3, #12
.L84:
	ldr	r3, [sp, #24]
	ldr	r1, [sp, #12]
	ldr	ip, [r3, lr, asl #2]
	add	lr, lr, #1
	add	r3, ip, r5
	cmp	r1, lr
	add	ip, ip, r4
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	bgt	.L84
.L83:
	ldr	r3, [sp, #8]
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #30
	add	r3, r3, r2
	and	r3, r3, #3
	rsb	r3, r2, r3
	strb	r3, [fp, #10]
	ldr	r1, [sp, #8]
	str	r1, [fp, #0]
.L82:
	ldr	r2, [sp, #24]
	mov	r0, r7
	str	r2, [fp, #12]
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	free
.L93:
	ldr	r0, .L94
	bl	puts
	mvn	r0, #0
	bl	exit
.L95:
	.align	2
.L94:
	.word	.LC0
	.size	get_rgb_pixel_array, .-get_rgb_pixel_array
	.align	2
	.global	allocate_rgb_array
	.type	allocate_rgb_array, %function
allocate_rgb_array:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	mov	r0, #16
	mov	r4, r1
	mov	r5, r2
	bl	malloc
	subs	r8, r0, #0
	beq	.L105
	strb	r5, [r8, #10]
	stmia	r8, {r4, r6}	@ phole stm
	mov	r0, r6, asl #2
	bl	malloc
	subs	r7, r0, #0
	beq	.L105
	cmp	r6, #0
	ble	.L99
	mov	r3, r4, asl #1
	add	r5, r3, r4
	mov	r4, #0
.L101:
	mov	r0, r5
	bl	malloc
	cmp	r0, #0
	beq	.L105
	str	r0, [r7, r4, asl #2]
	add	r4, r4, #1
	cmp	r6, r4
	bgt	.L101
.L99:
	str	r7, [r8, #12]
	mov	r0, r8
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L105:
	ldr	r0, .L106
	bl	puts
	mvn	r0, #0
	bl	exit
.L107:
	.align	2
.L106:
	.word	.LC0
	.size	allocate_rgb_array, .-allocate_rgb_array
	.align	2
	.global	get_pixel_array
	.type	get_pixel_array, %function
get_pixel_array:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r5, r0
	mov	r0, #16
	bl	malloc
	subs	r4, r0, #0
	beq	.L111
	ldr	r0, [r5, #20]
	mov	r1, r4
	mov	r2, r0, asr #31
	mov	r2, r2, lsr #30
	add	r3, r0, r2
	and	r3, r3, #3
	rsb	r3, r2, r3
	strb	r3, [r4, #10]
	str	r0, [r4, #0]
	ldr	r3, [r5, #24]
	ldrh	r2, [r5, #30]
	ldr	r0, [r5, #56]
	strh	r2, [r4, #8]	@ movhi
	str	r3, [r4, #4]
	bl	get_rgb_pixel_array
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L111:
	ldr	r0, .L112
	bl	puts
	mvn	r0, #0
	bl	exit
.L113:
	.align	2
.L112:
	.word	.LC0
	.size	get_pixel_array, .-get_pixel_array
	.align	2
	.global	get_bmp_info
	.type	get_bmp_info, %function
get_bmp_info:
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r1, .L121
	sub	sp, sp, #96
	mov	r4, r0
	bl	fopen
	subs	r6, r0, #0
	beq	.L120
	mov	r0, #60
	bl	malloc
	subs	r5, r0, #0
	beq	.L119
	mov	r1, #2
	mov	r2, #1
	mov	r3, r6
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, r1
	bl	fread
	mov	r1, #2
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #8
	bl	fread
	mov	r1, #2
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #10
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #12
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #16
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #20
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #24
	bl	fread
	mov	r1, #2
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #28
	bl	fread
	mov	r1, #2
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #30
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #32
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #36
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #40
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #44
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #48
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #52
	bl	fread
	ldr	r7, [r5, #4]
	mov	r0, r7
	bl	malloc
	subs	r8, r0, #0
	beq	.L119
	mov	r0, r4
	mov	r1, #0
	bl	open
	add	r2, sp, #8
	mov	r4, r0
	mov	r1, r0
	mov	r0, #3
	bl	__fxstat
	mov	ip, #0
	mov	r2, #1
	mov	r0, ip
	ldr	r1, [sp, #52]
	mov	r3, r2
	stmia	sp, {r4, ip}	@ phole stm
	bl	mmap
	ldr	r3, [r5, #12]
	mov	r2, r7
	add	r1, r0, r3
	mov	r0, r8
	bl	memcpy
	str	r8, [r5, #56]
	mov	r0, r4
	bl	close
	mov	r0, r6
	bl	fclose
	mov	r0, r5
	add	sp, sp, #96
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L119:
	ldr	r0, .L121+4
	bl	puts
	mvn	r0, #0
	bl	exit
.L120:
	mov	r1, r4
	ldr	r0, .L121+8
	bl	printf
	mov	r0, r6
	bl	fclose
	mvn	r0, #0
	bl	exit
.L122:
	.align	2
.L121:
	.word	.LC3
	.word	.LC0
	.word	.LC4
	.size	get_bmp_info, .-get_bmp_info
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	cmp	r0, #2
	sub	sp, sp, #52
	bne	.L146
	ldr	r0, [r1, #4]
	bl	get_bmp_info
	str	r0, [sp, #24]
	mov	r0, #16
	bl	malloc
	cmp	r0, #0
	str	r0, [sp, #20]
	beq	.L147
	mov	r1, r0
	ldr	r0, [sp, #24]
	ldr	r2, [r0, #20]
	str	r2, [r1, #0]
	ldr	r3, [r0, #20]
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #30
	add	r3, r3, r2
	and	r3, r3, #3
	rsb	r3, r2, r3
	strb	r3, [r1, #10]
	ldrh	r3, [r0, #30]
	ldr	r2, [r0, #24]
	ldr	ip, [sp, #20]
	ldr	lr, [sp, #24]
	strh	r3, [ip, #8]	@ movhi
	ldr	r0, [lr, #56]
	str	r2, [ip, #4]
	bl	get_rgb_pixel_array
	ldr	r0, [sp, #20]
	ldrsh	r3, [r0, #8]
	cmp	r3, #24
	beq	.L148
	ldr	r0, .L149
	bl	puts
.L137:
	ldr	r3, [sp, #24]
	ldr	r0, [r3, #56]
	bl	free
	ldr	r0, [sp, #24]
	bl	free
	ldr	ip, [sp, #20]
	ldr	r3, [ip, #4]
	cmp	r3, #0
	ble	.L138
	mov	r4, #0
.L139:
	ldr	lr, [sp, #20]
	ldr	r3, [lr, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r0, [sp, #20]
	add	r4, r4, #1
	ldr	r3, [r0, #4]
	cmp	r4, r3
	blt	.L139
.L138:
	ldr	r2, [sp, #20]
	ldr	r0, [r2, #12]
	bl	free
	ldr	r0, [sp, #20]
	bl	free
	mov	r0, #0
	add	sp, sp, #52
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L148:
	bl	allocate_ycc_array
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	ldr	r2, [r2, #4]
	ldr	ip, [sp, #20]
	cmp	r2, #0
	ldr	r3, [r3, #12]
	ldr	ip, [ip, #0]
	str	r0, [sp, #28]
	movne	r0, #0
	str	r2, [sp, #12]
	str	r3, [sp, #32]
	str	ip, [sp, #4]
	strne	r0, [sp, #36]
	strne	r0, [sp, #44]
	beq	.L128
.L130:
	ldr	r2, [sp, #4]
	cmp	r2, #0
	beq	.L132
	ldr	r2, [sp, #32]
	ldr	r0, [sp, #44]
	mov	lr, #0
	ldr	r0, [r2, r0]
	ldr	r2, [sp, #28]
	str	lr, [sp, #40]
	ldr	r2, [r2, #12]
	str	r0, [sp, #8]
	str	r2, [sp, #16]
	mov	fp, lr
.L129:
	ldr	r3, [sp, #8]
	ldr	r1, .L149+4
	ldr	r0, [r3, fp]	@ float
	bl	__aeabi_fmul
	ldr	ip, [sp, #8]
	add	r5, ip, fp
	bl	__aeabi_f2iz
	ldr	r1, .L149+4
	mov	r7, r0
	ldr	r0, [r5, #4]	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	ldr	r1, .L149+4
	mov	r4, r0
	ldr	r0, [r5, #8]	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	mov	r1, r7, asl #8
	mov	r6, r0, asl #4
	mov	r5, r0, asl #6
	mov	r3, r7, asl #3
	add	r2, r6, r5
	add	r3, r3, r1
	rsb	r3, r7, r3
	mov	r1, r2, asl #2
	mov	r8, r0
	add	r2, r2, r1
	mov	sl, r4, asl #5
	mov	r0, r4, asl #12
	mov	r3, r3, asl #3
	add	r3, r3, r7
	add	r0, sl, r0
	add	r2, r2, r8
	add	r0, r0, r3
	mov	r2, r2, asl #1
	add	r0, r0, r2
	mov	r0, r0, asr #12
	bl	__aeabi_i2f
	mov	r1, #973078528
	bl	__aeabi_fmul
	ldr	r1, .L149+8
	bl	__aeabi_fadd
	mov	r3, r4, asl #2
	mov	r9, r7, asl #2
	add	r3, r3, sl
	mov	r1, r7, asl #4
	sub	r5, r5, r8, asl #2
	add	r3, r3, r4
	add	r1, r9, r1
	mov	r2, r5, asl #4
	mov	r3, r3, asl #2
	rsb	r1, r7, r1
	ldr	lr, [sp, #44]
	ldr	ip, [sp, #16]
	rsb	r2, r5, r2
	add	r3, r3, r4
	sub	r1, r7, r1, asl #4
	mov	r1, r1, asl #2
	sub	r3, r4, r3, asl #4
	rsb	r2, r8, r2
	ldr	r5, [ip, lr]
	mov	r2, r2, asl #2
	add	r3, r3, r1
	add	r3, r3, r2
	str	r0, [r5, fp]!	@ float
	mov	r0, r3, asr #12
	bl	__aeabi_i2f
	mov	r1, #973078528
	bl	__aeabi_fmul
	mov	r1, #1124073472
	bl	__aeabi_fadd
	mov	r3, r4, asl #6
	sub	r3, r3, r4, asl #4
	mov	r1, r7, asl #6
	rsb	r1, r9, r1
	rsb	r3, r4, r3
	mov	ip, r8, asl #7
	mov	r2, r1, asl #4
	mov	r3, r3, asl #3
	add	r6, r6, ip
	add	r3, r3, r4
	rsb	r2, r1, r2
	sub	r4, r4, r3, asl #2
	rsb	r2, r7, r2
	add	r6, r6, r8
	mov	r2, r2, asl #2
	mov	r4, r4, asl #1
	mov	r6, r6, asl #2
	add	r4, r4, r2
	add	r6, r6, r8
	rsb	r4, r6, r4
	str	r0, [r5, #4]	@ float
	mov	r0, r4, asr #12
	bl	__aeabi_i2f
	mov	r1, #973078528
	bl	__aeabi_fmul
	mov	r1, #1124073472
	bl	__aeabi_fadd
	ldr	lr, [sp, #40]
	ldr	r2, [sp, #4]
	add	lr, lr, #1
	cmp	r2, lr
	str	lr, [sp, #40]
	str	r0, [r5, #8]	@ float
	add	fp, fp, #12
	bhi	.L129
.L132:
	ldr	r3, [sp, #36]
	ldr	lr, [sp, #44]
	ldr	ip, [sp, #12]
	add	r3, r3, #1
	add	lr, lr, #4
	cmp	ip, r3
	str	r3, [sp, #36]
	str	lr, [sp, #44]
	bhi	.L130
.L128:
	ldr	r3, [sp, #20]
	ldr	r1, [sp, #4]
	ldrsb	r2, [r3, #10]
	ldr	r0, [sp, #12]
	bl	allocate_rgb_array
	mov	r5, r0
	mov	r1, r5
	ldr	r0, [sp, #28]
	bl	convert_ycc_to_rgb
	ldr	ip, [sp, #28]
	ldr	r3, [ip, #4]
	cmp	r3, #0
	ble	.L133
	mov	r4, #0
.L134:
	ldr	lr, [sp, #28]
	ldr	r3, [lr, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r0, [sp, #28]
	add	r4, r4, #1
	ldr	r3, [r0, #4]
	cmp	r4, r3
	blt	.L134
.L133:
	ldr	r2, [sp, #28]
	ldr	r0, [r2, #12]
	bl	free
	ldr	r0, [sp, #28]
	bl	free
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ble	.L135
	mov	r4, #0
.L136:
	ldr	r3, [r5, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r5, #4]
	add	r4, r4, #1
	cmp	r4, r3
	blt	.L136
.L135:
	ldr	r0, [r5, #12]
	bl	free
	mov	r0, r5
	bl	free
	b	.L137
.L147:
	ldr	r0, .L149+12
	bl	puts
	mvn	r0, #0
	bl	exit
.L146:
	ldr	r0, .L149+16
	bl	puts
	mvn	r0, #0
	bl	exit
.L150:
	.align	2
.L149:
	.word	.LC6
	.word	1149239296
	.word	1098907648
	.word	.LC0
	.word	.LC5
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Error allocating memory. Exiting.\000"
	.space	2
.LC1:
	.ascii	"converted.bmp\000"
	.space	2
.LC2:
	.ascii	"wb\000"
	.space	1
.LC3:
	.ascii	"rb\000"
	.space	1
.LC4:
	.ascii	"Unable to open file: %s. Exiting.\012\000"
	.space	1
.LC5:
	.ascii	"Usage: ./csc <bmp_file_name>\000"
	.space	3
.LC6:
	.ascii	"Can only read 24bpp bmp files to convert from rgb t"
	.ascii	"o ycc.\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
