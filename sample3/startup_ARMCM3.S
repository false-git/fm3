/* File: startup_ARMCM3.S
 * Purpose: startup file for Cortex-M3 devices. Should use with
 *   GCC for ARM Embedded Processors
 * Version: V2.0
 * Date: 16 August 2013
 *
/* Copyright (c) 2011 - 2013 ARM LIMITED

   All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:
   - Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   - Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   - Neither the name of ARM nor the names of its contributors may be used
     to endorse or promote products derived from this software without
     specific prior written permission.
   *
   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.
   ---------------------------------------------------------------------------*/
	.syntax	unified
	.arch	armv7-m

	.section .stack
	.align	3
#ifdef __STACK_SIZE
	.equ	Stack_Size, __STACK_SIZE
#else
	.equ	Stack_Size, 0xc00
#endif
	.globl	__StackTop
	.globl	__StackLimit
__StackLimit:
	.space	Stack_Size
	.size	__StackLimit, . - __StackLimit
__StackTop:
	.size	__StackTop, . - __StackTop

	.section .heap
	.align	3
#ifdef __HEAP_SIZE
	.equ	Heap_Size, __HEAP_SIZE
#else
	.equ	Heap_Size, 0
#endif
	.globl	__HeapBase
	.globl	__HeapLimit
__HeapBase:
	.if	Heap_Size
	.space	Heap_Size
	.endif
	.size	__HeapBase, . - __HeapBase
__HeapLimit:
	.size	__HeapLimit, . - __HeapLimit

	.section .isr_vector
	.align	2
	.globl	__isr_vector
__isr_vector:
	.long	__StackTop            /* Top of Stack */
	.long	Reset_Handler         /* Reset Handler */
	.long	NMI_Handler           /* NMI Handler */
	.long	HardFault_Handler     /* Hard Fault Handler */
	.long	MemManage_Handler     /* MPU Fault Handler */
	.long	BusFault_Handler      /* Bus Fault Handler */
	.long	UsageFault_Handler    /* Usage Fault Handler */
	.long	0                     /* Reserved */
	.long	0                     /* Reserved */
	.long	0                     /* Reserved */
	.long	0                     /* Reserved */
	.long	SVC_Handler           /* SVCall Handler */
	.long	DebugMon_Handler      /* Debug Monitor Handler */
	.long	0                     /* Reserved */
	.long	PendSV_Handler        /* PendSV Handler */
	.long	SysTick_Handler       /* SysTick Handler */

        .long   CSV_Handler           /* 0: Clock Super Visor */
        .long   SWDT_Handler          /* 1: Software Watchdog Timer */
        .long   LVD_Handler           /* 2: Low Voltage Detector */
        .long   MFT_WG_IRQHandler     /* 3: Wave Form Generator / DTIF */
        .long   INT0_7_Handler        /* 4: External Interrupt Request ch.0 to ch.7 */
        .long   INT8_31_Handler       /* 5: External Interrupt Request ch.8 to ch.31 */
        .long   DT_Handler            /* 6: Dual Timer / Quad Decoder */
        .long   MFS0RX_IRQHandler     /* 7: MultiFunction Serial ch.0 */
        .long   MFS0TX_IRQHandler     /* 8: MultiFunction Serial ch.0 */
        .long   MFS1RX_IRQHandler     /* 9: MultiFunction Serial ch.1 */
        .long   MFS1TX_IRQHandler     /* 10: MultiFunction Serial ch.1 */
        .long   MFS2RX_IRQHandler     /* 11: MultiFunction Serial ch.2 */
        .long   MFS2TX_IRQHandler     /* 12: MultiFunction Serial ch.2 */
        .long   MFS3RX_IRQHandler     /* 13: MultiFunction Serial ch.3 */
        .long   MFS3TX_IRQHandler     /* 14: MultiFunction Serial ch.3 */
        .long   MFS4RX_IRQHandler     /* 15: MultiFunction Serial ch.4 */
        .long   MFS4TX_IRQHandler     /* 16: MultiFunction Serial ch.4 */
        .long   MFS5RX_IRQHandler     /* 17: MultiFunction Serial ch.5 */
        .long   MFS5TX_IRQHandler     /* 18: MultiFunction Serial ch.5 */
        .long   MFS6RX_IRQHandler     /* 19: MultiFunction Serial ch.6 */
        .long   MFS6TX_IRQHandler     /* 20: MultiFunction Serial ch.6 */
        .long   MFS7RX_IRQHandler     /* 21: MultiFunction Serial ch.7 */
        .long   MFS7TX_IRQHandler     /* 22: MultiFunction Serial ch.7 */
        .long   PPG_Handler           /* 23: PPG */
        .long   TIM_IRQHandler        /* 24: OSC / PLL / Watch Counter */
        .long   ADC0_IRQHandler       /* 25: ADC0 */
        .long   ADC1_IRQHandler       /* 26: ADC1 */
        .long   ADC2_IRQHandler       /* 27: ADC2 */
        .long   MFT_FRT_IRQHandler    /* 28: Free-run Timer */
        .long   MFT_IPC_IRQHandler    /* 29: Input Capture */
        .long   MFT_OPC_IRQHandler    /* 30: Output Compare */
        .long   BT0_7_IRQHandler      /* 31: Base Timer ch.0 to ch.7 */
        .long   ETHER_MAC0_IRQHandler /* 32: Ethernet MAC ch.0 */
        .long   ETHER_MAC1_IRQHandler /* 33: Ethernet MAC ch.1 */
        .long   USB0F_Handler         /* 34: USB0 Function */
        .long   USB0_Handler          /* 35: USB0 Function / USB0 HOST */
        .long   USB1F_Handler         /* 36: USB1 Function */
        .long   USB1_Handler          /* 37: USB1 Function / USB1 HOST */
        .long   DMAC0_Handler         /* 38: DMAC ch.0 */
        .long   DMAC1_Handler         /* 39: DMAC ch.1 */
        .long   DMAC2_Handler         /* 40: DMAC ch.2 */
        .long   DMAC3_Handler         /* 41: DMAC ch.3 */
        .long   DMAC4_Handler         /* 42: DMAC ch.4 */
        .long   DMAC5_Handler         /* 43: DMAC ch.5 */
        .long   DMAC6_Handler         /* 44: DMAC ch.6 */
        .long   DMAC7_Handler         /* 45: DMAC ch.7 */
        .long   BT8_15_IRQHandler     /* 46: Base Timer ch.8 to ch.15 */
	/* External interrupts */
	.long	Default_Handler

	.size	__isr_vector, . - __isr_vector

	.text
	.thumb
	.thumb_func
	.align	2
	.globl	Reset_Handler
	.type	Reset_Handler, %function
