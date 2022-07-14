# Citra ARM64 MacOS Standalone

This is a fork of `Citra` with the intention of publishing standalone builds for
Apple Silicon Macs for users that want to try native builds of Citra but dont have
the know-how to build it themselves. The only difference between this repository
and upstream `Citra` is the addition of the script `build-arm64-macos-standalone.sh`
that is used to build and bundle `Citra` standalone for Apple Silicon Macs.

The newest release can be found under [Releases](https://github.com/dagstuan/citra-arm64-macos-standalone/releases).

The releases are not signed and notarized, so you will need to allow MacOS to run Citra
after download. Apple has a [guide for this](https://support.apple.com/en-us/HT202491).

The releases are published without any support. Use at your own risk.

Resources used for creating the builds:

* [Building for MacOS](https://github.com/citra-emu/citra/wiki/Building-for-macOS)
* [Citra on M1 / M1 Pro - ARM64 Native App - Guide - Reddit](https://www.reddit.com/r/macgaming/comments/qob17l/citra_on_m1_m1_pro_arm64_native_app_guide/)

## Building standalone for Apple Silicon yourself.

If you want to build yourself, this repository needs to be cloned with the
`--recursive`-flag. Such as

```
git clone --recursive https://github.com/dagstuan/citra-arm64-macos-standalone.git
cd citra-arm64-macos-standalone
```

You can then follow the [official guide for building on MacOS](https://github.com/citra-emu/citra/wiki/Building-for-macOS) for installing the dependencies required. In addition a few others are needed for bundling. They are documented in `build-arm64-macos-standalone.sh`.

After installing the dependencies, you can run `./build-arm64-macos-standalone.sh` to
get a standalone build of `Citra` for Apple Silicon. The script creates the file
`citra-arm64-macos-standalone.zip` containing the app.

# Citra

[![GitHub Actions Build Status](https://github.com/citra-emu/citra/workflows/citra-ci/badge.svg)](https://github.com/citra-emu/citra/actions)
[![Bitrise CI Build Status](https://app.bitrise.io/app/4ccd8e5720f0d13b/status.svg?token=H32TmbCwxb3OQ-M66KbAyw&branch=master)](https://app.bitrise.io/app/4ccd8e5720f0d13b)
[![Discord](https://img.shields.io/discord/220740965957107713?color=%237289DA&label=Citra&logo=discord&logoColor=white)](https://discord.gg/FAXfZV9)

Citra is an experimental open-source Nintendo 3DS emulator/debugger written in C++. It is written with portability in mind, with builds actively maintained for Windows, Linux and macOS.

Citra emulates a subset of 3DS hardware and therefore is useful for running/debugging homebrew applications, and it is also able to run many commercial games! Some of these do not run at a playable state, but we are working every day to advance the project forward. (Playable here means compatibility of at least "Okay" on our [game compatibility list](https://citra-emu.org/game).)

Citra is licensed under the GPLv2 (or any later version). Refer to the license.txt file included. Please read the [FAQ](https://citra-emu.org/wiki/faq/) before getting started with the project.

Check out our [website](https://citra-emu.org/)!

Need help? Check out our [asking for help](https://citra-emu.org/help/reference/asking/) guide.

For development discussion, please join us on our [Discord server](https://citra-emu.org/discord/) or at #citra-dev on libera.

### Releases

Citra has two main release channels: Nightly and Canary.

The [Nightly](https://github.com/citra-emu/citra-nightly) build is based on the master branch, and contains already reviewed and tested features.

The [Canary](https://github.com/citra-emu/citra-canary) build is based on the master branch, but with additional features still under review. PRs tagged `canary-merge` are merged only into the Canary builds.

Both builds can be installed with the installer provided on the [website](https://citra-emu.org/download/), but those looking for specific versions or standalone releases can find them in the release tabs of the [Nightly](https://github.com/citra-emu/citra-nightly/releases) and [Canary](https://github.com/citra-emu/citra-canary/releases) repositories.

Currently, development and releases of the Android version are in [a separate repository](https://github.com/citra-emu/citra-android).

A Flatpak for Citra is available on [Flathub](https://flathub.org/apps/details/org.citra_emu.citra). Details on the build process can be found in [our Flathub repository](https://github.com/flathub/org.citra_emu.citra).

### Development

Most of the development happens on GitHub. It's also where [our central repository](https://github.com/citra-emu/citra) is hosted.

If you want to contribute please take a look at the [Contributor's Guide](https://github.com/citra-emu/citra/wiki/Contributing) and [Developer Information](https://github.com/citra-emu/citra/wiki/Developer-Information). You should also contact any of the developers in the forum in order to know about the current state of the emulator because the [TODO list](https://docs.google.com/document/d/1SWIop0uBI9IW8VGg97TAtoT_CHNoP42FzYmvG1F4QDA) isn't maintained anymore.

If you want to contribute to the user interface translation, please check out the [citra project on transifex](https://www.transifex.com/citra/citra). We centralize the translation work there, and periodically upstream translations.

### Building

* __Windows__: [Windows Build](https://github.com/citra-emu/citra/wiki/Building-For-Windows)
* __Linux__: [Linux Build](https://github.com/citra-emu/citra/wiki/Building-For-Linux)
* __macOS__: [macOS Build](https://github.com/citra-emu/citra/wiki/Building-for-macOS)


### Support
We happily accept monetary donations or donated games and hardware. Please see our [donations page](https://citra-emu.org/donate/) for more information on how you can contribute to Citra. Any donations received will go towards things like:
* 3DS consoles for developers to explore the hardware
* 3DS games for testing
* Any equipment required for homebrew
* Infrastructure setup

We also more than gladly accept used 3DS consoles! If you would like to give yours away, don't hesitate to join our [Discord server](https://citra-emu.org/discord/) and talk to bunnei.
