if [ -d ~/data/android-sdks ]; then
    export PATH=~/data/android-sdks/platform-tools:~/data/android-sdks/tools:~/data/android-sdks/build-tools/22.0.1:$PATH
fi
if [ -d ~/Android/Sdk ]; then
    export PATH=~/Android/Sdk/platform-tools:~/Android/Sdk/tools:~/android-sdks/build-tools/22.0.1:$PATH
fi
