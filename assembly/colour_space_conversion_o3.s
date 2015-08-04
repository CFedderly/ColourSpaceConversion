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
	@ args = 0, pretend = 0, frame = 592
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #596
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r2, [r0, #4]
	ldr	r1, [r1, #12]
	ldr	r3, [r0, #0]
	cmp	r2, #0
	str	r0, [sp, #552]
	str	r2, [sp, #568]
	str	r1, [sp, #556]
	str	r3, [sp, #572]
	beq	.L6
	mov	r4, #0
	str	r4, [sp, #560]
.L5:
	ldr	r6, [sp, #572]
	cmp	r6, #0
	beq	.L3
	ldr	fp, [sp, #560]
	ldr	lr, [sp, #556]
	mov	r2, fp, asl #1
	add	r3, r2, #1
	ldr	r2, [lr, r2, asl #2]
	ldr	r3, [lr, r3, asl #2]
	str	r2, [sp, #576]
	ldr	r2, [sp, #552]
	mov	r1, #0
	ldr	r2, [r2, #12]
	str	r3, [sp, #580]
	mov	r3, fp, asl #2
	str	r1, [sp, #564]
	str	r2, [sp, #12]
	str	r3, [sp, #584]
	str	r1, [sp, #588]
.L4:
	ldr	r4, [sp, #564]
	ldr	fp, [sp, #576]
	mov	r6, r4, asl #5
	sub	r6, r6, r4, asl #3
	ldr	r0, [fp, r6]	@ float
	ldr	r1, .L10
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	add	r4, fp, r6
	ldr	r1, .L10
	str	r0, [sp, #548]
	ldr	r0, [r4, #4]	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	ldr	r1, .L10
	mov	r7, r0
	ldr	r0, [r4, #8]	@ float
	bl	__aeabi_fmul
	ldr	lr, [sp, #564]
	mov	r4, lr, asl #1
	bl	__aeabi_f2iz
	add	r4, r4, #1
	mov	r5, r4, asl #4
	sub	r5, r5, r4, asl #2
	ldr	r1, .L10
	str	r0, [sp, #544]
	ldr	r0, [fp, r5]	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	add	r4, fp, r5
	ldr	r1, .L10
	str	r0, [sp, #540]
	ldr	r0, [r4, #4]	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	ldr	r1, .L10
	mov	r9, r0
	ldr	r0, [r4, #8]	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	ldr	r1, [sp, #580]
	str	r0, [sp, #536]
	ldr	r0, [r1, r6]	@ float
	ldr	r1, .L10
	bl	__aeabi_fmul
	ldr	r2, [sp, #580]
	add	r6, r2, r6
	bl	__aeabi_f2iz
	ldr	r1, .L10
	str	r0, [sp, #532]
	ldr	r0, [r6, #4]	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	ldr	r1, .L10
	mov	sl, r0
	ldr	r0, [r6, #8]	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	ldr	r3, [sp, #580]
	ldr	r1, .L10
	str	r0, [sp, #528]
	ldr	r0, [r3, r5]	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	ldr	r4, [sp, #580]
	ldr	r1, .L10
	add	r5, r4, r5
	str	r0, [sp, #524]
	ldr	r0, [r5, #4]	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	ldr	r1, .L10
	mov	r8, r0
	ldr	r0, [r5, #8]	@ float
	bl	__aeabi_fmul
	bl	__aeabi_f2iz
	ldr	r6, [sp, #544]
	ldr	fp, [sp, #544]
	mov	r6, r6, asl #4
	mov	fp, fp, asl #6
	ldr	lr, [sp, #548]
	add	r1, r6, fp
	str	r6, [sp, #444]
	ldr	r2, [sp, #536]
	ldr	r6, [sp, #536]
	mov	r3, lr, asl #8
	str	fp, [sp, #252]
	mov	r4, lr, asl #3
	ldr	fp, [sp, #540]
	mov	r2, r2, asl #4
	mov	r6, r6, asl #6
	str	r2, [sp, #492]
	str	r6, [sp, #304]
	add	r4, r4, r3
	mov	r3, lr, asl #2
	str	r3, [sp, #468]
	mov	r2, lr, asl #6
	mov	r3, fp, asl #8
	mov	r6, fp, asl #3
	ldr	lr, [sp, #492]
	ldr	fp, [sp, #304]
	str	r1, [sp, #112]
	add	lr, lr, fp
	str	lr, [sp, #136]
	ldr	lr, [sp, #468]
	str	r0, [sp, #520]
	rsb	r2, lr, r2
	str	r2, [sp, #464]
	ldr	r2, [sp, #540]
	mov	r0, r7, asl #5
	mov	r1, r7, asl #2
	mov	r2, r2, asl #2
	add	r1, r1, r0
	add	r6, r6, r3
	str	r2, [sp, #516]
	ldr	r3, [sp, #528]
	ldr	lr, [sp, #528]
	ldr	r2, [sp, #540]
	str	r1, [sp, #284]
	ldr	r1, [sp, #548]
	mov	fp, r9, asl #5
	mov	r3, r3, asl #4
	mov	lr, lr, asl #6
	mov	r2, r2, asl #6
	rsb	r4, r1, r4
	str	r3, [sp, #396]
	ldr	r1, [sp, #112]
	str	fp, [sp, #340]
	str	lr, [sp, #200]
	str	r2, [sp, #512]
	ldr	r2, [sp, #532]
	ldr	lr, [sp, #548]
	mov	r3, r9, asl #2
	str	r3, [sp, #344]
	mov	lr, lr, asl #4
	mov	r3, r2, asl #8
	str	lr, [sp, #0]
	str	r3, [sp, #4]
	mov	lr, r2, asl #3
	ldr	r3, [sp, #200]
	ldr	r2, [sp, #396]
	mov	fp, r1, asl #2
	add	r2, r2, r3
	str	r2, [sp, #68]
	ldr	r3, [sp, #0]
	ldr	r2, [sp, #468]
	mov	r4, r4, asl #3
	add	r2, r2, r3
	str	r2, [sp, #268]
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #112]
	add	lr, lr, r3
	add	fp, r2, fp
	str	fp, [sp, #108]
	str	lr, [sp, #88]
	ldr	fp, [sp, #512]
	ldr	lr, [sp, #516]
	ldr	r3, [sp, #340]
	ldr	r2, [sp, #344]
	rsb	fp, lr, fp
	add	r2, r2, r3
	str	fp, [sp, #508]
	ldr	r3, [sp, #520]
	ldr	fp, [sp, #284]
	ldr	lr, [sp, #540]
	add	fp, fp, r7
	str	r2, [sp, #336]
	mov	r3, r3, asl #4
	mov	r2, r7, asl #12
	str	fp, [sp, #280]
	rsb	r6, lr, r6
	str	r2, [sp, #116]
	ldr	lr, [sp, #544]
	str	r3, [sp, #364]
	ldr	fp, [sp, #252]
	ldr	r2, [sp, #520]
	ldr	r3, [sp, #464]
	sub	fp, fp, lr, asl #2
	mov	r2, r2, asl #6
	mov	r3, r3, asl #4
	str	fp, [sp, #248]
	str	r2, [sp, #156]
	str	r3, [sp, #460]
	ldr	r2, [sp, #136]
	ldr	r3, [sp, #544]
	mov	r2, r2, asl #2
	str	r2, [sp, #132]
	ldr	r2, [sp, #540]
	mov	r3, r3, asl #7
	str	r3, [sp, #440]
	mov	r2, r2, asl #4
	mov	r3, sl, asl #2
	str	r2, [sp, #0]
	str	r3, [sp, #236]
	ldr	r2, [sp, #364]
	ldr	r3, [sp, #156]
	ldr	fp, [sp, #532]
	add	r2, r2, r3
	str	r2, [sp, #28]
	ldr	r3, [sp, #464]
	ldr	r2, [sp, #460]
	mov	lr, sl, asl #5
	rsb	r2, r3, r2
	str	r2, [sp, #456]
	ldr	r3, [sp, #0]
	ldr	r2, [sp, #516]
	mov	fp, fp, asl #2
	add	r2, r2, r3
	str	fp, [sp, #420]
	ldr	r3, [sp, #132]
	str	lr, [sp, #232]
	ldr	fp, [sp, #532]
	mov	lr, r8, asl #6
	str	r2, [sp, #320]
	ldr	r2, [sp, #136]
	str	lr, [sp, #4]
	ldr	lr, [sp, #524]
	add	r2, r2, r3
	mov	fp, fp, asl #6
	str	fp, [sp, #416]
	ldr	r3, [sp, #548]
	mov	fp, lr, asl #3
	str	r2, [sp, #128]
	mov	lr, lr, asl #8
	ldr	r2, [sp, #116]
	add	lr, fp, lr
	add	r4, r4, r3
	add	r0, r0, r2
	ldr	r3, [sp, #544]
	ldr	r2, [sp, #108]
	str	lr, [sp, #44]
	ldr	fp, [sp, #416]
	ldr	lr, [sp, #420]
	add	r2, r2, r3
	rsb	fp, lr, fp
	str	r2, [sp, #104]
	str	fp, [sp, #412]
	ldr	r3, [sp, #440]
	ldr	r2, [sp, #444]
	ldr	lr, [sp, #336]
	ldr	fp, [sp, #4]
	add	r2, r2, r3
	add	lr, lr, r9
	str	r2, [sp, #436]
	str	lr, [sp, #332]
	sub	r2, fp, r8, asl #4
	ldr	lr, [sp, #548]
	ldr	r3, [sp, #280]
	ldr	fp, [sp, #268]
	mov	r3, r3, asl #2
	rsb	fp, lr, fp
	str	r3, [sp, #276]
	str	fp, [sp, #264]
	ldr	r3, [sp, #236]
	ldr	fp, [sp, #232]
	ldr	lr, [sp, #88]
	add	r3, r3, fp
	str	r3, [sp, #228]
	ldr	r3, [sp, #532]
	mov	fp, r9, asl #12
	rsb	lr, r3, lr
	str	lr, [sp, #84]
	ldr	r3, [sp, #536]
	ldr	lr, [sp, #304]
	str	fp, [sp, #148]
	sub	lr, lr, r3, asl #2
	ldr	r3, [sp, #524]
	str	lr, [sp, #300]
	mov	r3, r3, asl #2
	ldr	lr, [sp, #508]
	str	r3, [sp, #376]
	ldr	r3, [sp, #248]
	mov	fp, lr, asl #4
	mov	lr, r3, asl #4
	mov	r3, r8, asl #5
	str	r3, [sp, #188]
	ldr	r3, [sp, #68]
	mov	r6, r6, asl #3
	mov	r3, r3, asl #2
	str	r3, [sp, #64]
	ldr	r3, [sp, #536]
	add	r0, r0, r4
	mov	r3, r3, asl #7
	str	r3, [sp, #488]
	ldr	r3, [sp, #524]
	mov	r5, r7, asl #6
	mov	r3, r3, asl #6
	str	r3, [sp, #372]
	ldr	r3, [sp, #532]
	sub	r5, r5, r7, asl #4
	mov	r3, r3, asl #4
	str	r3, [sp, #0]
	mov	r3, r8, asl #2
	str	r3, [sp, #192]
	ldr	r3, [sp, #508]
	ldr	r4, [sp, #64]
	rsb	fp, r3, fp
	str	fp, [sp, #504]
	ldr	fp, [sp, #248]
	ldr	r3, [sp, #0]
	rsb	lr, fp, lr
	str	lr, [sp, #244]
	ldr	lr, [sp, #420]
	ldr	fp, [sp, #340]
	add	lr, lr, r3
	str	lr, [sp, #212]
	ldr	lr, [sp, #148]
	ldr	r3, [sp, #540]
	add	fp, fp, lr
	str	fp, [sp, #144]
	ldr	lr, [sp, #536]
	add	r6, r6, r3
	ldr	fp, [sp, #128]
	ldr	r3, [sp, #68]
	add	fp, fp, lr
	add	r3, r3, r4
	ldr	lr, [sp, #376]
	ldr	r4, [sp, #488]
	str	fp, [sp, #124]
	str	r3, [sp, #60]
	ldr	fp, [sp, #372]
	ldr	r3, [sp, #492]
	rsb	fp, lr, fp
	add	r3, r3, r4
	ldr	lr, [sp, #548]
	ldr	r4, [sp, #544]
	str	fp, [sp, #368]
	str	r3, [sp, #484]
	ldr	fp, [sp, #456]
	ldr	r3, [sp, #436]
	rsb	fp, lr, fp
	add	r3, r3, r4
	str	fp, [sp, #452]
	str	r3, [sp, #432]
	ldr	fp, [sp, #332]
	ldr	r3, [sp, #540]
	ldr	lr, [sp, #320]
	mov	fp, fp, asl #2
	rsb	lr, r3, lr
	str	fp, [sp, #328]
	str	lr, [sp, #316]
	ldr	lr, [sp, #264]
	ldr	r4, [sp, #276]
	ldr	fp, [sp, #548]
	add	r4, r4, r7
	sub	fp, fp, lr, asl #4
	str	r4, [sp, #272]
	str	fp, [sp, #260]
	ldr	r3, [sp, #228]
	ldr	fp, [sp, #188]
	ldr	r4, [sp, #192]
	add	r3, r3, sl
	add	r4, r4, fp
	str	r3, [sp, #224]
	ldr	fp, [sp, #524]
	str	r4, [sp, #184]
	ldr	r3, [sp, #84]
	ldr	r4, [sp, #44]
	mov	r3, r3, asl #3
	rsb	r4, fp, r4
	str	r3, [sp, #80]
	str	r4, [sp, #40]
	ldr	r3, [sp, #200]
	ldr	r4, [sp, #528]
	ldr	lr, [sp, #104]
	sub	r3, r3, r4, asl #2
	ldr	fp, [sp, #412]
	mov	lr, lr, asl #1
	str	r3, [sp, #196]
	ldr	r3, [sp, #300]
	str	lr, [sp, #100]
	mov	lr, sl, asl #12
	str	lr, [sp, #96]
	mov	lr, fp, asl #4
	mov	fp, r3, asl #4
	ldr	r3, [sp, #28]
	rsb	r5, r7, r5
	mov	r4, r3, asl #2
	ldr	r3, [sp, #528]
	mov	r5, r5, asl #3
	mov	r3, r3, asl #7
	str	r3, [sp, #392]
	ldr	r3, [sp, #524]
	add	r5, r5, r7
	mov	r3, r3, asl #4
	str	r3, [sp, #0]
	ldr	r3, [sp, #412]
	sub	r5, r7, r5, asl #2
	rsb	lr, r3, lr
	str	lr, [sp, #408]
	ldr	lr, [sp, #300]
	ldr	r3, [sp, #376]
	rsb	fp, lr, fp
	str	fp, [sp, #296]
	ldr	fp, [sp, #0]
	mov	r5, r5, asl #1
	add	r3, r3, fp
	str	r3, [sp, #168]
	ldr	lr, [sp, #144]
	ldr	r3, [sp, #100]
	add	r6, lr, r6
	add	r0, r0, r3
	ldr	lr, [sp, #80]
	ldr	r3, [sp, #532]
	ldr	fp, [sp, #96]
	str	r6, [sp, #140]
	ldr	r6, [sp, #232]
	add	lr, lr, r3
	add	r6, r6, fp
	str	lr, [sp, #76]
	ldr	lr, [sp, #28]
	ldr	fp, [sp, #528]
	str	r6, [sp, #92]
	ldr	r6, [sp, #60]
	add	r4, lr, r4
	add	r6, r6, fp
	str	r4, [sp, #24]
	ldr	r3, [sp, #504]
	ldr	r4, [sp, #540]
	ldr	fp, [sp, #536]
	str	r6, [sp, #56]
	ldr	r6, [sp, #484]
	rsb	r3, r4, r3
	add	r6, r6, fp
	str	r3, [sp, #500]
	ldr	lr, [sp, #452]
	ldr	r3, [sp, #432]
	str	r6, [sp, #480]
	ldr	r4, [sp, #396]
	ldr	r6, [sp, #392]
	mov	lr, lr, asl #2
	mov	r3, r3, asl #2
	add	r4, r4, r6
	str	lr, [sp, #448]
	str	r3, [sp, #428]
	ldr	fp, [sp, #328]
	ldr	r3, [sp, #316]
	ldr	lr, [sp, #540]
	ldr	r6, [sp, #260]
	add	fp, fp, r9
	sub	lr, lr, r3, asl #4
	str	r4, [sp, #388]
	mov	r6, r6, asl #2
	ldr	r4, [sp, #272]
	str	fp, [sp, #324]
	str	lr, [sp, #312]
	str	r6, [sp, #256]
	ldr	lr, [sp, #544]
	ldr	fp, [sp, #244]
	ldr	r6, [sp, #532]
	sub	r7, r7, r4, asl #4
	ldr	r3, [sp, #224]
	ldr	r4, [sp, #212]
	rsb	fp, lr, fp
	rsb	r4, r6, r4
	str	fp, [sp, #240]
	mov	r3, r3, asl #2
	ldr	fp, [sp, #184]
	str	r3, [sp, #220]
	str	r4, [sp, #208]
	ldr	r3, [sp, #124]
	ldr	r4, [sp, #40]
	add	fp, fp, r8
	str	fp, [sp, #180]
	mov	lr, r3, asl #1
	mov	fp, r4, asl #3
	ldr	r3, [sp, #156]
	ldr	r4, [sp, #520]
	mov	r6, r8, asl #12
	sub	r3, r3, r4, asl #2
	str	r3, [sp, #152]
	ldr	r3, [sp, #520]
	str	r6, [sp, #0]
	mov	r3, r3, asl #7
	ldr	r6, [sp, #368]
	str	r3, [sp, #360]
	ldr	r3, [sp, #196]
	mov	r4, r6, asl #4
	mov	r6, r3, asl #4
	ldr	r3, [sp, #448]
	mov	ip, r9, asl #6
	add	r5, r5, r3
	ldr	r3, [sp, #368]
	sub	ip, ip, r9, asl #4
	rsb	r4, r3, r4
	ldr	r3, [sp, #256]
	rsb	ip, r9, ip
	add	r7, r7, r3
	ldr	r3, [sp, #196]
	mov	ip, ip, asl #3
	rsb	r6, r3, r6
	ldr	r3, [sp, #140]
	add	ip, ip, r9
	add	lr, r3, lr
	str	lr, [sp, #120]
	ldr	r3, [sp, #76]
	ldr	lr, [sp, #92]
	sub	ip, r9, ip, asl #2
	add	lr, lr, r3
	str	lr, [sp, #72]
	ldr	r3, [sp, #0]
	ldr	lr, [sp, #188]
	mov	ip, ip, asl #1
	add	lr, lr, r3
	str	lr, [sp, #48]
	ldr	lr, [sp, #524]
	mov	r0, r0, asr #12
	add	fp, fp, lr
	str	fp, [sp, #36]
	ldr	fp, [sp, #520]
	ldr	r3, [sp, #24]
	ldr	lr, [sp, #500]
	add	r3, r3, fp
	mov	lr, lr, asl #2
	str	r3, [sp, #20]
	str	lr, [sp, #496]
	ldr	r3, [sp, #480]
	ldr	lr, [sp, #544]
	ldr	fp, [sp, #428]
	mov	r3, r3, asl #2
	add	fp, fp, lr
	str	r3, [sp, #476]
	str	fp, [sp, #424]
	ldr	r3, [sp, #408]
	ldr	fp, [sp, #532]
	ldr	lr, [sp, #388]
	rsb	r3, fp, r3
	str	r3, [sp, #404]
	ldr	r3, [sp, #528]
	ldr	fp, [sp, #364]
	add	lr, lr, r3
	str	lr, [sp, #384]
	ldr	r3, [sp, #324]
	ldr	lr, [sp, #360]
	sub	r9, r9, r3, asl #4
	add	fp, fp, lr
	ldr	r3, [sp, #536]
	ldr	lr, [sp, #296]
	str	fp, [sp, #356]
	rsb	lr, r3, lr
	ldr	fp, [sp, #312]
	ldr	r3, [sp, #220]
	str	lr, [sp, #292]
	ldr	lr, [sp, #240]
	add	r3, r3, sl
	mov	fp, fp, asl #2
	str	fp, [sp, #308]
	str	r3, [sp, #216]
	mov	fp, lr, asl #2
	ldr	r3, [sp, #208]
	ldr	lr, [sp, #532]
	add	r7, r7, fp
	sub	lr, lr, r3, asl #4
	str	lr, [sp, #204]
	ldr	lr, [sp, #180]
	ldr	r3, [sp, #168]
	mov	lr, lr, asl #2
	str	lr, [sp, #176]
	ldr	lr, [sp, #524]
	mov	r1, sl, asl #6
	rsb	r3, lr, r3
	str	r3, [sp, #164]
	ldr	r3, [sp, #56]
	sub	r1, r1, sl, asl #4
	mov	lr, r3, asl #1
	ldr	r3, [sp, #152]
	rsb	r1, sl, r1
	mov	r3, r3, asl #4
	str	r3, [sp, #0]
	ldr	r3, [sp, #496]
	ldr	fp, [sp, #0]
	add	ip, ip, r3
	ldr	r3, [sp, #424]
	mov	r1, r1, asl #3
	rsb	r5, r3, r5
	ldr	r3, [sp, #308]
	add	r1, r1, sl
	add	r9, r9, r3
	ldr	r3, [sp, #152]
	sub	r1, sl, r1, asl #2
	rsb	fp, r3, fp
	ldr	r3, [sp, #72]
	str	fp, [sp, #0]
	ldr	fp, [sp, #120]
	add	lr, r3, lr
	add	r0, r0, fp, asr #12
	str	lr, [sp, #52]
	ldr	fp, [sp, #48]
	ldr	lr, [sp, #36]
	ldr	r3, [sp, #476]
	add	fp, fp, lr
	str	fp, [sp, #32]
	ldr	fp, [sp, #536]
	ldr	lr, [sp, #404]
	add	r3, r3, fp
	str	r3, [sp, #472]
	ldr	r3, [sp, #384]
	ldr	fp, [sp, #524]
	mov	lr, lr, asl #2
	mov	r3, r3, asl #2
	str	lr, [sp, #400]
	str	r3, [sp, #380]
	ldr	lr, [sp, #356]
	ldr	r3, [sp, #520]
	rsb	r4, fp, r4
	ldr	fp, [sp, #292]
	add	lr, lr, r3
	ldr	r3, [sp, #204]
	str	lr, [sp, #352]
	mov	fp, fp, asl #2
	ldr	lr, [sp, #216]
	str	fp, [sp, #288]
	mov	fp, r3, asl #2
	ldr	r3, [sp, #176]
	sub	sl, sl, lr, asl #4
	ldr	lr, [sp, #528]
	add	r3, r3, r8
	rsb	r6, lr, r6
	str	r3, [sp, #172]
	ldr	lr, [sp, #524]
	ldr	r3, [sp, #164]
	mov	r1, r1, asl #1
	sub	lr, lr, r3, asl #4
	str	lr, [sp, #160]
	ldr	r3, [sp, #20]
	rsb	r2, r8, r2
	mov	lr, r3, asl #1
	ldr	r3, [sp, #472]
	mov	r2, r2, asl #3
	rsb	ip, r3, ip
	ldr	r3, [sp, #400]
	add	r2, r2, r8
	add	r1, r1, r3
	ldr	r3, [sp, #288]
	add	sl, sl, fp
	add	r9, r9, r3
	ldr	r3, [sp, #32]
	ldr	fp, [sp, #52]
	add	lr, r3, lr
	str	lr, [sp, #16]
	ldr	r3, [sp, #528]
	ldr	lr, [sp, #380]
	sub	r2, r8, r2, asl #2
	add	r0, r0, fp, asr #12
	mov	r2, r2, asl #1
	add	fp, lr, r3
	ldr	lr, [sp, #352]
	str	r2, [sp, #4]
	ldr	r3, [sp, #160]
	ldr	r2, [sp, #172]
	mov	lr, lr, asl #2
	str	lr, [sp, #348]
	sub	r8, r8, r2, asl #4
	mov	lr, r3, asl #2
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #520]
	rsb	r1, fp, r1
	ldr	fp, [sp, #4]
	rsb	r2, r3, r2
	mov	r4, r4, asl #2
	str	r2, [sp, #0]
	mov	r6, r6, asl #2
	add	r2, fp, r4
	add	r8, r8, lr
	ldr	r4, [sp, #348]
	ldr	lr, [sp, #16]
	add	sl, sl, r6
	mov	r5, r5, asr #12
	ldr	r6, [sp, #0]
	add	r0, r0, lr, asr #12
	add	r5, r5, ip, asr #12
	add	ip, r4, r3
	rsb	r2, ip, r2
	mov	r3, r6, asl #2
	add	r5, r5, r1, asr #12
	mov	r0, r0, asr #2
	add	r8, r8, r3
	add	r5, r5, r2, asr #12
	bl	__aeabi_i2f
	mov	r1, #973078528
	bl	__aeabi_fmul
	ldr	r1, .L10+4
	bl	__aeabi_fadd
	mov	r7, r7, asr #12
	ldr	lr, [sp, #12]
	ldr	fp, [sp, #584]
	add	r7, r7, r9, asr #12
	ldr	r4, [lr, fp]
	ldr	r2, [sp, #588]
	ldr	r1, [sp, #564]
	add	r7, r7, sl, asr #12
	add	r7, r7, r8, asr #12
	str	r0, [r4, r2]!	@ float
	add	r1, r1, #1
	mov	r0, r7, asr #2
	str	r1, [sp, #564]
	bl	__aeabi_i2f
	mov	r1, #973078528
	bl	__aeabi_fmul
	mov	r1, #1124073472
	bl	__aeabi_fadd
	str	r0, [r4, #4]	@ float
	mov	r0, r5, asr #2
	bl	__aeabi_i2f
	mov	r1, #973078528
	bl	__aeabi_fmul
	mov	r1, #1124073472
	bl	__aeabi_fadd
	ldr	r3, [sp, #572]
	ldr	r6, [sp, #564]
	str	r0, [r4, #8]	@ float
	ldr	fp, [sp, #588]
	cmp	r3, r6
	add	fp, fp, #12
	str	fp, [sp, #588]
	bhi	.L4
.L3:
	ldr	r1, [sp, #560]
	ldr	r2, [sp, #568]
	add	r1, r1, #1
	cmp	r2, r1
	str	r1, [sp, #560]
	bhi	.L5
.L6:
	add	sp, sp, #596
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L11:
	.align	2
.L10:
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
	sub	sp, sp, #44
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r2, [r0, #4]
	str	r0, [sp, #12]
	cmp	r2, #0
	mov	fp, r1
	ble	.L17
	mov	r1, #0
	ldr	r3, [r0, #0]
	str	r1, [sp, #28]
	mov	r8, #4
.L14:
	cmp	r3, #0
	ble	.L16
	ldr	r3, [sp, #28]
	ldr	r1, [sp, #28]
	mov	r2, #0
	mov	r3, r3, asl #2
	str	r2, [sp, #32]
	str	r3, [sp, #36]
	mov	r7, r1, asl #3
	mov	r9, r2
.L15:
	ldr	r2, [sp, #12]
	ldr	r1, [sp, #36]
	ldr	r3, [r2, #12]
	mov	r2, r9, asl #1
	ldr	r4, [r3, r1]
	ldr	r1, .L19
	ldr	r0, [r4, r9, asl #1]	@ float
	add	r4, r4, r2
	bl	__aeabi_fsub
	bl	__aeabi_f2d
	ldr	r2, .L19+4
	ldr	r3, .L19+8
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
	ldr	r2, .L19+12
	str	r0, [sp, #16]
	str	r1, [sp, #20]
	ldr	r3, .L19+16
	mov	r0, r5
	mov	r1, r6
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldmia	sp, {r0-r1}
	bl	__aeabi_dadd
	bl	__aeabi_d2f
	ldr	r1, .L19+20
	bl	__aeabi_fmul
	bl	__aeabi_f2uiz
	ldr	r2, .L19+24
	mov	sl, r0
	ldr	r3, .L19+28
	mov	r0, r5
	mov	r1, r6
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldmia	sp, {r0-r1}
	bl	__aeabi_dadd
	ldr	r2, .L19+32
	mov	r4, r0
	mov	r5, r1
	ldr	r3, .L19+36
	add	r1, sp, #16
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	bl	__aeabi_d2f
	ldr	r1, .L19+20
	bl	__aeabi_fmul
	bl	__aeabi_f2uiz
	ldr	r2, .L19+40
	mov	r4, r0
	ldr	r3, .L19+44
	add	r1, sp, #16
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldmia	sp, {r0-r1}
	bl	__aeabi_dadd
	bl	__aeabi_d2f
	ldr	r1, .L19+20
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
	bgt	.L15
	ldr	r2, [r1, #4]
.L16:
	ldr	r1, [sp, #28]
	add	r8, r8, #8
	add	r1, r1, #1
	cmp	r2, r1
	str	r1, [sp, #28]
	bgt	.L14
.L17:
	add	sp, sp, #44
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L20:
	.align	2
.L19:
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
	stmfd	sp!, {r4, r5, r6, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, [r0, #4]
	mov	r5, r0
	cmp	r3, #0
	ble	.L22
	mov	r4, #0
.L23:
	ldr	r3, [r5, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r5, #4]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L23
.L22:
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
	stmfd	sp!, {r4, r5, r6, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, [r0, #4]
	mov	r5, r0
	cmp	r3, #0
	ble	.L27
	mov	r4, #0
.L28:
	ldr	r3, [r5, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r5, #4]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L28
.L27:
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
	stmfd	sp!, {r4, r5, r6, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, [r0, #4]
	mov	r5, r0
	cmp	r3, #0
	ble	.L32
	mov	r4, #0
.L33:
	ldr	r3, [r5, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r5, #4]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L33
.L32:
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
	push	{lr}
	bl	__gnu_mcount_nc
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
	push	{lr}
	bl	__gnu_mcount_nc
	bl	malloc
	cmp	r0, #0
	ldmnefd	sp!, {r4, pc}
	ldr	r0, .L41
	bl	puts
	mvn	r0, #0
	bl	exit
.L42:
	.align	2
.L41:
	.word	.LC0
	.size	mmalloc, .-mmalloc
	.align	2
	.global	write_to_bmp
	.type	write_to_bmp, %function
write_to_bmp:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	sub	sp, sp, #8
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r4, r0
	mov	r8, r1
	ldr	r0, .L53
	ldr	r1, .L53+4
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
	ble	.L50
.L45:
	ldr	r3, [r8, #0]
	cmp	r3, #0
	movgt	r6, #0
	movgt	r5, r9, asl #2
	movgt	r4, r6
	ble	.L49
.L46:
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
	blt	.L46
.L49:
	ldrsb	r3, [r8, #10]
	cmp	r3, #0
	ble	.L47
	mov	r4, #0
.L48:
	mov	r1, #1
	mov	r3, r7
	mov	r0, sl
	mov	r2, r1
	bl	fwrite
	ldrsb	r3, [r8, #10]
	add	r4, r4, #1
	cmp	r4, r3
	blt	.L48
.L47:
	ldr	r3, [r8, #4]
	add	r9, r9, #1
	cmp	r9, r3
	blt	.L45
.L50:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L54:
	.align	2
.L53:
	.word	.LC1
	.word	.LC2
	.size	write_to_bmp, .-write_to_bmp
	.align	2
	.global	get_bmp_info
	.type	get_bmp_info, %function
get_bmp_info:
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #96
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r1, .L62
	mov	r4, r0
	bl	fopen
	subs	r6, r0, #0
	beq	.L61
	mov	r0, #60
	bl	malloc
	subs	r5, r0, #0
	beq	.L60
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
	beq	.L60
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
.L60:
	ldr	r0, .L62+4
	bl	puts
	mvn	r0, #0
	bl	exit
.L61:
	mov	r1, r4
	ldr	r0, .L62+8
	bl	printf
	mov	r0, r6
	bl	fclose
	mvn	r0, #0
	bl	exit
.L63:
	.align	2
.L62:
	.word	.LC3
	.word	.LC0
	.word	.LC4
	.size	get_bmp_info, .-get_bmp_info
	.align	2
	.global	allocate_ycc_array
	.type	allocate_ycc_array, %function
allocate_ycc_array:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r4, r0
	mov	r0, #16
	bl	malloc
	subs	r5, r0, #0
	beq	.L73
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
	beq	.L73
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ble	.L67
	mov	r4, #0
.L69:
	ldr	r3, [r5, #0]
	mov	r0, r3, asl #4
	sub	r0, r0, r3, asl #2
	bl	malloc
	cmp	r0, #0
	beq	.L73
	ldr	r3, [r5, #4]
	str	r0, [r6, r4, asl #2]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L69
.L67:
	str	r6, [r5, #12]
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, pc}
.L73:
	ldr	r0, .L74
	bl	puts
	mvn	r0, #0
	bl	exit
.L75:
	.align	2
.L74:
	.word	.LC0
	.size	allocate_ycc_array, .-allocate_ycc_array
	.global	__aeabi_ui2f
	.align	2
	.type	get_rgb_pixel_array, %function
get_rgb_pixel_array:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	push	{lr}
	bl	__gnu_mcount_nc
	mov	fp, r1
	ldr	r1, [r1, #4]
	mov	r6, r0
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
	mov	r0, r1, asl #2
	strne	r2, [sp, #8]
	str	r3, [sp, #16]
	bl	malloc
	cmp	r0, #0
	str	r0, [sp, #24]
	beq	.L103
	mov	r0, #12
	bl	malloc
	subs	r7, r0, #0
	beq	.L103
	ldr	r3, [fp, #4]
	cmp	r3, #0
	ble	.L83
	ldr	r1, [sp, #8]
	mov	r2, r4, asl #24
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	mov	r2, r2, asr #24
	str	r3, [sp, #28]
	str	r2, [sp, #4]
	mov	r9, #0
.L88:
	ldr	r0, [sp, #28]
	bl	malloc
	subs	sl, r0, #0
	beq	.L103
	ldr	r8, [fp, #0]
	ldr	r2, [sp, #24]
	cmp	r8, #0
	str	sl, [r2, r9, asl #2]
	ble	.L85
	mov	r5, #0
	mov	r4, r5
.L86:
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
	bgt	.L86
.L85:
	ldr	r3, [sp, #4]
	add	r9, r9, #1
	cmp	r3, #0
	addgt	r6, r6, r3
	ldr	r3, [fp, #4]
	cmp	r3, r9
	bgt	.L88
.L83:
	ldr	r1, [sp, #20]
	cmp	r1, #0
	beq	.L89
	ldr	r8, [fp, #0]
	cmp	r8, #0
	ble	.L90
	ldr	r2, [sp, #12]
	ldr	r1, [sp, #24]
	mov	r3, r2, asl #2
	sub	r3, r3, #4
	sub	r2, r2, #2
	mov	r4, #0
	ldr	r6, [r1, r3]
	ldr	r5, [r1, r2, asl #2]
	mov	lr, r4
.L91:
	add	r4, r4, #1
	add	ip, r6, lr
	add	r3, r5, lr
	cmp	r8, r4
	ldmia	r3, {r0, r1, r2}
	add	lr, lr, #12
	stmia	ip, {r0, r1, r2}
	bgt	.L91
.L90:
	ldr	r2, [sp, #12]
	str	r2, [fp, #4]
.L89:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L92
	ldr	r1, [sp, #12]
	cmp	r1, #0
	ble	.L93
	ldr	r2, [sp, #8]
	mov	lr, #0
	mov	r3, r2, asl #4
	sub	r3, r3, r2, asl #2
	sub	r5, r3, #24
	sub	r4, r3, #12
.L94:
	ldr	r3, [sp, #24]
	ldr	r1, [sp, #12]
	ldr	ip, [r3, lr, asl #2]
	add	lr, lr, #1
	add	r3, ip, r5
	cmp	r1, lr
	add	ip, ip, r4
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	bgt	.L94
.L93:
	ldr	r3, [sp, #8]
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #30
	add	r3, r3, r2
	and	r3, r3, #3
	rsb	r3, r2, r3
	strb	r3, [fp, #10]
	ldr	r1, [sp, #8]
	str	r1, [fp, #0]
.L92:
	ldr	r2, [sp, #24]
	mov	r0, r7
	str	r2, [fp, #12]
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	free
.L103:
	ldr	r0, .L104
	bl	puts
	mvn	r0, #0
	bl	exit
.L105:
	.align	2
.L104:
	.word	.LC0
	.size	get_rgb_pixel_array, .-get_rgb_pixel_array
	.align	2
	.global	get_pixel_array
	.type	get_pixel_array, %function
get_pixel_array:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r5, r0
	mov	r0, #16
	bl	malloc
	subs	r4, r0, #0
	beq	.L109
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
.L109:
	ldr	r0, .L110
	bl	puts
	mvn	r0, #0
	bl	exit
.L111:
	.align	2
.L110:
	.word	.LC0
	.size	get_pixel_array, .-get_pixel_array
	.align	2
	.global	allocate_rgb_array
	.type	allocate_rgb_array, %function
allocate_rgb_array:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r6, r0
	mov	r0, #16
	mov	r4, r1
	mov	r5, r2
	bl	malloc
	subs	r8, r0, #0
	beq	.L121
	strb	r5, [r8, #10]
	stmia	r8, {r4, r6}	@ phole stm
	mov	r0, r6, asl #2
	bl	malloc
	subs	r7, r0, #0
	beq	.L121
	cmp	r6, #0
	ble	.L115
	mov	r3, r4, asl #1
	add	r5, r3, r4
	mov	r4, #0
.L117:
	mov	r0, r5
	bl	malloc
	cmp	r0, #0
	beq	.L121
	str	r0, [r7, r4, asl #2]
	add	r4, r4, #1
	cmp	r6, r4
	bgt	.L117
.L115:
	str	r7, [r8, #12]
	mov	r0, r8
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L121:
	ldr	r0, .L122
	bl	puts
	mvn	r0, #0
	bl	exit
.L123:
	.align	2
.L122:
	.word	.LC0
	.size	allocate_rgb_array, .-allocate_rgb_array
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	cmp	r0, #2
	bne	.L139
	ldr	r0, [r1, #4]
	bl	get_bmp_info
	mov	r8, r0
	mov	r0, #16
	bl	malloc
	subs	r5, r0, #0
	beq	.L140
	ldr	r2, [r8, #20]
	mov	r1, r5
	str	r2, [r5, #0]
	ldr	r3, [r8, #20]
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #30
	add	r3, r3, r2
	and	r3, r3, #3
	rsb	r3, r2, r3
	strb	r3, [r5, #10]
	ldrh	r3, [r8, #30]
	ldr	r2, [r8, #24]
	strh	r3, [r5, #8]	@ movhi
	str	r2, [r5, #4]
	ldr	r0, [r8, #56]
	bl	get_rgb_pixel_array
	ldrsh	r3, [r5, #8]
	cmp	r3, #24
	beq	.L141
	ldr	r0, .L142
	bl	puts
.L132:
	ldr	r0, [r8, #56]
	bl	free
	mov	r0, r8
	bl	free
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ble	.L133
	mov	r4, #0
.L134:
	ldr	r3, [r5, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r5, #4]
	add	r4, r4, #1
	cmp	r4, r3
	blt	.L134
.L133:
	ldr	r0, [r5, #12]
	bl	free
	mov	r0, r5
	bl	free
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L141:
	mov	r0, r5
	bl	allocate_ycc_array
	mov	r1, r5
	mov	r6, r0
	bl	convert_rgb_to_ycc
	ldrsb	r2, [r5, #10]
	ldr	r1, [r5, #0]
	ldr	r0, [r5, #4]
	bl	allocate_rgb_array
	mov	r7, r0
	mov	r1, r7
	mov	r0, r6
	bl	convert_ycc_to_rgb
	ldr	r3, [r6, #4]
	cmp	r3, #0
	ble	.L128
	mov	r4, #0
.L129:
	ldr	r3, [r6, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r6, #4]
	add	r4, r4, #1
	cmp	r4, r3
	blt	.L129
.L128:
	ldr	r0, [r6, #12]
	bl	free
	mov	r0, r6
	bl	free
	ldr	r3, [r7, #4]
	cmp	r3, #0
	ble	.L130
	mov	r4, #0
.L131:
	ldr	r3, [r7, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r7, #4]
	add	r4, r4, #1
	cmp	r4, r3
	blt	.L131
.L130:
	ldr	r0, [r7, #12]
	bl	free
	mov	r0, r7
	bl	free
	b	.L132
.L140:
	ldr	r0, .L142+4
	bl	puts
	mvn	r0, #0
	bl	exit
.L139:
	ldr	r0, .L142+8
	bl	puts
	mvn	r0, #0
	bl	exit
.L143:
	.align	2
.L142:
	.word	.LC6
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
