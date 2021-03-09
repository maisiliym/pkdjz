{ hob, vimUtils, fzf }:
let
  inherit (builtins) mapAttrs;
  inherit (vimUtils) buildVimPluginFrom2Nix;

  implaidSpoks = {
    inherit (hob) astronauta-nvim barbar-nvim bufferize-vim BufOnly-nvim
      completion-nvim completion-buffers dwm-vim express_line-nvim formatter-nvim
      FTerm-nvim fzf-lsp-nvim fzf-vim galaxyline-nvim gina-vim gitsigns-nvim
      hop-nvim kommentary lspsaga-nvim lsp-status-nvim nvim-autopairs
      nvim-base16-lua nvim-bufferline-lua nvim-colorizer-lua nvim-fzf
      nvim-fzf-commands nvim-lazygit nvim-lspconfig nvim-lspfuzzy nvim-treesitter
      nvim-treesitter-context nvim-treesitter-refactor
      nvim-treesitter-textobjects nvim-tree-lua nvim-web-devicons lir-nvim neogit
      plenary-nvim popup-nvim ron-vim telescope-nvim tokei-vim vim-visual-multi
      zoxide-vim;
  };

  eksplisitSpoks = { };

  mkImplaidSpoks = neim: spok: spok.mein;

  spoks = eksplisitSpoks
    // (mapAttrs (n: s: s.mein) implaidSpoks);

  fzf-vim-core = buildVimPluginFrom2Nix {
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
    buildVimPluginFrom2Nix ({
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
