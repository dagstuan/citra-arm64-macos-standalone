#!/bin/bash -ex

# This script follows the build instructions from here:
# https://github.com/citra-emu/citra/wiki/Building-for-macOS
# ..along with the bundle instructions from .ci/macos/upload.sh
#
# This script expects the following packages to be installed using
# brew and pip3:
# brew install pkgconfig sdl2 qt5 cmake openssl ffmpeg
# pip3 install macpack

# Build
if [ -d build ] ; then
    rm -r build
fi

mkdir build && cd build

export Qt5_DIR=$(brew --prefix)/opt/qt5

cmake .. -DCMAKE_OSX_ARCHITECTURES="arm64" \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_QT_TRANSLATION=ON \
    -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
    -DUSE_DISCORD_PRESENCE=ON \
    -DENABLE_FFMPEG_AUDIO_DECODER=ON \
    -DENABLE_FFMPEG_VIDEO_DUMPER=ON

make -j4

cd ..

# Bundle
REV_NAME="citra-arm64-macos-standalone"

if [ -d "$REV_NAME" ] ; then
    rm -r "$REV_NAME"
fi

mkdir "$REV_NAME"

cp build/bin/Release/citra "$REV_NAME"
cp -r build/bin/Release/citra-qt.app "$REV_NAME"
cp build/bin/Release/citra-room "$REV_NAME"

# move libs into folder for deployment
macpack "${REV_NAME}/citra-qt.app/Contents/MacOS/citra-qt" -d "../Frameworks"
# move qt frameworks into app bundle for deployment
$(brew --prefix)/opt/qt5/bin/macdeployqt "${REV_NAME}/citra-qt.app" -executable="${REV_NAME}/citra-qt.app/Contents/MacOS/citra-qt"

# move libs into folder for deployment
macpack "${REV_NAME}/citra" -d "libs"

# workaround for libc++
install_name_tool -change @loader_path/../Frameworks/libc++.1.0.dylib /usr/lib/libc++.1.dylib "${REV_NAME}/citra-qt.app/Contents/MacOS/citra-qt"
install_name_tool -change @loader_path/libs/libc++.1.0.dylib /usr/lib/libc++.1.dylib "${REV_NAME}/citra"

# libbrotlicommon.1.dylib is not copied by macpack automatically, copy it manually
# This is due to an issue with macpack itself not following @loader-path paths.
cp /opt/homebrew/lib/libbrotlicommon.1.dylib ${REV_NAME}/citra-qt.app/Contents/Frameworks
cp /opt/homebrew/lib/libbrotlicommon.1.dylib ${REV_NAME}/libs
chmod +w ${REV_NAME}/citra-qt.app/Contents/Frameworks/libbrotlicommon.1.dylib
chmod +w ${REV_NAME}/libs/libbrotlicommon.1.dylib

install_name_tool -change @loader_path/libbrotlicommon.1.dylib @executable_path/../Frameworks/libbrotlicommon.1.dylib "${REV_NAME}/citra-qt.app/Contents/MacOS/citra-qt"
install_name_tool -change @loader_path/libbrotlicommon.1.dylib @executable_path/libs/libbrotlicommon.1.dylib "${REV_NAME}/citra"

# Make the launching script executable
chmod +x ${REV_NAME}/citra-qt.app/Contents/MacOS/citra-qt

# Verify loader instructions
find "$REV_NAME" -type f -exec otool -L {} \;

codesign --force --deep --sign - "${REV_NAME}/citra-qt.app"

zip -vr $REV_NAME.zip $REV_NAME
rm -r $REV_NAME build
