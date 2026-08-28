# Pulls the kernel + modules from the latest Fedora non-rawhide release
kind: manual

sources:
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: cc7b1ab77f91fa2a03491f93149cf81d3c9f0f53ba4ea171b419e3b978fffdff
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: a25752ff54d0ad1ad9d720283547f75738b90a31d14241782d11e9da75b795cf
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 5f1b6f37ca395fa85efc0728a4816b0587bb7afe3ffefd589aa03de0fe521785
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-%{version}-%{pkgrelease}.x86_64.rpm
      ref: c8339befd41e837a576555751521b30d209018058f2a5c37ff6e707b4b46db93
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 450a15db496b167c022a1f5863320d20f30fa2dcfa0e638312baa91be59e7d9d
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: abd000a753ad9d2e83c6eeed394aeac2232593e4b47aef05c8ef53c87517e2b6
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-extra-%{version}-%{pkgrelease}.aarch64.rpm
      ref: b5971d5573133be6f767bd15289a7ea52b09a5dbb8baf1aefc3c4bd57921bba8
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-extra-%{version}-%{pkgrelease}.x86_64.rpm
      ref: b8ed309e064d32e3a0bc36be79de84e2187c06562fc32d464aad202858e37759

variables:
  version: 7.1.11
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