Reset_Handler:
/*  Firstly it copies data from read only memory to RAM. There are two schemes
 *  to copy. One can copy more than one sections. Another can only copy
 *  one section.  The former scheme needs more instructions and read-only
 *  data to implement than the latter.
 *  Macro __STARTUP_COPY_MULTIPLE is used to choose between two schemes.  */

#ifdef __STARTUP_COPY_MULTIPLE
/*  Multiple sections scheme.
 *
 *  Between symbol address __copy_table_start__ and __copy_table_end__,
 *  there are array of triplets, each of which specify:
 *    offset 0: LMA of start of a section to copy from
 *    offset 4: VMA of start of a section to copy to
 *    offset 8: size of the section to copy. Must be multiply of 4
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
	ldr	r4, =__copy_table_start__
	ldr	r5, =__copy_table_end__

.L_loop0:
	cmp	r4, r5
	bge	.L_loop0_done
	ldr	r1, [r4]
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #8]

.L_loop0_0:
	subs	r3, #4
	ittt	ge
	ldrge	r0, [r1, r3]
	strge	r0, [r2, r3]
	bge	.L_loop0_0

	adds	r4, #12
	b	.L_loop0

.L_loop0_done:
#else
/*  Single section scheme.
 *
 *  The ranges of copy from/to are specified by following symbols
 *    __etext: LMA of start of the section to copy from. Usually end of text
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
	ldr	r1, =__etext
	ldr	r2, =__data_start__
	ldr	r3, =__data_end__

.L_loop1:
	cmp	r2, r3
	ittt	lt
	ldrlt	r0, [r1], #4
	strlt	r0, [r2], #4
	blt	.L_loop1
#endif /*__STARTUP_COPY_MULTIPLE */

/*  This part of work usually is done in C library startup code. Otherwise,
 *  define this macro to enable it in this startup.
 *
 *  There are two schemes too. One can clear multiple BSS sections. Another
 *  can only clear one section. The former is more size expensive than the
 *  latter.
 *
 *  Define macro __STARTUP_CLEAR_BSS_MULTIPLE to choose the former.
 *  Otherwise efine macro __STARTUP_CLEAR_BSS to choose the later.
 */
#ifdef __STARTUP_CLEAR_BSS_MULTIPLE
/*  Multiple sections scheme.
 *
 *  Between symbol address __copy_table_start__ and __copy_table_end__,
 *  there are array of tuples specifying:
 *    offset 0: Start of a BSS section
 *    offset 4: Size of this BSS section. Must be multiply of 4
 */
	ldr	r3, =__zero_table_start__
	ldr	r4, =__zero_table_end__

