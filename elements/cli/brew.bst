kind: manual

sources:
- kind: docker
  url: ghcr:ublue-os/brew
  track: latest
  ref: fb4bc94a46dd6dd0a62f1b09ae2f82acc046288fd5540bf50243cc5e95e5b569

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ""

config:
  install-commands:
  - cp -r system_files/usr/ "%{install-root}%{prefix}/"
  - cp -r system_files/etc/ "%{install-root}%{sysconfdir}/"
  - "%{install-extra}"
