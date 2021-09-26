#!/bin/bash -euv

export VITIS_DIR='/usr/tools/xilinx/Vitis/2020.2'
export XRT_DIR='/usr/tools/xilinx/xrt/2020.2'

source $VITIS_DIR/settings64.sh
source $XRT_DIR/setup.sh
unset LD_LIBRARY_PATH
source $XILINX_VITIS/data/emulation/qemu/unified_qemu_v5_0/environment-setup-aarch64-xilinx-linux

export PLATFORM_REPO_PATHS=/usr/tools/xilinx/platforms/xilinx_zcu102_base_202020_1

rm -rf work *.log _x sd_card *bin *BIN *.dat
mkdir work

v++ -c -O3 src/vadd.c -t hw --kernel vadd -f $PLATFORM_REPO_PATHS/xilinx_zcu102_base_202020_1.xpfm -o work/vadd.xo --no_ip_cache --config run.cfg
v++ -l -O3 -s -t hw -o work/vadd.xclbin -f $PLATFORM_REPO_PATHS/xilinx_zcu102_base_202020_1.xpfm  work/vadd.xo --no_ip_cache --config run.cfg
v++ -p -t hw -f $PLATFORM_REPO_PATHS/xilinx_zcu102_base_202020_1.xpfm work/vadd.xclbin --config run.cfg

