" plugins
call plug#begin('~/.vim/plugged')
" syntax
Plug 'ARM9/arm-syntax-vim'
Plug 'rhysd/vim-crystal'
Plug 'fatih/vim-go'
Plug 'rgrinberg/vim-ocaml'
Plug 'rust-lang/rust.vim'
Plug 'ziglang/zig.vim'

" linting/semantic highlighting
Plug 'w0rp/ale'
Plug 'nvie/vim-flake8'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" ui stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'machakann/vim-highlightedyank'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'kien/rainbow_parentheses.vim'

" colorscheme
Plug 'sainnhe/edge'

" ~practical~ plugins
Plug 'igankevich/mesonic'
Plug 'jremmen/vim-ripgrep'
call plug#end()

syntax on

set termguicolors
set background=dark

set backspace=2
set nu
set tabstop=4       " set tab width to 4
set shiftwidth=4    " set indent width to 4
set softtabstop=4
set expandtab       " Expand tabs to spaces!!
set modelines=0
set nomodeline

set mouse=a         " enable mouse integration stuff

" set tabs to 2 spaces for crystal, ocaml, and ruby
:autocmd Filetype crystal setlocal ts=2 sw=2 expandtab
:autocmd Filetype ocaml setlocal ts=2 sw=2 expandtab
:autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

set splitbelow      " set new horizontal splits to open below

let &t_Co=256

" keep an undo history after exit
set undodir=~/.vim/undos
set undofile

" colorscheme config
let g:edge_style = 'aura'
let g:edge_disable_italic_comment = 1
colorscheme edge

" use ARM syntax for asm files
au BufNewFile,BufRead *.s,*.S set filetype=arm

" go syntax highlighting config
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1

" use pyenv python 3 version from pyenv
let g:python3_host_prog = "$HOME/.pyenv/shims/python"
"let g:python3_host_prog = "/usr/local/bin/python3"

" run zigfmt on save
let g:zig_fmt_autosave = 1
:autocmd Filetype zig setlocal smartindent nocindent

" airline theme stuff
let g:airline_theme = 'edge'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" ale configuration
let g:ale_linters = {
	\ 'go': ['gopls'],
	\}
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
" visual
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '➔'
let g:ale_set_highlights = 0
" rust-specific ale stuff
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1

" configure indentline stuff
let g:indentLine_enabled = 0
let g:indentLine_color_term = 240
let g:indentLine_color_gui = "#5c6370"
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
set list

" nerdtree stuff
map <C-n> :NERDTreeToggle<CR>
" exclude nerdtree panes from indentline
let g:indentLine_fileTypeExclude = ["nerdtree"]

" rainbow parentheses config
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

" set ripgrep to 'smart case mode'
let g:rg_command = 'rg --vimgrep -S'

" custom colors for semshi
function SemshiHighlights()
    hi semshiAttribute          ctermfg=30 guifg=#008787
    hi semshiBuiltin            ctermfg=67 guifg=#5f87af cterm=bold gui=bold
    hi semshiFree               ctermfg=125 guifg=#af005f
    hi semshiGlobal             ctermfg=96 guifg=#875f87
    hi semshiImported           ctermfg=132 guifg=#afafd7
    hi semshiParameter          ctermfg=132 guifg=#af5f87
    hi semshiParameterUnused    ctermfg=117 guifg=#af5f87 cterm=underline gui=underline
    hi semshiSelected           ctermbg=167 guibg=#d75f5f ctermfg=188 guifg=#262626
    hi semshiSelf               ctermfg=208 guifg=#ff8700
    hi semshiUnresolved         ctermfg=196 guifg=#ff0000 cterm=underline gui=underline
endfunction
" call custom highlights for semshi
:autocmd Filetype python call SemshiHighlights()
