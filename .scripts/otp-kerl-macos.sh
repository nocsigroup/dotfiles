#!/bin/sh
# For macOS with HomeBrew OpenSSL
OTP_VERSION=$1
OPENSSL_LOCAL="/opt/homebrew/opt/openssl@1.1"
CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

#
env \
    CC=/opt/homebrew/opt/llvm/bin/clang \
    CXX=/opt/homebrew/opt/llvm/bin/clang++ \
    CFLAGS="-O3 -fstack-protector-strong -I/opt/homebrew/opt/llvm/include" LDFLAGS="-fstack-protector-strong -L/opt/homebrew/opt/llvm/lib" \
    MAKEFLAGS="-j8" \
    KERL_BUILD_PLT="yes" \
    KERL_CONFIGURE_OPTIONS="--enable-m64-build --enable-darwin-64bit --disable-hipe --enable-vm-probes --with-dynamic-trace=dtrace --disable-native-libs --enable-kernel-poll --enable-dirty-schedulers --enable-sharing-preserving --enable-lock-counter --disable-sctp --without-javac --without-odbc --enable-threads --enable-smp-support --with-wx --with-ssl=${OPENSSL_LOCAL} --disable-silent-rules --disable-dynamic-ssl-lib" \
    kerl build git https://github.com/jj1bdx/otp/ OTP-${OTP_VERSION} ${OTP_VERSION}
