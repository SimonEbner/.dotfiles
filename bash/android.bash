if [ -d ~/android-sdks ]; then
    export PATH=~/android-sdks/platform-tools:~/android-sdks/tools:~/android-sdks/build-tools/22.0.1:$PATH
fi
if [ -d ~/Android/Sdk ]; then
    export PATH=~/Android/Sdk/platform-tools:~/Android/Sdk/tools:~/android-sdks/build-tools/22.0.1:$PATH
fi
