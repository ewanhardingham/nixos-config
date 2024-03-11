{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    enable = true;

    colorschemes.ayu.enable = true;

    globals.mapleader = " ";
    globals.maplocalleader = " ";

    # nixvim abscent plugins: tpope/vim-sleuth

    plugins = {
      comment-nvim.enable = true;
      fidget.enable = true;
      luasnip.enable = true;
      todo-comments = {
        enable = true;
	signs = false;
      };
      treesitter = {
        enable = true;
	indent = true;
      };
      conform-nvim = {
        enable = true;
	notifyOnError = false;
	formatOnSave = {
	  timeoutMs = 500;
	  lspFallback = true;
	};
	formattersByFt = {
	  lua = [ "stylua" ];
	};
      };
      lsp = {
        enable = true;
	servers = {
	  bashls.enable = true;
	  lua-ls.enable = true;
	  dockerls.enable = true;
	  nixd.enable = true;
	  rust-analyzer = {
	    enable = true;
	    installRustc = true;
	    installCargo = true;
	  };
	  yamlls.enable = true;
	};
	keymaps = {
	  lspBuf = {
	    "<leader>rn" = {
	      action = "rename";
	      desc = "[R]e[n]ame";
	    };
	    "<leader>ca" = {
	      action = "code_action";
	      desc = "[C]ode [A]ction";
	    };
	    "K" = {
	      action = "hover";
	      desc = "Hover Documentation";
	    };
	    "gD" = {
	      action = "declaration";
	      desc = "[G]oto [D]eclaration";
	    };
	  };
	};
      };
      cmp = {
        enable = true;
	settings = {
	  snippet = {
	    expand = "luasnip";
	  };
	  mapping = {
	    __raw = ''
	      cmp.mapping.preset.insert({
	        ['<C-n>'] = cmp.mapping.select_next_item(),
	        ['<C-p>'] = cmp.mapping.select_prev_item(),
	        ['<C-y>'] = cmp.mapping.confirm { select = true },
	        ['<C-space>'] = cmp.mapping.complete {},
		['<C-l>'] = cmp.mapping(function()
                  if luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                  end
                end, { 'i', 's' }),
                ['<C-h>'] = cmp.mapping(function()
                  if luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                  end
                end, { 'i', 's' }),
	      })
	    '';
	  };
	};
      };
      cmp_luasnip.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      gitsigns = {
        enable = true;
	signs = {
          add.text = "+";
	  change.text = "~";
	  delete.text = "_";
	  topdelete.text = "-";
	  changedelete.text = "~";
	};
      };
      which-key = {
        enable = true;
	registrations = {
	 "<leader>c" = { name = "[C]ode"; _ = "which_key_ignore"; };
	 "<leader>d" = { name = "[D]ocument"; _ = "which_key_ignore"; };
	 "<leader>r" = { name = "[R]ename"; _ = "which_key_ignore"; };
	 "<leader>s" = { name = "[S]earch"; _ = "which_key_ignore"; };
	 "<leader>w" = { name = "[W]orkspace"; _ = "which_key_ignore"; };
	};
      };
      telescope = {
        enable = true;
	extensions = {
	  fzf-native.enable = true;
	  ui-select.enable = true; 
	};
	keymaps = {
	  "<leader>sh" = {
	    action = "help_tags";
	    desc = "[S]earch [H]elp";
	  };
	  "<leader>sk" = {
	    action = "keymaps";
	    desc = "[S]earch [K]eymaps";
	  };
	  "<leader>sf" = {
	    action = "find_files";
	    desc = "[S]earch [F]iles";
	  };
	  "<leader>ss" = {
	    action = "builtin";
	    desc = "[S]earch [S]elect Telescope";
	  };
	  "<leader>sw" = {
	    action = "grep_string";
	    desc = "[S]earch current [W]ord";
	  };
	  "<leader>sg" = {
	    action = "live_grep";
	    desc = "[S]earch by [G]rep";
	  };
	  "<leader>sd" = {
	    action = "diagnostics";
	    desc = "[S]earch [D]iagnostics";
	  };
	  "<leader>sr" = {
	    action = "resume";
	    desc = "[S]earch [R]esume";
	  };
	  "<leader>s." = {
	    action = "oldfiles";
	    desc = "[S]earch Recent Files ('.' for repeat)";
	  };
	  "<leader><leader>" = {
	    action = "buffers";
	    desc = "[ ] Find existing buffers";
	  };
	  "gd" = {
	    action = "lsp_definitions";
	    desc = "[G]oto [D]efinition";
	  };
	  "gr" = {
	    action = "lsp_references";
	    desc = "[G]oto [R]eferences";
	  };
	  "gI" = {
	    action = "lsp_implementations";
	    desc = "[G]oto [I]mplementations";
	  };
	  "<leader>D" = {
	    action = "lsp_type_definitions";
	    desc = "Type [D]efinitions";
	  };
	  "<leader>ds" = {
	    action = "lsp_document_symbols";
	    desc = "[D]ocument [S]ymbols";
	  };
	  "<leader>ws" = {
	    action = "lsp_dynamic_workspace_symbols";
	    desc = "[W]orkspace [S]ymbols";
	  };
	};
      };
      mini = {
        enable = true;
	modules = {
	  ai = {
            n_lines = 500;
	  };
	  surround = { };
	  statusline = {
	    use_icons = true;
	  };
	};
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      plenary-nvim
    ];

    options = {
      number = true;
      mouse = "a";
      showmode = false;
      clipboard = "unnamedplus";
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      list = true;
      listchars = { 
        tab = "» "; 
        trail = "·"; 
        nbsp = "␣"; 
      };
      inccommand = "split";
      cursorline = true;
      scrolloff = 10;
      hlsearch = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<Esc>";
	action = "<cmd>nohlsearch<CR>";
      }
      {
        mode = "n";
        key = "[d";
	action = "vim.diagnostic.goto_prev";
	lua = true;
	options.desc = "Go to previous [D]iagnostic message";
      }
      {
        mode = "n";
        key = "]d";
	action = "vim.diagnostic.goto_next";
	lua = true;
	options.desc = "Go to next [D]iagnostic message";
      }
      {
        mode = "n";
        key = "<leader>e";
	action = "vim.diagnostic.open_float";
	lua = true;
	options.desc = "Show diagnostic [E]rror messages";
      }
      {
        mode = "n";
        key = "<leader>q";
	action = "vim.diagnostic.setloclist";
	lua = true;
	options.desc = "Go to previous [D]iagnostic message";
      }
      {
        mode = "t";
        key = "<Esc><Esc>";
	action = "<C-\\><C-n>";
	options.desc = "Exit terminal mode";
      }
      {
        mode = "n";
        key = "<C-h>";
	action = "<C-w><C-h>";
	options.desc = "Move focus to left window";
      }
      {
        mode = "n";
        key = "<C-l>";
	action = "<C-w><C-l>";
	options.desc = "Move focus to right window";
      }
      {
        mode = "n";
        key = "<C-j>";
	action = "<C-w><C-j>";
	options.desc = "Move focus to lower window";
      }
      {
        mode = "n";
        key = "<C-k>";
	action = "<C-w><C-k>";
	options.desc = "Move focus to top window";
      }
    ];

    autoGroups = {
      kickstart-highlight-yank.clear = true;
    };

    autoCmd = [
      {
        event = [ "TextYankPost" ];
        group = "kickstart-highlight-yank";
        callback = {__raw = "function() vim.highlight.on_yank() end";};
      }
    ];
  };
}
