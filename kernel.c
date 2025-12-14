// CrimsonOS – kernel.c: Where the real action happens
void kmain(void)
{
    // Point to the UART (serial output) on QEMU's virtual machine
    volatile unsigned char *uart = (volatile unsigned char *)0x09000000;

    // The epic boot message—big ASCII art + hello
    const char *msg = "\r\n\r\n"
                      "  ██████╗██████╗ ██╗███╗   ███╗███████╗ ██████╗ ███╗   ██╗ ██████╗ ███████╗\r\n"
                      " ██╔════╝██╔══██╗██║████╗ ████║██╔════╝██╔═══██╗████╗  ██║██╔═══██╗██╔════╝\r\n"
                      " ██║     ██████╔╝██║██╔████╔██║███████╗██║   ██║██╔██╗ ██║██║   ██║███████╗\r\n"
                      " ██║     ██╔══██╗██║██║╚██╔╝██║╚════██║██║   ██║██║╚██╗██║██║   ██║╚════██║\r\n"
                      " ╚██████╗██║  ██║██║██║ ╚═╝ ██║███████║╚██████╔╝██║ ╚████║╚██████╔╝███████║\r\n"
                      "  ╚═════╝╚═╝  ╚═╝╚═╝╚═╝     ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝\r\n"
                      "\r\n                     Hello from CrimsonOS – my own ARM64 kernel!\r\n\r\n"
                      "                     Booted on: QEMU virt (next: real Raspberry Pi 5)\r\n\r\n";

    // Send each character to the screen one by one
    for (int i = 0; msg[i] != '\0'; i++) {
        uart[0] = msg[i];  // Magic: This prints it!
    }

    // Hang here so the kernel doesn't quit
    while (1) { }
}