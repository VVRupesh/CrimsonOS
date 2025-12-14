# CrimsonOS 🚀

From-scratch ARM64 (AArch64) kernel built by a first-year EE student.  
**Goal:** Boot on QEMU + real Raspberry Pi 5, then add MMU, drivers, multitasking.

## Quick Boot
1. Install ARM toolchain: https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
2. Edit `Makefile` TOOLCHAIN path.
3. `make run` → See the banner!

## Progress
See [PROGRESS.md](PROGRESS.md) for daily updates.

![Boot Screenshot](screenshots/boot.png)  *(Add your screenshot here later)*

**Tech:** C + Assembly • QEMU virt • Bare-metal • EL1 entry  
**Next:** Colored UART, exception vectors, physical memory manager.

Built with ❤️ for processor arch & driver dev (NVIDIA/Qualcomm dreams).