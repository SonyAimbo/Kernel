#!/bin/bash
# ##########################################################
# ALPS(Android4.1 based) build environment profile setting
# ##########################################################

#TOOLCHAIN=uber4.9
TOOLCHAIN=uber5.3

# https://bitbucket.org/UBERTC/ тулчейны
TARGET_BUILD_VARIANT=user
#TARGET_BUILD_VARIANT=eng
export TARGET_BUILD_VARIANT

# Overwrite JAVA_HOME environment variable setting if already exists
JAVA_HOME=/usr/lib/jvm/java-6-oracle
export JAVA_HOME

# Overwrite ANDROID_JAVA_HOME environment variable setting if already exists
ANDROID_JAVA_HOME=/usr/lib/jvm/java-6-oracle
export ANDROID_JAVA_HOME
export TARGET_ARCH_VARIANT=armv7-a-neon

case "$TOOLCHAIN" in
  uber4.9)
	echo "Building with UBER 4.9"
	PATH=$PWD/prebuilts/UBERTC/arm-eabi-4.9/bin:$PWD/prebuilts/UBERTC/arm-linux-androideabi-4.9/bin:$PWD/prebuilts/misc/linux-x86/make:$PATH
	export CROSS_COMPILE=arm-eabi-
	;;
  uber5.3)
	echo "Building with UBER 5.3"
	PATH=$PWD/prebuilts/UBERTC/arm-eabi-5.3/bin:$PWD/prebuilts/UBERTC/arm-linux-androideabi-5.3/bin:$PWD/prebuilts/misc/linux-x86/make:$PATH
	export CROSS_COMPILE=arm-eabi-
	;;
esac
export TOOLCHAIN_PREFIX=$CROSS_COMPILE

PATH=$JAVA_HOME/bin:$PATH
export PATH

# Overwrite PATH environment setting for JDK & arm-eabi if already exists
#PATH=/mtkoss/jdk/1.6.0_45-ubuntu-10.04/x86_64/bin:$PWD/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.7/bin:$PWD/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin:$PWD/prebuilts/misc/linux-x86/make:$PATH
#export PATH

# Add MediaTek developed Python libraries path into PYTHONPATH
if [ -z "$PYTHONPATH" ]; then
  PYTHONPATH=$PWD/mediatek/build/tools
else
  PYTHONPATH=$PWD/mediatek/build/tools:$PYTHONPATH
fi
export PYTHONPATH

