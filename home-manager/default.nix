{ self, lib, pkgs, hob }:
let
  nixpkgs = hob.nixpkgs.mein;
  hm = import (self + /modules/lib) { inherit lib; };

  extendedLib = import (self + /modules/lib/stdlib-extended.nix) lib;

  modulesList = import ./modulesList.nix;

  joinModulePath = path: self + /modules + (builtins.toString path);

  homeModules = map joinModulePath modulesList;

  argsModule = {
    config = {
      lib = extendedLib.hm;
      _module.args = {
        inherit pkgs;
        lib = extendedLib;
      };
    };
  };

  modules = homeModules ++ [
    argsModule
    (nixpkgs + /nixos/modules/misc/assertions.nix)
    (nixpkgs + /nixos/modules/misc/meta.nix)
  ];

in
{ inherit modules extendedLib; }
