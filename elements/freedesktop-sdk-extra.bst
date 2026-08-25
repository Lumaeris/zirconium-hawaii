kind: junction

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk-extra.git
  track: main
  ref: c485c889dfafbd2b7cdd8f0496978c0c799ea97f
- kind: patch_queue
  path: patches/freedesktop-sdk-extra

config:
  overrides:
    freedesktop-sdk.bst: freedesktop-sdk.bst
