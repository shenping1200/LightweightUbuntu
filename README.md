# LightweightUbuntu

本项目提供一种无需 root 权限即可在任意 Linux 或类 Unix 系统中快速部署 Ubuntu 20.04 用户空间环境的方法。适用于安卓设备、受限服务器、实验环境等。

## 功能特色

- **无需 root 权限**：通过 Proot 技术模拟完整 Linux 文件系统。
- **自动安装脚本**：一键运行，快速部署。
- **多架构支持**：支持 arm64 与 amd64 平台。
- **网络配置自动处理**：包含 DNS 设置，适配广泛网络环境。
- **教育与开发环境首选**：轻便、快速、灵活。

## 使用方法

### 克隆项目

```bash
git clone https://github.com/shenping1200/LightweightUbuntu.git
cd LightweightUbuntu
```

### 安装系统

```bash
bash root.sh
```

系统会自动完成：

- 下载适配架构的 Ubuntu 文件系统；
- 下载并设置 Proot；
- 初始化并配置必要的系统参数；
- 完成部署标记。

### 启动 Ubuntu

```bash
./start.sh
```

## 文件结构说明

- `root.sh`：主安装脚本。
- `noninteractive.sh`：无需交互的安装版本。
- `start.sh`：启动 Ubuntu 环境。
- `proot-aarch64` / `proot-x86_64`：不同架构对应的 Proot 可执行文件。
- `LICENSE`：MIT 开源许可证。

## 许可协议

本项目基于 MIT 协议发布，您可以自由使用、修改和分发代码。请遵守 LICENSE 文件中列出的授权条款。