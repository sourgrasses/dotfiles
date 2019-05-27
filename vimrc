" plugins
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'rgrinberg/vim-ocaml'
Plug 'elixir-lang/vim-elixir'
Plug 'rhysd/vim-crystal'
Plug 'ziglang/zig.vim'
Plug 'https://gitlab.com/inko-lang/inko.vim.git'

Plug 'w0rp/ale'

Plug 'https://github.com/junegunn/rainbow_parentheses.vim'
Plug 'bling/vim-bufferline'
Plug 'machakann/vim-highlightedyank'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lilydjwg/colorizer'
Plug 'AlessandroYorba/Arcadia'
Plug 'AlessandroYorba/Sierra'
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

let &t_Co=256

set nu

set tabstop=4       " set tab width to 4

set shiftwidth=4    " set indent width to 4

set softtabstop=4

set expandtab       " Expand tabs to spaces!!

set undodir=~/.vim/undos
set undofile

" set tabs to 2 spaces for crystal, ocaml, and ruby
:autocmd Filetype crystal setlocal ts=2 sw=2 expandtab
:autocmd Filetype ocaml setlocal ts=2 sw=2 expandtab
:autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

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

set splitbelow      " set new horizontal splits to open below

set mouse=a         " enable mouse integration stuff

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

" language client settings
"set hidden
"
"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"    \ }
"let g:LanguageClient_autoStart = 1
"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"
"" Completion
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
"" tab to select
"" and don't hijack my enter key
"inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
"inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

" auto turn on rainbow-parentheses for brackets and parentheses in
" rust, erlang, and ocaml/reason
let g:rainbow#pairs = [['{', '}'], ['(', ')']]
augroup rainbow_rust
    autocmd!
    autocmd FileType c,rust,erlang,go,inko,ocaml,reason,zig RainbowParentheses
augroup END
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
