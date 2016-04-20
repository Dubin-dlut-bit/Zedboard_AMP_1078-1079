## Create link for cross compile 为交叉编译建立软连接
cd /home/dubin/CodeSourcery/Sourcery_CodeBench_Lite_for_Xilinx_GNU_Linux/bin
ln -s arm-xilinx-linux-gnueabi-gcc arm-linux-gcc
ln -s arm-xilinx-linux-gnueabi-ar arm-linux-ar
ln -s arm-xilinx-linux-gnueabi-ld arm-linux-ld
ln -s arm-xilinx-linux-gnueabi-objcopy arm-linux-objcopy
ln -s arm-xilinx-linux-gnueabi-objdump arm-linux-objdump
cd /home/dubin

## u-boot compile
# 加载Xilinx的settings
source /opt/Xilinx/14.7/ISE_DS/settings32.sh
cd /home/dubin/u-boot-digilent
# 创建临时的环境变量
export CROSS_COMPILE=arm-xilinx-linux-gnueabi-
# 配置源码，进行u-boot编译
make zynq_zed_config
make

cp /home/dubin/u-boot-digilent/u-boot /home/dubin/u-boot.elf
cd /home/dubin/
