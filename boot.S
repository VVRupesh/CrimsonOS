.section ".text._start"

.global _start

_start:
    bl kmain    // Jump to C kernel main
    b .         // Infinite loop if returns