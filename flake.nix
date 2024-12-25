{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
    rustaceanvim = {
      url = "github:mrcjkb/rustaceanvim/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vim-sops = {
      url = "github:jsecchiero/vim-sops";
      flake = false;
    };
    harpoon-nvim = {
      url = "github:ThePrimeagen/harpoon?ref=harpoon2";
      flake = false;
    };

    stylix.url = "github:danth/stylix";
    nixpkgs-unstable = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    nixpkgs-unstable-small = { url = "github:nixos/nixpkgs/nixos-unstable-small"; };

    nixpkgs-stable = { url = "github:NixOS/nixpkgs/nixos-24.05"; };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-overlay = {
      url = "github:mozilla/nixpkgs-mozilla";
    };
    firefox-nightly = {
      url = "github:nix-community/flake-firefox-nightly";
    };

    tokyonight-tmux = {
      url = "github:janoamaral/tokyo-night-tmux";
      flake = false;
    };

    base16-tmux = {
      url = "github:tinted-theming/base16-tmux";
      flake = false;
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # some plugins that I track outside of nixpkgs
    inc-rename = {
      url = "github:smjonas/inc-rename.nvim";
      flake = false;
    };

    vim-just = {
      url = "github:NoahTheDuke/vim-just";
      flake = false;
    };

    treesitter-just = {
      url = "github:IndianBoy42/tree-sitter-just";
      flake = false;
    };
    regexplainer = {
      url = "github:bennypowers/nvim-regexplainer";
      flake = false;
    };

    nvim-cmp = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };

    go-nvim = {
      url = "github:ray-x/go.nvim";
      flake = false;
    };

    guihua-nvim = {
      url = "github:ray-x/guihua.lua";
      flake = false;
    };

    astro-vim = {
      url = "github:wuelnerdotexe/vim-astro";
      flake = false;
    };

    cyclist-nvim = {
      url = "github:tjdevries/cyclist.vim";
      flake = false;
    };

    neorg-overlay.url = "github:nvim-neorg/nixpkgs-neorg-overlay";
    autosave-nvim = {
      url = "github:Pocco81/auto-save.nvim";
      flake = false;
    };

    typescript-nvim = {
      url = "github:jose-elias-alvarez/typescript.nvim";
      flake = false;
    };

    noice-nvim = {
      url = "github:folke/noice.nvim";
      flake = false;
    };

    nvim-dap-go = {
      url = "github:leoluz/nvim-dap-go";
      flake = false;
    };

    statuscol-nvim = {
      url = "github:luukvbaal/statuscol.nvim";
      flake = false;
    };

    hover-nvim = {
      url = "github:lewis6991/hover.nvim";
      flake = false;
    };

    jester = {
      url = "github:David-Kunz/jester";
      flake = false;
    };

    neotest-jest = {
      url = "github:haydenmeade/neotest-jest";
      flake = false;
    };

    dap-vscode = {
      url = "github:mxsdev/nvim-dap-vscode-js";
      flake = false;
    };

    treesj = {
      url = "github:Wansmer/treesj";
      flake = false;
    };
    vim-base64 = {
      url = "github:christianrondeau/vim-base64";
      flake = false;
    };

    qmk-nvim = {
      url = "github:codethread/qmk.nvim";
      flake = false;
    };

    json2struct = {
      url = "github:marhaupe/json2struct";
      flake = false;
    };

    bumblebee-status = {
      url = "github:tobi-wan-kenobi/bumblebee-status";
      flake = false;
    };

    wezterm = {
      url = "github:wez/wezterm/main?dir=nix";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        # To import a flake module
        # 1. Add foo to inputs
        # 2. Add foo as a parameter to the outputs function
        # 3. Add here: foo.flakeModule

      ];
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        # Per-system attributes can be defined here. The self' and inputs'
        # module parameters provide easy access to attributes of the same
        # system.

        # Equivalent to  inputs'.nixpkgs.legacyPackages.hello;
_module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ inputs.self.overlays.default ];
        config = { };
      };
        packages.default = pkgs.hello;
      };
      flake = {
        # The usual flake attributes can be defined here, including system-
        # agnostic ones like nixosModule and system-enumerating ones, although
        # those are more easily expressed in perSystem.
      overlays.default = import ./overlays.nix inputs;

      };
    };
}
