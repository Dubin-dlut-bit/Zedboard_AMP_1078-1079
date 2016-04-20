## Create filesystem: ramdisk8M.image.gz
# 创建连续大小（8M）的空间
dd if=/dev/zero of=ramdisk8M.image bs=1024 count=8192
# 格式化文件系统镜像
mke2fs -F ramdisk8M.image -L "ramdisk" -b 1024 -m 0
# 调整自检的时间间隔
tune2fs ramdisk8M.image -i 0
# 修改ramdisk8M.image权限，所有用户都有读写和可执行的权限（777）
chmod 777 ramdisk8M.image

# 建立ramdisk文件夹，用作挂载点
mkdir /home/dubin/ramdisk
# 挂载ramdisk8M.image
mount -o loop ramdisk8M.image /home/dubin/ramdisk/
# 复制文件系统内容到ramdisk文件夹
# 如果要更改ramdisk8M.image.gz的内容，更改filesystem文件夹中的内容即可
cp -R /home/dubin/filesystem/* /home/dubin/ramdisk
# 卸载镜像
umount ramdisk
# 压缩镜像
gzip -9 ramdisk8M.image
# 删除ramdisk文件夹
rmdir /home/dubin/ramdisk
