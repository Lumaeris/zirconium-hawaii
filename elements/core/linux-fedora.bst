# Pulls the kernel + modules from the latest Fedora non-rawhide release
kind: manual

sources:
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 7b305ef36f34f148211b8d2c7c902ab2c4cb994ee4860e76e772665320712016
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: c8146d6a00f5de1c85e2a1ad4a01b93deaf7669b56d34992f2aedb245ab3fbf6
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 03baf113fec6b4f0482e193d2df4e840d20ffb2ecdb1f988c818e865daa89697
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-%{version}-%{pkgrelease}.x86_64.rpm
      ref: ba99b6e1c83db035e9f95b29aae19f331d267776873c3d86fcedaae4acd3286f
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: e755487f870273c4446f52569d7fbb4bb10d22b3c66105e69148ef45b4802227
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: c585dda32e8ba56e110c6af299ec51fdff49def7af009f39f412cf1c94fd0596
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-extra-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 95070faadad70c0a76d2dec2adb87ecb149d20c63d6410d36eaca255176e6c20
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-extra-%{version}-%{pkgrelease}.x86_64.rpm
      ref: ba3cc677ad77a09df8bfee4fdfeacd272f287fe57245c44a2e748f28373f1ac0

variables:
  version: 7.1.9
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
