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

  neovim = {
    lamdy = import ./neovim;
    modz = [ "pkgs" ];
  };

  nerd-fonts = {
    lamdy = import ./nerd-fonts;
    modz = [ "pkgs" ];
    self = null;
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

  nixpkgs-fmt = {
    lamdy = import ./nixpkgs-fmt;
    modz = [ "pkdjz" ];
  };

  nix-dev = {
    lamdy = import ./nix.nix;
    modz = [ "pkgs" "pkdjz" ];
    self = hob.nix.maisiliym.dev;
  };

  rnix-lsp = {
    lamdy = import ./rnix-lsp;
    modz = [ "pkdjz" ];
  };

  rust-analyzer = {
    lamdy = import ./rust-analyzer;
    modz = [ "pkgs" "pkdjz" ];
  };

  toFormat = {
    lamdy = import ./toFormat;
    modz = [ "pkgs" "uyrld" ];
    self = null;
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

  vimPloginz = {
    lamdy = import ./vimPloginz;
    modz = [ "pkgs" "pkdjz" "hob" ];
    self = null;
  };

  zoxide = {
    lamdy = import ./zoxide;
    modz = [ "pkdjz" ];
  };

}
