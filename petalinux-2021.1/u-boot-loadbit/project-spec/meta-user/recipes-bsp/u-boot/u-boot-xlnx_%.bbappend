FILESEXTRAPATHS_prepend := "${THISDIR}/files:${THISDIR}/../../../hw-description:"

SRC_URI_append += " \
		file://fpga_post_config.patch \
		file://platform-top.h \
		file://ps7_init_gpl.h \
		file://ps7_init_gpl.c \
		file://bsp.cfg"

do_configure_append () {
	install ${WORKDIR}/platform-top.h ${S}/include/configs/
	mkdir -p ${S}/board/xilinx/zynq/custom_hw_platform
	install ${WORKDIR}/ps7_init_gpl.c ${S}/board/xilinx/zynq/custom_hw_platform/
	install ${WORKDIR}/ps7_init_gpl.h ${S}/board/xilinx/zynq/
}

do_configure_append_microblaze () {
	if [ "${U_BOOT_AUTO_CONFIG}" = "1" ]; then
		install -d ${B}/source/board/xilinx/microblaze-generic/
		install ${WORKDIR}/config.mk ${B}/source/board/xilinx/microblaze-generic/
	fi
}
SRC_URI += "file://user_2024-10-17-10-00-00.cfg"
