#!/bin/bash

# exit when any command fails
set -e

REPOSITORY=https://github.com/vortexgpgpu/vortex-toolchain-prebuilt/raw/master

DESTDIR="${DESTDIR:=/opt}"

riscv()
{
    for x in {a..j} 
    do
        wget $REPOSITORY/riscv-gnu-toolchain/ubuntu/bionic/riscv-gnu-toolchain.tar.bz2.parta$x
    done
    cat riscv-gnu-toolchain.tar.bz2.parta* > riscv-gnu-toolchain.tar.bz2
    tar -xvf riscv-gnu-toolchain.tar.bz2
    rm -f riscv-gnu-toolchain.tar.bz2*
    cp -r riscv-gnu-toolchain $DESTDIR
    rm -rf riscv-gnu-toolchain
}

riscv64()
{
    for x in {a..j} 
    do
        wget $REPOSITORY/riscv64-gnu-toolchain/ubuntu/bionic/riscv64-gnu-toolchain.tar.bz2.parta$x
    done
    cat riscv64-gnu-toolchain.tar.bz2.parta* > riscv64-gnu-toolchain.tar.bz2
    tar -xvf riscv64-gnu-toolchain.tar.bz2
    rm -f riscv64-gnu-toolchain.tar.bz2*
    cp -r riscv64-gnu-toolchain $DESTDIR
    rm -rf riscv64-gnu-toolchain
}

llvm()
{
    for x in {a..b} 
    do
        wget $REPOSITORY/llvm-vortex/ubuntu/bionic/llvm-vortex1.tar.bz2.parta$x
    done
    cat llvm-vortex1.tar.bz2.parta* > llvm-vortex1.tar.bz2
    tar -xvf llvm-vortex1.tar.bz2
    rm -f llvm-vortex1.tar.bz2*
    cp -r llvm-riscv $DESTDIR
    rm -rf llvm-riscv
}

pocl()
{
    wget $REPOSITORY/pocl/ubuntu/bionic/pocl1.tar.bz2
    tar -xvf pocl1.tar.bz2
    rm -f pocl1.tar.bz2
    cp -r pocl $DESTDIR
    rm -rf pocl
}

verilator()
{
    wget $REPOSITORY/verilator/ubuntu/bionic/verilator.tar.bz2
    tar -xvf verilator.tar.bz2
    rm -f verilator.tar.bz2
    cp -r verilator $DESTDIR
    rm -rf verilator
}

usage()
{
    echo "usage: toolchain_install [[-riscv] [-riscv64] [-llvm] [-pocl] [-verilator] [-all] [-h|--help]]"
}

while [ "$1" != "" ]; do
    case $1 in
        -pocl ) pocl
                ;;
        -verilator ) verilator
                     ;;
        -riscv ) riscv
                 ;;
        -riscv64 ) riscv64
                 ;;
        -llvm ) llvm
                ;;
        -all ) riscv
               riscv64
               llvm
               pocl
               verilator
               ;;
        -h | --help ) usage
                      exit
                      ;;
        * )           usage
                      exit 1
    esac
    shift
done