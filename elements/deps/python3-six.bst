kind: manual

sources:
- kind: git_repo
  url: github:benjaminp/six.git
  track: "*.*.*"
  exclude:
  - "*b*"
  ref: 1.17.0-0-gebd9b3af90247b8858d415a05e96e9ee61e48d07

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- freedesktop-sdk.bst:components/python3-wheel.bst

depends:
- freedesktop-sdk.bst:components/python3.bst

config:
  build-commands:
  - |
    python -m build -nw
  install-commands:
  - |
    python -m installer -d "%{install-root}" dist/*.whl
  - |
    %{install-extra}