.L_loop2:
	cmp	r3, r4
	bge	.L_loop2_done
	ldr	r1, [r3]
	ldr	r2, [r3, #4]
	movs	r0, 0

.L_loop2_0:
	subs	r2, #4
	itt	ge
	strge	r0, [r1, r2]
	bge	.L_loop2_0

	adds	r3, #8
	b	.L_loop2
.L_loop2_done:
#elif defined (__STARTUP_CLEAR_BSS)
/*  Single BSS section scheme.
 *
 *  The BSS section is specified by following symbols
 *    __bss_start__: start of the BSS section.
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
	ldr	r1, =__bss_start__
	ldr	r2, =__bss_end__

	movs	r0, 0
.L_loop3:
	cmp	r1, r2
	itt	lt
	strlt	r0, [r1], #4
	blt	.L_loop3
#endif /* __STARTUP_CLEAR_BSS_MULTIPLE || __STARTUP_CLEAR_BSS */

#ifndef __NO_SYSTEM_INIT
	bl	SystemInit
#endif

#ifndef __START
#define __START _start
#endif
	bl	__START

	.pool
	.size	Reset_Handler, . - Reset_Handler

	.align	1
	.thumb_func
	.weak	Default_Handler
	.type	Default_Handler, %function
Default_Handler:
	b	.
	.size	Default_Handler, . - Default_Handler

/*    Macro to define default handlers. Default handler
 *    will be weak symbol and just dead loops. They can be
 *    overwritten by other handlers */
	.macro	def_irq_handler	handler_name
	.weak	\handler_name
	.set	\handler_name, Default_Handler
	.endm

	def_irq_handler	NMI_Handler
	def_irq_handler	HardFault_Handler
	def_irq_handler	MemManage_Handler
	def_irq_handler	BusFault_Handler
	def_irq_handler	UsageFault_Handler
	def_irq_handler	SVC_Handler
	def_irq_handler	DebugMon_Handler
	def_irq_handler	PendSV_Handler
	def_irq_handler	SysTick_Handler
	def_irq_handler	DEF_IRQHandler

        def_irq_handler CSV_Handler
        def_irq_handler SWDT_Handler
        def_irq_handler LVD_Handler
        def_irq_handler MFT_WG_IRQHandler
        def_irq_handler INT0_7_Handler
        def_irq_handler INT8_31_Handler
        def_irq_handler DT_Handler
        def_irq_handler MFS0RX_IRQHandler
        def_irq_handler MFS0TX_IRQHandler
        def_irq_handler MFS1RX_IRQHandler
        def_irq_handler MFS1TX_IRQHandler
        def_irq_handler MFS2RX_IRQHandler
        def_irq_handler MFS2TX_IRQHandler
        def_irq_handler MFS3RX_IRQHandler
        def_irq_handler MFS3TX_IRQHandler
        def_irq_handler MFS4RX_IRQHandler
        def_irq_handler MFS4TX_IRQHandler
        def_irq_handler MFS5RX_IRQHandler
        def_irq_handler MFS5TX_IRQHandler
        def_irq_handler MFS6RX_IRQHandler
        def_irq_handler MFS6TX_IRQHandler
        def_irq_handler MFS7RX_IRQHandler
        def_irq_handler MFS7TX_IRQHandler
        def_irq_handler PPG_Handler
        def_irq_handler TIM_IRQHandler
        def_irq_handler ADC0_IRQHandler
        def_irq_handler ADC1_IRQHandler
        def_irq_handler ADC2_IRQHandler
        def_irq_handler MFT_FRT_IRQHandler
        def_irq_handler MFT_IPC_IRQHandler
        def_irq_handler MFT_OPC_IRQHandler
        def_irq_handler BT0_7_IRQHandler
        def_irq_handler ETHER_MAC0_IRQHandler
        def_irq_handler ETHER_MAC1_IRQHandler
        def_irq_handler USB0F_Handler
        def_irq_handler USB0_Handler
        def_irq_handler USB1F_Handler
        def_irq_handler USB1_Handler
        def_irq_handler DMAC0_Handler
        def_irq_handler DMAC1_Handler
        def_irq_handler DMAC2_Handler
        def_irq_handler DMAC3_Handler
        def_irq_handler DMAC4_Handler
        def_irq_handler DMAC5_Handler
        def_irq_handler DMAC6_Handler
        def_irq_handler DMAC7_Handler
        def_irq_handler BT8_15_IRQHandler

	.end
