#!/bin/bash

set -e

echo "======================================"
echo " Smart Parking System - Build"
echo "======================================"

if command -v make >/dev/null 2>&1; then
    make clean
    make
else
    g++ -std=c++17 -Wall -Wextra -pedantic \
        src/main.cpp \
        src/parking_system.cpp \
        src/parking_sensor.cpp \
        src/parking_ipc.cpp \
        src/linux_logger.cpp \
        -o smart_parking
fi

echo ""
echo "BUILD SUCCESSFUL"