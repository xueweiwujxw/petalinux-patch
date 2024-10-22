#include <configs/zynq-common.h> // from https://github.com/Xilinx/u-boot-xlnx/blob/xlnx_rebase_v2021.01_2021.1/include/configs/zynq-common.h

#ifdef CONFIG_EXTRA_ENV_SETTINGS
#undef CONFIG_EXTRA_ENV_SETTINGS
#define CONFIG_EXTRA_ENV_SETTINGS                                                         \
    "scriptaddr=0x20000\0"                                                                \
    "script_size_f=0x40000\0"                                                             \
    "fdt_addr_r=0x1f00000\0"                                                              \
    "pxefile_addr_r=0x2000000\0"                                                          \
    "kernel_addr_r=0x2000000\0"                                                           \
    "scriptaddr=0x3000000\0"                                                              \
    "ramdisk_addr_r=0x3100000\0"                                                          \
    "bitload=fatload mmc 1:1 0x8000000 system.bit.bin; fpga load 0 0x8000000 $filesize\0" \
    "bootcmd=run bitload; postconfig; run distro_bootcmd\0" BOOTENV
#endif
