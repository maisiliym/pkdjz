hob:
{
  alacritty = {
    lamdy = import ./alacritty;
    modz = [ "pkgs" "pkdjz" ];
  };

  crate2nix = {
    lamdy = import ./crate2nix;
    modz = [ "pkdjz" ];
  };

  dino = {
    lamdy = import ./dino;
    modz = [ "pkgs" ];
  };

  dunst = {
    lamdy = import ./dunst;
    modz = [ "pkgs" ];
  };

  fzf = {
    lamdy = import ./fzf;
    modz = [ "pkgs" ];
  };

  home-manager = {
    lamdy = import ./home-manager;
    modz = [ "lib" "pkgs" "hob" ];
  };

  kreitOvyraidz = {
    lamdy = import ./kreitOvyraidz;
    modz = [ "pkgs" "lib" ];
  };

  lowdown = {
    lamdy = import ./lowdown;
    modz = [ "pkgs" ];
  };

  LuaFormatter = {
    lamdy = import ./LuaFormatter;
    modz = [ "pkgs" ];
  };

  lua-language-server = {
    lamdy = import ./lua-language-server;
    modz = [ "pkgs" ];
  };

  mkCargoNix = {
    lamdy = import ./mkCargoNix;
    modz = [ "pkgs" "lib" "pkdjz" ];
    self = null;
  };

  naersk = {
    lamdy = import ./naersk;
    modz = [ "pkgs" ];
  };

  neovim = {
    lamdy = import ./neovim;
    modz = [ "pkdjz" "pkgs" ];
  };

  nerd-fonts = {
    lamdy = import ./nerd-fonts;
    modz = [ "pkgs" ];
    self = null;
  };

  nightlyRust = {
    lamdy = import ./nightlyRust;
    modz = [ "mozPkgs" ];
    self = null;
  };

  nix = {
    lamdy = import ./nix;
    modz = [ "pkgs" "pkdjz" ];
  };

  nixpkgs-fmt = {
    lamdy = import ./nixpkgs-fmt;
    modz = [ "pkdjz" ];
  };

  nix-dev = {
    lamdy = import ./nix;
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
