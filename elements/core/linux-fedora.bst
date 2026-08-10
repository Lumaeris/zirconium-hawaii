# Pulls the kernel + modules from the latest Fedora non-rawhide release
kind: manual

sources:
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 50996129bd14eaca0711409af5a1330f697049aab86a6ba00a2dd1293bf672e2
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: 10f4db4638955c2cc030e7edabe2bbd654f9368317732a2a3ef8cd734bf5b537
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-%{version}-%{pkgrelease}.aarch64.rpm
      ref: a22bdf6987cc6dd11957b64383641a7c56f94bf0fe63cde5f87561763c006477
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-%{version}-%{pkgrelease}.x86_64.rpm
      ref: ac75df00eec395ce6f2e89a1f072146dd3e0bcf91823415897292d264353efda
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 51fdba1462bcb8ce2a4d0ffa064c2bc8aa75294bd40af7f0882cd2c260615543
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: aabba2f3dad15c7edc02118f0416d9c1697cfdf175d0cf671c82d5478f9ed058
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-extra-%{version}-%{pkgrelease}.aarch64.rpm
      ref: c01dbc1f9c927d514ce370eb7381726c5ce4cfaa410fa249dc5c3a159e7f3431
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-extra-%{version}-%{pkgrelease}.x86_64.rpm
      ref: f2a57752fd99ac7e580fabaf7828beabd047457feb4cc883d716543d8bca833c

variables:
  version: 7.1.7
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
