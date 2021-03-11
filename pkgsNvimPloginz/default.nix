{ self, kor, lib, pkgs, bildNvimPlogin }:
let
  inherit (kor) mkLamdy;

  nullDarwinPkgs = {
    Cocoa = null;
    CoreFoundation = null;
    CoreServices = null;
  };

  ovyridynPkgs = pkgs
    // { buildVimPluginFrom2Nix = bildNvimPlogin; }
    // nullDarwinPkgs;

  basePath = (self + /pkgs/misc/vim-plugins);
  overridesLamdy = import (self + /pkgs/misc/vim-plugins/overrides.nix);

  overrides = mkLamdy {
    lamdy = overridesLamdy;
    klozyr = ovyridynPkgs;
  };

  lamdy = import (self + /pkgs/misc/vim-plugins/generated.nix);

  klozyr = ovyridynPkgs //
    { inherit overrides; };

in
mkLamdy {
  inherit lamdy klozyr;
}
