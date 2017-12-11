export PATH="$HOME/.anyenv/bin:$PATH"
if which anyenv > /dev/null; then
  eval "$(anyenv init -)"
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

export GOPATH="$HOME/go"

# Android dev environment for MacOS
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_NDK_ROOT=/Applications/android-ndk
export ANDROID_BUILD_TOOLS_DIR=${ANDROID_SDK_ROOT}/build-tools/21.1.2
export PATH=${ANDROID_NDK_ROOT}:$PATH
export PATH=${ANDROID_SDK_ROOT}/platform-tools:$PATH
export PATH=${ANDROID_SDK_ROOT}/tools:$PATH

export NDK_ROOT=${ANDROID_NDK_ROOT}

export USE_CCACHE=1
export NDK_CCACHE=/usr/local/bin/ccache
