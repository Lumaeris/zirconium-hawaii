kind: stack

depends:
  - stacks/zirconium.bst

  - gnome-build-meta.bst:gnomeos-deps/nvidia-drivers.bst
  - gnome-build-meta.bst:gnomeos-deps/nvidia-container-toolkit.bst
  - config/nvidia.bst
