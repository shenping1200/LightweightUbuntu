#!/bin/bash
set -e

ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    PROOT_URL="https://github.com/termux/proot-static/releases/latest/download/proot-x86_64"
elif [ "$ARCH" = "aarch64" ]; then
    PROOT_URL="https://github.com/termux/proot-static/releases/latest/download/proot-aarch64"
else
    echo "不支持的架构: $ARCH"
    exit 1
fi

echo "[*] 正在准备 Ubuntu 根文件系统..."
wget https://partner-images.canonical.com/core/focal/current/ubuntu-focal-core-cloudimg-${ARCH}-root.tar.gz -O ubuntu.tar.gz
mkdir -p ubuntu-fs
tar -xzf ubuntu.tar.gz -C ubuntu-fs
rm ubuntu.tar.gz

echo "[*] 下载 Proot..."
wget $PROOT_URL -O proot
chmod +x proot

echo "[*] 创建启动脚本..."
cat > start.sh <<- EOM
#!/bin/bash
cd \$(dirname \$0)
unset LD_PRELOAD
./proot -0 -r ubuntu-fs -b /dev -b /proc -b /sys -b \$HOME:/root -w /root /bin/bash --login
EOM
chmod +x start.sh

echo "[*] 安装完成，使用 ./start.sh 启动 Ubuntu 环境"
