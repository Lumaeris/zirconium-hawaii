# Pulls the kernel + modules from the latest Fedora non-rawhide release
kind: manual

sources:
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 7def83cad92be68a8db0669cb5801bb988f4d9e0402d04fcbfe2932bf35fcfc7
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: a875fdc69c72bc665830c32e265d72992612212abde7c6591326093779b075f4
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 4bad8731a243c2e2b7e1209730b470c8f8cef7f7c26a90a2e85f7ea339f6cd32
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-%{version}-%{pkgrelease}.x86_64.rpm
      ref: 54a030ea8bef3d922a469a9a6fe36ad8d73e87da97738234d1eed97a5ba87251
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-core-%{version}-%{pkgrelease}.aarch64.rpm
      ref: c41c98007549c804ccd022e0c0432e98fdedd6990d9ce9be8fc1e1ab5e78bc7f
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-core-%{version}-%{pkgrelease}.x86_64.rpm
      ref: 7ba5e18dfa872ee221f66cb6804cff365ade8992280c0f670ea6d6f9c46c3559
- kind: remote
  (?):
  - arch == "aarch64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/aarch64/kernel-modules-extra-%{version}-%{pkgrelease}.aarch64.rpm
      ref: 6a619fd83b59b0be4991b68479dbc75518c9369d81b710704f796bcf1d05a87b
  - arch == "x86_64":
      url: kojipkgs-fedora:packages/kernel/%{version}/%{pkgrelease}/x86_64/kernel-modules-extra-%{version}-%{pkgrelease}.x86_64.rpm
      ref: 971bf6ee31a7f23b46cc2a0f298ed5ce193c7fcdc799c1df97efaf642eefc972

variables:
  version: 7.1.4
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
