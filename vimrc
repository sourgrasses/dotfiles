" plugins
call plug#begin('~/.vim/plugged')
" syntax
Plug 'rust-lang/rust.vim'
Plug 'arp242/gopher.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'rgrinberg/vim-ocaml'
Plug 'rhysd/vim-crystal'
Plug 'ziglang/zig.vim'
Plug 'https://gitlab.com/inko-lang/inko.vim.git'
Plug 'ARM9/arm-syntax-vim'
Plug 'zah/nim.vim'

" linting/semantic highlighting
Plug 'w0rp/ale'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'nvie/vim-flake8'

" ui stuff
Plug 'kien/rainbow_parentheses.vim'
Plug 'bling/vim-bufferline'
Plug 'machakann/vim-highlightedyank'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'chrisbra/Colorizer'
"Plug 'AlessandroYorba/Arcadia'

" ~practical~ plugins
Plug 'igankevich/mesonic'
Plug 'tpope/vim-vinegar'
Plug 'jremmen/vim-ripgrep'
call plug#end()

syntax on
let g:arcadia_Sunset = 1
colorscheme cosme
set termguicolors

" airline theme stuff
let g:airline_theme = 'cosme'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

set backspace=2
set nu
set tabstop=4       " set tab width to 4
set shiftwidth=4    " set indent width to 4
set softtabstop=4
set expandtab       " Expand tabs to spaces!!
set modelines=0
set nomodeline

set splitbelow      " set new horizontal splits to open below

let &t_Co=256

" set tabs to 2 spaces for crystal, ocaml, and ruby
:autocmd Filetype crystal setlocal ts=2 sw=2 expandtab
:autocmd Filetype ocaml setlocal ts=2 sw=2 expandtab
:autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" use ARM syntax for asm files
au BufNewFile,BufRead *.s,*.S set filetype=arm

set undodir=~/.vim/undos
set undofile

" nerdtree stuff
map <C-n> :NERDTreeToggle<CR>

function SemshiHighlights()
    hi semshiAttribute          ctermfg=30 guifg=#008787
    hi semshiBuiltin            ctermfg=67 guifg=#5f87af cterm=bold gui=bold
    hi semshiFree               ctermfg=125 guifg=#af005f
    hi semshiGlobal             ctermfg=96 guifg=#875f87
    hi semshiImported           ctermfg=132 guifg=#afafd7
    hi semshiParameter          ctermfg=132 guifg=#f082b9
    hi semshiParameterUnused    ctermfg=117 guifg=#f082b9 cterm=underline gui=underline
    hi semshiSelected           ctermbg=167 guibg=#d75f5f ctermfg=188 guifg=#262626
    hi semshiSelf               ctermfg=208 guifg=#ff8700
    hi semshiUnresolved         ctermfg=196 guifg=#ff0000 cterm=underline gui=underline
endfunction

" call custom highlights for semshi
:autocmd Filetype python call SemshiHighlights()

" netrw/vinegar configuration
let g:netrw_liststyle = 3
let g:netrw_browse_split = 1
let g:netrw_winsize = 25

let g:zig_fmt_autosave = 1
:autocmd Filetype zig setlocal smartindent nocindent

" configure indentline stuff
let g:indentLine_enabled = 0
let g:indentLine_color_term = 240
let g:indentLine_color_gui = "#5c6370"
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
set list

set mouse=a         " enable mouse integration stuff

" set ripgrep to 'smart case mode'
let g:rg_command = 'rg --vimgrep -S'

" linter
let g:ale_sign_column_always = 1
" only lint on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '➔'
let g:ale_set_highlights = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       '#ffaf87'],
    \ ['Darkblue',    '#5f87af'],
    \ ['darkgray',    '#8a8a8a'],
    \ ['darkgreen',   '#afffd7'],
    \ ['darkcyan',    '#a3a6ff'],
    \ ['darkred',     '#ff7878'],
    \ ['darkmagenta', '#ffc8e3'],
    \ ['brown',       '#ffaf87'],
    \ ['gray',        '#8a8a8a'],
    \ ['black',       '#8a8a8a'],
    \ ['darkmagenta', '#ffc8e3'],
    \ ['Darkblue',    '#5f87af'],
    \ ['darkgreen',   '#afffd7'],
    \ ['darkcyan',    '#a3a6ff'],
    \ ['darkred',     '#ff7878'],
    \ ['red',         '#ff7878'],
    \ ]
