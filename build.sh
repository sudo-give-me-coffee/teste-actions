#!/bin/bash

# Gera a configuração

echo "global

    qtdir ~/kde/qt5
    include-dependencies true
    kdedir ~/kde/usr
    source-dir ~/kde/src
    build-dir ~/kde/build
    
    num-cores 2
    num-cores-low-mem 2

    make-options -j ${num-cores}

    install-session-driver false

    install-environment-driver true

    stop-on-failure true

    directory-layout flat
end global

include /home/runner/kdesrc-build/kf5-common-options-build-include
include /home/runner/kdesrc-build/qt5-build-include
include /home/runner/kdesrc-build/custom-qt5-libs-build-include
include /home/runner/kdesrc-build/kf5-frameworks-build-include
include /home/runner/kdesrc-build/kf5-workspace-build-include
include /home/runner/kdesrc-build/kf5-applications-build-include

" > ~/.kdesrc-buildrc

cd ${HOME}

kdesrc-build --pretend
git clone https://invent.kde.org/sdk/kdesrc-build
cd kdesrc-build
sudo ./kdesrc-build --initial-setup
./kdesrc-build --stop-on-failure konsole

