#!/usr/bin/env bash

set -cd "C:\Users\sahib\Documents\smart-parking-system-main\smart-parking-system-main"
g++ -std=c++17 -Wall -Wextra -pedantic src\main.cpp src\parking_system.cpp src\parking_sensor.cpp src\parking_ipc.cpp src\linux_logger.cpp -o smart_parking
.\smart_parking.exe")"

echo "======================================"
echo " Starting Smart Parking System"
echo "======================================"

binary="./smart_parking"
if [ ! -x "$binary" ] && [ ! -x "./smart_parking.exe" ]; then
    echo "smart_parking binary not found. Building project..."
    if command -v make >/dev/null 2>&1; then
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
fi

if [ -x "./smart_parking" ]; then
    exec ./smart_parking
elif [ -x "./smart_parking.exe" ]; then
    exec ./smart_parking.exe
else
    echo "Build failed: smart_parking binary was not produced."
    exit 1
fi