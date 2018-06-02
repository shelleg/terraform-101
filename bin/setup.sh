#!/usr/bin/env bash
source ./common/distro.sh
source ./common/base.sh

GetOSVersion
GetDistro

# echo $os_VENDOR
# echo $os_RELEASE
# echo $os_UPDATE
# echo $os_PACKAGE
# echo $os_CODENAME
# echo $DISTRO

case "$os_VENDOR" in
  "Mac OS X")
    validate_homebrew
    install_terraform
    ;;
esac
