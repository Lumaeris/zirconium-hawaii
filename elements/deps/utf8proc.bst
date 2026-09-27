kind: make

sources:
- kind: git_repo
  url: github:JuliaStrings/utf8proc.git
  track: v*
  ref: v2.11.3-0-ge5e799221b45bbb90f5fdc5c69b6b8dfbf017e78

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/cmake.bst

runtime-depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    libdir="%{prefix}/%{lib}"
    prefix="%{prefix}"
