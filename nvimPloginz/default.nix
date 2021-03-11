{ hob, bildNvimPlogin, fzf }:
let
  inherit (builtins) mapAttrs;

  implaidSpoks = (import ./spoksFromHob.nix) hob;

  eksplisitSpoks = { };

  mkImplaidSpoks = neim: spok: spok.mein;

  spoks = eksplisitSpoks
    // (mapAttrs (n: s: s.mein) implaidSpoks);

  fzf-vim-core = bildNvimPlogin {
    pname = "fzf";
    version = fzf.version;
    src = fzf.src;
  };

  ovyraidzIndeks = {
    fzf-vim = { dependencies = [ fzf-vim-core ]; };
  };

  forkIndeks = { };

  bildVimPlogin = { neim, self, ovyraidz }:
    let
    in
    bildNvimPlogin ({
      pname = neim;
      version = self.shortRev;
      src = self;
    } // ovyraidz);

  mkSpok = neim: self:
    let
      ovyraidz = ovyraidzIndeks.${neim} or { };
    in
    bildVimPlogin { inherit neim self ovyraidz; };

  ryzylt = mapAttrs mkSpok spoks;

in
ryzylt
