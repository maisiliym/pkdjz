uyrld@{ kor, lib, pkgs, hob, bildNvimPlogin }:
let
  inherit (kor) mkLamdy;

  ovyridynPkgs = pkgs //
    { buildVimPluginFrom2Nix = bildNvimPlogin; };

  basePath = (hob.nixpkgs.mein + /pkgs/misc/vim-plugins);
  overridesLamdy = import (basePath + /overrides.nix);

  overrides = mkLamdy {
    lamdy = overridesLamdy;
    klozyr = ovyridynPkgs;
  };

  lamdy = import (basePath + /generated.nix);

  klozyr = ovyridynPkgs //
    { inherit overrides; };

in
mkLamdy {
  inherit lamdy klozyr;
}
