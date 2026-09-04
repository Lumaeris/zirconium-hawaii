kind: make

sandbox:
  build-uid: 1000
  build-gid: 1000

# go modules are loaded here
(@):
- elements/include/dms-shell.yml

sources:
  (>):
  - kind: git_repo
    url: github:AvengeMedia/DankMaterialShell.git
    track: 'v*.*.*'
    ref: v1.5.3-0-g069ddab041c738236a8910e4c39b65d9628d3018
  - kind: local
    path: files/dms-shell

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/git.bst
- deps/go-1.26.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- desktop/quickshell.bst
- deps/qt6-qtmultimedia.bst

runtime-depends:
- cli/cava.bst
- deps/dgop.bst
- deps/kimageformats.bst
- desktop/brightnessctl.bst
- desktop/danksearch.bst
- desktop/ddcutil.bst
- desktop/matugen.bst
- freedesktop-sdk.bst:components/libnotify.bst
- gnome-build-meta.bst:core-deps/accountsservice.bst
- gnome-build-meta.bst:core-deps/cups-pk-helper.bst

variables:
  make-args: build BUILD_TIME=2011-11-10_15:00:00

config:
  configure-commands:
  - |
    # Modify dms-greeter to use /usr/share/quickshell/dms instead of /usr/share/quickshell/dms-greeter, since we are not
    # going to install dms into /usr/share/quickshell/dms-greeter.
    sed -i 's/^DMS_PATH="dms-greeter"$/DMS_PATH="dms"/;s/default: dms-greeter)$/default: dms)/' quickshell/Modules/Greetd/assets/dms-greeter
  build-commands:
  - |
    if git describe --tag --exact-match &>/dev/null; then
      %{make} VERSION="$(git describe --tag)"
    else
      %{make}
    fi
  install-commands:
  - |
    install -dm0755 "%{install-root}%{datadir}/bash-completion/completions"
    install -dm0755 "%{install-root}%{datadir}/zsh/site-functions"
    install -dm0755 "%{install-root}%{datadir}/fish/vendor_completions.d"

    ./core/bin/dms completion bash > "%{install-root}%{datadir}/bash-completion/completions/dms"
    ./core/bin/dms completion zsh > "%{install-root}%{datadir}/zsh/site-functions/_dms"
    ./core/bin/dms completion fish > "%{install-root}%{datadir}/fish/vendor_completions.d/dms.fish"

    install -Dm0755 ./core/bin/dms "%{install-root}%{bindir}/dms"
    install -dm0755 "%{install-root}%{datadir}/quickshell/dms"
    cp -r "quickshell/./" "%{install-root}%{datadir}/quickshell/dms"
    install -Dpm0644 -t "%{install-root}%{sysconfdir}/pam.d/" quickshell/assets/pam/fprint
    install -Dpm0644 -t "%{install-root}%{sysconfdir}/pam.d/" quickshell/assets/pam/u2f
    install -Dm0644 -t "%{install-root}%{prefix}/lib/systemd/user/" assets/systemd/dms.service

    # dms-greeter
    install -Dm0755 "quickshell/Modules/Greetd/assets/dms-greeter" -t "%{install-root}%{bindir}"
    install -Dm0644 "quickshell/systemd/tmpfiles-dms-greeter.conf" "%{install-root}%{indep-libdir}/tmpfiles.d/dms-greeter.conf"
    install -Dm0644 "quickshell/systemd/sysusers-dms-greeter.conf" "%{install-root}%{indep-libdir}/sysusers.d/dms-greeter.conf"
  - |
    install -Dm0644 greetd.toml "%{install-root}%{sysconfdir}/greetd/config.toml"
  - |
    %{install-extra}
