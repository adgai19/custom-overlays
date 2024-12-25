inputs :final: prev: {
  hello-script = prev.writeShellScriptBin "hello" "echo Hello World!";

  customTmuxPlugins = {
    tokyonight = prev.tmuxPlugins.mkTmuxPlugin {
      name = "tokyo-night-tmux";
      pluginName = "tokyo-night-tmux";
      rtpFilePath = "tokyo-night.tmux";
      src = inputs.tokyonight-tmux;
    };
    base16-tmux = prev.tmuxPlugins.mkTmuxPlugin {
      name = "base16-tmux";
      pluginName = "base16-tmux";
      rtpFilePath = "base16-tmux";
      src = inputs.base16-tmux;
    };
  };
  customFonts = {
    Lilix = prev.prev.stdenv.mkDerivation {
      pname = "Lilex";
      version = "2.200";

      src = prev.prev.fetchzip {
        url = "https://github.com/mishamyrt/Lilex/releases/download/2.200/Lilex.zip";
        sha256 = "sha256-MPQfqCMFMjcAlMos1o4bC+I+cvQYwr2TjI4Q03QeuaQ=";
        stripRoot = false;
      };

      installPhase = ''
        mkdir -p $out/share/fonts/ttf
        mv ttf/*.ttf $out/share/fonts/ttf
      '';
    };
  };

  customPkgs = with prev;{
    inherit (system) ageEnc ageDec ageFile battery json2struct;
  };

  customVimPlugins = {
    inc-rename-nvim = prev.vimUtils.buildVimPlugin {
      name = "inc-rename.nvim";
      src = inputs.inc-rename;
    };
    harpoon-nvim = prev.vimUtils.buildVimPlugin {
      name = "harpoon-nvim";
      src = inputs.harpoon-nvim;
    };
    vim-base64 = prev.vimUtils.buildVimPlugin {
      name = "vim-base64";
      src = inputs.vim-base64;
    };

    cyclist-nvim = prev.vimUtils.buildVimPlugin {
      name = "cyclist.vim";
      src = inputs.cyclist-nvim;
    };
    typescript-nvim = prev.vimUtils.buildVimPlugin {
      name = "typescript.nvim";
      doCheck = false;
      doInstallCheck = false;
      src = inputs.typescript-nvim;
    };
    autosave-nvim = prev.vimUtils.buildVimPlugin {
      name = "autosave.nvim";
      src = inputs.autosave-nvim;
    };

    astro-vim = prev.vimUtils.buildVimPlugin {
      name = "vim-astro";
      src = inputs.astro-vim;
    };

    go-nvim = prev.vimUtils.buildVimPlugin {
      name = "go-nvim";
      src = inputs.go-nvim;
    };

    regexplainer = prev.vimUtils.buildVimPlugin {
      name = "nvim-regexplainer";
      src = inputs.regexplainer;
    };
    guihua-lua = prev.vimUtils.buildVimPlugin {
      name = "guihua-lua";
      src = inputs.guihua-nvim;
    };
    nvim-dap-go = prev.vimUtils.buildVimPlugin {
      name = "nvim-dap-go";
      src = inputs.nvim-dap-go;
    };
    vim-sops = prev.vimUtils.buildVimPlugin {
      name = "vim-sops";
      src = inputs.vim-sops;
    };

    vim-just = prev.vimUtils.buildVimPlugin {
      name = "vim-just";
      src = inputs.vim-just;
    };

    noice-nvim = prev.vimUtils.buildVimPlugin {
      name = "noice-nvim";
      src = inputs.noice-nvim;
    };

    statuscol-nvim = prev.vimUtils.buildVimPlugin {
      name = "statuscol-nvim";
      src = inputs.statuscol-nvim;
    };

    treesitter-just = prev.vimUtils.buildVimPlugin {
      name = "treesitter-just";
      src = inputs.treesitter-just;
    };

    hover-nvim = prev.vimUtils.buildVimPlugin {
      name = "hover-nvim";
      src = inputs.hover-nvim;
    };

    jester = prev.vimUtils.buildVimPlugin {
      name = "jester";
      src = inputs.jester;
    };

    neotest-jest = prev.vimUtils.buildVimPlugin {
      name = "neotest-jest";
      src = inputs.neotest-jest;
    };

    dap-vscode = prev.vimUtils.buildVimPlugin {
      name = "dap-vscode";
      src = inputs.dap-vscode;
    };

    treesj = prev.vimUtils.buildVimPlugin {
      name = "treesj";
      src = inputs.treesj;
    };

    qmk-nvim = prev.vimUtils.buildVimPlugin {
      name = "qmk-nvim";
      src = inputs.qmk-nvim;
    };

    nvim-cmp = prev.vimUtils.buildVimPlugin {
      name = "nvim-cmp";
      src = inputs.nvim-cmp;
    };

    adgai-config = prev.vimUtils.buildVimPlugin {
      name = "adgai";
      src = ./config/nvim-config;
    };
  };
}
