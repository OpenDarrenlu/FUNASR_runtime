# riscv-toolchain.cmake
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR riscv64)

# 指定交叉编译工具链路径
set(TOOLCHAIN_PREFIX riscv64-unknown-linux-gnu)
# 如果使用Ubuntu提供的工具链，可能是：
# set(TOOLCHAIN_PREFIX riscv64-linux-gnu)

set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_AR ${TOOLCHAIN_PREFIX}-ar)
set(CMAKE_LINKER ${TOOLCHAIN_PREFIX}-ld)
set(CMAKE_NM ${TOOLCHAIN_PREFIX}-nm)
set(CMAKE_OBJCOPY ${TOOLCHAIN_PREFIX}-objcopy)
set(CMAKE_OBJDUMP ${TOOLCHAIN_PREFIX}-objdump)
set(CMAKE_RANLIB ${TOOLCHAIN_PREFIX}-ranlib)
set(CMAKE_STRIP ${TOOLCHAIN_PREFIX}-strip)

# 搜索路径设置
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# 设置目标架构标志
set(CMAKE_C_FLAGS "-march=rv64imafdcv -mabi=lp64d" CACHE STRING "C compiler flags")
set(CMAKE_CXX_FLAGS "-march=rv64imafdcv -mabi=lp64d" CACHE STRING "C++ compiler flags")

# 如果您的目标平台有特定的浮点支持，可能需要调整
# 例如：-march=rv64imafdc -mabi=lp64f 表示有硬件浮点但无向量扩展