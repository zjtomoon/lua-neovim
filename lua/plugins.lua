return require('packer').startup(
  {
    function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -------------------------- plugins -------------------------------------------

    -- nvim-tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
    }
    -- bufferline
    use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons'
    }
    -- nvim-autopairs
    use 'windwp/nvim-autopairs'
    -------------------------- lsp -------------------------------------------

    -- lspconfig
    -- use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}

    use {'neovim/nvim-lspconfig'}
    -- Mason
    use { "williamboman/mason.nvim" }

    -- Null-ls
    use { "jose-elias-alvarez/null-ls.nvim" }

    -- Require ["williamboman/mason.nvim"]
    -- Bridge mason/lspconfig
    use { "williamboman/mason-lspconfig.nvim" }

    -- Require ["williamboman/mason.nvim"]
    -- Bridge mason/null-ls
    use { "jayp0521/mason-null-ls.nvim" }

    -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
    use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
    use 'hrsh7th/cmp-path'     -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
    use 'hrsh7th/nvim-cmp'
    -- vsnip
    use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    -- lspkind
    use 'onsails/lspkind-nvim'

    --------------------------- colorscheme ------------------------------------

    -- gruvbox
    use {
      "ellisonleao/gruvbox.nvim",
      requires = {"rktjmp/lush.nvim"}
    }
    -- zephyr
    use 'glepnir/zephyr-nvim'
    -- nord
    use 'shaunsingh/nord.nvim'
    -- onedark
    use 'ful1e5/onedark.nvim'
    ------------------------------------
    --
    -- which-key
    use 'folke/which-key.nvim'

    -- telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- surround
    use "ur4ltz/surround.nvim"

    -- nvim-coloizer
    use 'norcalli/nvim-colorizer.lua'

     -- Comment
    use 'numToStr/Comment.nvim'

    -- rust-tools
    use 'simrat39/rust-tools.nvim'

    --vim-startify
    use 'mhinz/vim-startify'

    use 'vim-airline/vim-airline'
    use 'powerline/powerline'
    use 'luochen1990/rainbow'
    --vim-go
    --use 'fatih/vim-go'


    end,
        config = {
      max_jobs = 16,
      git = {
        --修改这里可以切换加速的节点
        --default_url_format = "https://github.com.cnpmjs.org/%s"
        --default_url_format = "https://gitcode.net/mirrors/%s"
      },
      display = {
        open_fn = function()
          return require("packer.util").float({border = "single"})
        end
      }
    }
  }
)

