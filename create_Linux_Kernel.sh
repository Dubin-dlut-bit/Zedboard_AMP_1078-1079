## Linux Kernel Compile
# 加载Xilinx的settings文件
source /opt/Xilinx/14.7/ISE_DS/settings32.sh
cd /home/dubin/linux-3.3-digilent/
# 配置源码使其支持Xilinx的BPS与驱动
make ARCH=arm digilent_zed_defconfig
# 建立临时的环境变量
export CROSS_COMPILE=arm-xilinx-linux-gnueabi-
# 进行Linux内核编译
make ARCH=arm
cp /home/dubin/linux-3.3-digilent/arch/arm/boot/zImage /home/dubin/zImage
cd /home/dubin
