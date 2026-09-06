kind: manual

sources:
- kind: local
  path: files/nvidia-config

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{indep-libdir}/bootc/kargs.d/" 00-nvidia.toml
  - install -Dm644 -t "%{install-root}%{indep-libdir}/systemd/system/" nvctk-cdi.service
  - install -Dm644 -t "%{install-root}%{indep-libdir}/systemd/system-preset/" 10-nvidia.preset
  - "%{install-extra}"
