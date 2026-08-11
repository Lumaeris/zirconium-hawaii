# Pulls the kernel + modules from the latest Fedora non-rawhide release
kind: manual

sources:
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 4347e8fbf492362adfd58a27c3bf6fb325e9d2dbf4ebef53d41e969a12fd955a
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: 00929cbc686ce04a2e258d0e9fe77ca5970071b3ed6dae218ae960173c5609a8
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 011f008e5281059d218db2dacbf7c23990f0559b71b4f7f0df59e2ab9aa8201b
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-%{version}-%{pkgrelease}.x86_64.rpm
      ref: a782da7b84408d6f3a2d48a7053f48e30c8ccd7a124860bdbbcbd57577625e58
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: b195082e54cc23def53dc77eb366d063ae26b2d5146c6efced0b69ca115ac1b3
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: 461e3a48f8936e88e5ac5708238fce3a2fad7c9d51c1c514c3e8006a32a00d4d
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-extra-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 2a94b818c2313860cf8b3ca8e70f8d4f7bdb07ee36440d15ab0c71af6a6e13f5
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-extra-%{version}-%{pkgrelease}.x86_64.rpm
      ref: eb3699be128d8cd135e74a66ccd8374790c679cbe276a17fc32cb9a93f585850

variables:
  version: 7.1.8
  pkgrelease: 200.fc44
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
