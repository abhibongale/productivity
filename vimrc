" User Interface Options
set number " set number line 
syntax on " syntax highlighting displays the source code in different colors
set titlestring=%t " to specify a new title for your Vim window
set title " the command to set this new title
set ruler " to display the cursor’s current position in the Vim
set confirm " the confirm option, the Vim displays the confirmation dialog asking if you want to save the file.
colorscheme torte " set theme
set background=dark " use colors that suit a dark background.
set noerrorbells " Disable beep on errors.
set visualbell " Flash the screen instead of beeping on errors.


" Miscellaneous options
set spell "  enable spell checking
set noswapfile " create no swap file


" Indention Options
set autoindent " New lines inherit the indentation of previous lines.
set shiftwidth=4 " When shifting, indent using four spaces.
set smarttab " Insert “tabstop” number of spaces when the “tab” key is pressed.
set tabstop=4 " Indent using four spaces


" Performance Options
set lazyredraw " Don’t update screen during macro and script execution.


" Search Options
set ignorecase " Ignore case when searching.
set hlsearch " Enable search highlighting.
set smartcase " Automatically switch search to case-sensitive when search query contains an uppercase letter.


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" - To install use 'PlugInstall' and to update use 'Plug Update'
call plug#begin('~/.vim/plugged')

" VimTeX is a modern Vim and Neovim filetype and syntax plugin for LaTeX files.
Plug 'lervag/vimtex'
" syntax highlighting and filetype plugins for Markdown
Plug 'tpope/vim-markdown'
" provides automatic closing of quotes, parenthesis, brackets, etc.
Plug 'raimondi/delimitmate'
" A code completion engine 
Plug 'valloric/youcompleteme'
" The NERDTree is a file system explorer for the Vim editor
Plug 'scrooloose/nerdtree'
" A Vim plugin which shows a git diff in the sign column
Plug 'airblade/vim-gitgutter'
" UltiSnips is the ultimate solution for snippets in Vim
Plug 'SirVer/ultisnips'
" The plugin follows the usual bundle structure
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
call plug#end()

" vim-markdown settings
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'java'] "  enable fenced code block syntax highlighting in your markdown documents
let g:vim_markdown_math = 1 " Used as $x^2$, $$x^2$$, escapable as \$x\$ and \$\$x\$\$.

" NERDTree Settings
autocmd VimEnter * NERDTree | wincmd p " Start NERDTree and put the cursor back in the other window.
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
" Start NERDTree and put the cursor back in the other window.
    \ quit | endif

"vimtex Settings
let g:tex_flavor='latex' " global setting tex flavour
let g:vimtex_view_method='zathura' " pdf output will be viewed in zathura application
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" ultisnips settings
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.


" youcompleteme keybinding
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]

command! MakeTags !ctags -R .

autocmd BufWritePost book.md silent !sh build.sh
autocmd BufWritePost *note-*.md silent !buidNote %:p


" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" inline math
syn match math '\$[^$].\{-}\$'

" actually highlight the region we defined as "math"
hi link math Statement
