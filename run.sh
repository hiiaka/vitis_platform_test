#!/bin/bash -euv

export VITIS_DIR='/usr/tools/xilinx/Vitis/2021.1'
source $VITIS_DIR/settings64.sh
export PLATFORM_REPO_PATHS=/usr/tools/xilinx/platforms/xilinx_zcu102_base_202110_1

rm -rf work *.log _x sd_card *bin *BIN *.dat
mkdir work

v++ -c -O3 src/vadd.c -t hw --kernel vadd -f $PLATFORM_REPO_PATHS/xilinx_zcu102_base_202110_1.xpfm -o work/vadd.xo --no_ip_cache --config run.cfg
v++ -l -O3 -s -t hw -o work/vadd.xclbin -f $PLATFORM_REPO_PATHS/xilinx_zcu102_base_202110_1.xpfm  work/vadd.xo --no_ip_cache --config run.cfg
v++ -p -t hw -f $PLATFORM_REPO_PATHS/xilinx_zcu102_base_202110_1.xpfm work/vadd.xclbin --config run.cfg

