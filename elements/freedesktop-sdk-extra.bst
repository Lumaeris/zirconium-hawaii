kind: junction

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk-extra.git
  track: freedesktop-sdk-extra-26.08*
  ref: freedesktop-sdk-extra-26.08.0-0-g6a6c7186fd51e4e4d2fe54c40e04e910ce34903f
- kind: patch_queue
  path: patches/freedesktop-sdk-extra

config:
  overrides:
    freedesktop-sdk.bst: freedesktop-sdk.bst
