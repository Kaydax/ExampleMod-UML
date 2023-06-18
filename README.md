# UML Example Mod

Just a simple example template for making coremods for [Unreal Mod Loader](https://github.com/RussellJerome/UnrealModLoader)

To get started, either clone/fork the repo, else click "Use this template".

Then do `git submodule init` then `git submodule update`

After compiling, the output should exist in x64/Release/ExampleMod.dll

If you want to change your mods name, just rename the files and class, as well as update the modname itself in the header. If you change the header file name / class name, make sure to update the stuff inside of dllmain.cpp with the new class and header file.

# Compiling on Linux

This is probably the most stupidest thing you could ever do... but you can do it

Firstly, you need to install [msvc-wine](https://github.com/mstorsjo/msvc-wine)

Follow the Clang/LLD in MSVC mode instructions for msvc-wine, but make sure you set the destination to `~/.msvc` as the build.sh file will be expecting msvc to be there. The vsdownload command you should run should be: `./vsdownload.py --dest ~/.msvc Microsoft.VisualStudio.Workload.NativeGame` as this will make sure to also download the needed files for DirectX.

Now after you went through the hell of installing the msvc toolchain with clang, you now get to experience the fun of hoping this project will compile correctly.

Just run `build.sh` and it should compile everything