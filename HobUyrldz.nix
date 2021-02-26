hob:
{
  alacritty = {
    lamdy = import ./alacritty.nix;
    modz = [ "pkgs" "pkdjz" ];
  };

  dino = {
    lamdy = import ./dino.nix;
    modz = [ "pkgs" ];
  };

  dunst = {
    lamdy = import ./dunst.nix;
    modz = [ "pkgs" ];
  };

  fzf = {
    lamdy = import ./fzf.nix;
    modz = [ "pkgs" ];
  };

  home-manager = {
    lamdy = import ./home-manager;
    modz = [ "lib" "pkgs" "hob" ];
  };

  kreitOvyraidz = {
    lamdy = import ./kreitOvyraidz.nix;
    modz = [ "pkgs" "lib" ];
  };

  lowdown = {
    lamdy = import ./lowdown.nix;
    modz = [ "pkgs" ];
  };

  mkCargoNix = {
    lamdy = import ./mkCargoNix.nix;
    modz = [ "pkgs" "lib" "pkdjz" ];
    self = null;
  };

  naersk = {
    lamdy = import ./naersk.nix;
    modz = [ "pkgs" ];
  };

  nightlyRust = {
    lamdy = import ./nightlyRust.nix;
    modz = [ "mozPkgs" ];
    self = null;
  };

  nix = {
    lamdy = import ./nix.nix;
    modz = [ "pkgs" "pkdjz" ];
  };

  nix-dev = {
    lamdy = import ./nix.nix;
    modz = [ "pkgs" "pkdjz" ];
    self = hob.nix.maisiliym.dev;
  };

  tree-sitter = {
    lamdy = import ./tree-sitter;
    modz = [ "pkgs" "pkdjz" ];
  };

  tree-sitter-parsers = {
    lamdy = import ./tree-sitter/parsers.nix;
    modz = [ "pkgs" "pkdjz" "hob" ];
    self = null;
  };

  zoxide = {
    lamdy = import ./zoxide;
    modz = [ "pkdjz" ];
  };

}
