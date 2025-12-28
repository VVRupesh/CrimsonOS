S
.macro ventry label
.align 7
b \label
.endm

.align 11  // Table must be 2KB aligned
.global vectors
vectors:
    ventry sync_invalid_el1
    ventry irq_invalid_el1
    ventry fiq_invalid_el1
    ventry serror_invalid_el1

    ventry sync_invalid_el0_64
    ventry irq_invalid_el0_64
    ventry fiq_invalid_el0_64
    ventry serror_invalid_el0_64

    ventry sync_invalid_el0_32
    ventry irq_invalid_el0_32
    ventry fiq_invalid_el0_32
    ventry serror_invalid_el0_32

    ventry sync_invalid_el1
    ventry irq_invalid_el1
    ventry fiq_invalid_el1
    ventry serror_invalid_el1

.global invalid_handler
invalid_handler:
    b .  // Infinite loop (replace later with print/dump)
sync_invalid_el1: b invalid_handler
irq_invalid_el1:  b invalid_handler
// Repeat for all labels above