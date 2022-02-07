"===
"=== Editor config
"===
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
"set list
syntax on
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030
set number
set relativenumber
set cursorline
set backspace=indent,eol,start
set splitbelow
set splitright
set wrap
set showcmd
set wildmenu
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set hlsearch
exec "nohlsearch"
set incsearch
"ignore uppercase and lowercase
set ignorecase
set smartcase
set completeopt=longest,noinsert,menuone,noselect,preview
set previewheight=5
set scrolloff=5

" ===
" " === Terminal Behaviors
" " ===
 let g:neoterm_autoscroll = 1
 tnoremap <C-N> <C-\><C-N>
 tnoremap <C-O> <C-\><C-N><C-O>
 let g:terminal_color_0  = '#000000'
 let g:terminal_color_1  = '#FF5555'
 let g:terminal_color_2  = '#50FA7B'
 let g:terminal_color_3  = '#F1FA8C'
 let g:terminal_color_4  = '#BD93F9'
 let g:terminal_color_5  = '#FF79C6'
 let g:terminal_color_6  = '#8BE9FD'
 let g:terminal_color_7  = '#BFBFBF'
 let g:terminal_color_8  = '#4D4D4D'
 let g:terminal_color_9  = '#FF6E67'
 let g:terminal_color_10 = '#5AF78E'
 let g:terminal_color_11 = '#F4F99D'
 let g:terminal_color_12 = '#CAA9FA'
 let g:terminal_color_13 = '#FF92D0'
 let g:terminal_color_14 = '#9AEDFE'

"rainbow brackets
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

noremap R :call CompileRun()<CR>
function CompileRun()
		exec "w"
		if &filetype == 'c'
			exec "!g++ % -o %<"
			:sp
			:term ./%<
		elseif &filetype == 'cpp'
			exec "!g++ % -wall -o %<"
			:sp
			:term ./%<
		elseif &filetype == 'sh'
			:!time bash %
		elseif &filetype == 'go'
			set splitbelow
			:sp
			:term go run .
		elseif &filetype == 'rust'
			set splitbelow
			:sp
			:term cargo run .
    elseif &filetype == 'typescript'
      set splitbelow
      :sp 
      :term ts-node %
    elseif &filetype == 'lua'
      set splitbelow
      :sp 
      :term lua %
    elseif &filetype == 'python'
      set splitbelow
      :sp
      :term python %
		endif
endfunction

"
"===
"=== keymap
"===
let g:mapleader=" "
map s <nop>
map S :w<CR>
map Q :q<CR>
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
"move between splited windows
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
"switch between the labels
map tb :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

"change the size of splited window
map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><left> :vertical resize -5<CR>
map <LEADER><right> :vertical resize+5<CR>
"down-search and up-serch
noremap = nzz
noremap - Nzz
nmap <LEADER>t :sp<CR> :term<CR>
nmap tt :NvimTreeOpen<CR>
nmap bc <C-o>

" lua配置
" 基础配置
lua require('basic')
" Packer 插件管理
lua require('plugins')

"主题设置
set background=dark " or light if you want light mode
colorscheme onedark

"插件配置
lua require('plugin-config/nvim-tree')
lua require('plugin-config/bufferline')
lua require('plugin-config/telescope')
lua require('plugin-config/nvim-autopairs')
lua require('plugin-config/surround')
lua require('plugin-config/comment')
lua require('plugin-config/nvim-colorizer')
lua require('plugin-config/which-key')
lua require('plugin-config/rust-tools')

"lsp config
lua require('lsp/setup')
lua require('lsp/nvim-cmp')
lua require('lsp/ui')


