# Pulls the kernel + modules from the latest Fedora non-rawhide release
kind: manual

sources:
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 29e3ff419dc66fc10ca9c7df928e4b0024ac11ce0c8e9d64cb26f0eae8adceba
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: fc27e6ffbada443bdf4587b62d3c1313c8384bbaf950d56371e1bb32b9ee5e0a
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 0200623a11978dd18c5389c27eb429de0f98db07f79347f19ba434c6441ca108
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-%{version}-%{pkgrelease}.x86_64.rpm
      ref: d8bdbdeaf2f7d3ee63fd5c49fedd174ff37b0fcd62668e6510583c9017f5afaf
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: d2b5079933df87500637e310948c34977bb8309cc0bf9ed0e0c066e0376aafd2
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: 33651964af029b4d6ae94b4a24f249afebc72c3f05bb33453c6a88a443cb4d92
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-extra-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 654eaac6772e0427c733c73fb77c79daec9681983136a452724d2c0c3c2a4b95
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-extra-%{version}-%{pkgrelease}.x86_64.rpm
      ref: 173b18e606db2adfb1f3973c52faf03d9470c9bb6bf871bd5b09e4cfb71bc0b4

variables:
  version: 7.1.12
  pkgrelease: 100.fc43
  strip-binaries: ""
  install-root: "%{build-root}"

build-depends:
- freedesktop-sdk.bst:components/bzip2.bst
- freedesktop-sdk.bst:components/libarchive.bst

config:
  build-commands:
  - |
    for f in *.rpm; do
      bsdtar xvf $f
    done
    mv lib usr/
    rm *.rpm
