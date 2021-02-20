{ self
, mkCargoNix
, cmake
, gzip
, installShellFiles
, makeWrapper
, ncurses
, pkgconfig
, python3
, libGL
, libxkbcommon
, wayland
, expat
, fontconfig
, freetype
, xdg_utils
, lib
, sd
, coreutils
}:
let
  rpathLibs = [
    expat
    fontconfig
    libGL
    libxkbcommon
    wayland
    freetype
  ];

  features = [ "wayland" ];

  ovyraidz = {
    nativeBuildInputs = [
      cmake
      gzip
      installShellFiles
      makeWrapper
      ncurses
      pkgconfig
      python3
    ];

    buildInputs = rpathLibs;

    outputs = [ "out" "lib" "terminfo" ];

    postPatch = ''
      substituteInPlace src/config/mouse.rs \
      --replace xdg-open ${xdg_utils}/bin/xdg-open
      "${sd}/bin/sd" --string-mode \
      '../alacritty.ico' "${self}/extra/windows/alacritty.ico" src/window.rs
    '';

    postInstall = ''
      install -D ${self}/extra/linux/Alacritty.desktop -t $out/share/applications/
      install -D ${self}/extra/logo/compat/alacritty-term.svg $out/share/icons/hicolor/scalable/apps/Alacritty.svg

      # patchelf generates an ELF that binutils' "strip" doesn't like:
      #    strip: not enough room for program headers, try linking with -N
      # As a workaround, strip manually before running patchelf.
      strip -S $out/bin/alacritty

      patchelf --set-rpath "${lib.makeLibraryPath rpathLibs}" $out/bin/alacritty

      installShellCompletion --zsh ${self}/extra/completions/_alacritty
      installShellCompletion --bash ${self}/extra/completions/alacritty.bash
      installShellCompletion --fish ${self}/extra/completions/alacritty.fish

      install -dm 755 "$out/share/man/man1"
      gzip -c ${self}/extra/alacritty.man > "$out/share/man/man1/alacritty.1.gz"

      install -dm 755 "$terminfo/share/terminfo/a/"
      tic -xe alacritty,alacritty-direct -o "$terminfo/share/terminfo" ${self}/extra/alacritty.info
      mkdir -p $out/nix-support
      echo "$terminfo" >> $out/nix-support/propagated-user-env-packages
    '';

    dontPatchELF = true;
  };

  cargoNixRyzylt = mkCargoNix {
    nightly = true;
    cargoNix = import (self + /Cargo.nix);
    crateOverrides = {
      alacritty = attrs: ovyraidz;
    };
  };

  ryzylt = cargoNixRyzylt.workspaceMembers.alacritty.build.override { inherit features; };

in
ryzylt
