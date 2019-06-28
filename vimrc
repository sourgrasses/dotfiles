" plugins
call plug#begin('~/.vim/plugged')
" syntax
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'rgrinberg/vim-ocaml'
Plug 'elixir-lang/vim-elixir'
Plug 'rhysd/vim-crystal'
Plug 'ziglang/zig.vim'
Plug 'https://gitlab.com/inko-lang/inko.vim.git'
Plug 'manicmaniac/coconut.vim'
Plug 'zah/nim.vim'

" linting/semantic highlighting
Plug 'w0rp/ale'
Plug 'arakashic/chromatica.nvim'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'nvie/vim-flake8'

" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf'
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" ui stuff
Plug 'kien/rainbow_parentheses.vim'
Plug 'bling/vim-bufferline'
Plug 'machakann/vim-highlightedyank'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'RRethy/vim-hexokinase'
Plug 'AlessandroYorba/Arcadia'
Plug 'AlessandroYorba/Sierra'

" ~practical~ plugins
Plug 'igankevich/mesonic'
Plug 'tpope/vim-vinegar'
Plug 'jremmen/vim-ripgrep'
call plug#end()

syntax on
let g:arcadia_Sunset = 1
colorscheme arcadia
set termguicolors

" airline theme stuff
let g:airline_theme = 'violet'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '●●●●'
let g:airline_right_sep = '●●●●'

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

set undodir=~/.vim/undos
set undofile

" completion configuration
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'] }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>

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

" tell hexokinase to put the color swatch after the hex
let g:Hexokinase_highlighters = ['virtual']

" call custom highlights for semshi
:autocmd Filetype python call SemshiHighlights()

" netrw/vinegar configuration
let g:netrw_liststyle = 3
let g:netrw_browse_split = 1
let g:netrw_winsize = 25

" override some go defaults about autosaving and 
" not expanding tabs to spaces
let g:go_fmt_autosave = 0
:autocmd Filetype go setlocal expandtab

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

" tmux stuff
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

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
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
