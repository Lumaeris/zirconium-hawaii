# Pulls the kernel + modules from the latest Fedora non-rawhide release
kind: manual

sources:
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 94ed5e091a0bcae0e72bfb3affc87a1d1b39fd2604415c489e5a75b428d2efce
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: 7c691dbd55cfbb1fcf0091ed7d8eedae4fd268f0df4bea47948dd2348ffdb065
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 5f2c818a2f9686ee0533f69967b91a21eb3efac57f769a0d3089e4d4d4483aad
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-%{version}-%{pkgrelease}.x86_64.rpm
      ref: a6e1b64b5400c37b7f3b865e2568685e3422ee1e4da0197f9713c8119c6b2172
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: c0fbfbf36eb1caa4bb1f25767ba65a9ef9a22ab47ab1f1ede6813cafd8a3ebb4
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: 16f1ddb0aa1c3ee2375e05d60642ee4c635fb30566386bf68441a4929c2dff50
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-extra-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 4e9722e907053b6dcae7d66e8be94d881bedd5dc1fb80d3220a7e80b7f3b4bfc
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-extra-%{version}-%{pkgrelease}.x86_64.rpm
      ref: 177bbcd3b5776ef3aded2487063245e191200dee5da99a8c928a0871be95b5be

variables:
  version: 7.1.3
  pkgrelease: 200.fc44
  strip-binaries: ""

build-depends:
- freedesktop-sdk.bst:components/cpio.bst
- freedesktop-sdk.bst:components/xz.bst
- freedesktop-sdk.bst:components/zstd.bst
- deps/rpm-tools.bst

config:
  build-commands:
  - |
    for f in *.rpm; do
      rpm2cpio $f | cpio -idmv
    done
    mv lib usr/
    rm *.rpm
  install-commands:
  - |
    cp -ra . %{install-root}/
  - |
    %{install-extra}
