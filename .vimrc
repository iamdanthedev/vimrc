set nocompatible              " be iMproved, required
filetype off                  " required
set clipboard=unnamedplus
set noswapfile

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Themes
Plugin 'tomasr/molokai'
Plugin 'joshdick/onedark.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-surround'

" Git
Plugin 'tpope/vim-fugitive'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'

Plugin 'yuttie/comfortable-motion.vim'

" Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'

" Plugin 'romgrk/winteract.vim'
Plugin 'raimondi/delimitmate'
Plugin 'godlygeek/tabular'

" Languages support
" TS
" Plugin 'Quramy/tsuquyomi'
" Plugin 'leafgarland/typescript-vim'
Plugin 'chase/vim-ansible-yaml'

" Plugin 'valloric/youcompleteme'


" Support of ``
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'thaerkh/vim-workspace'
Plugin 'SirVer/ultisnips'

call vundle#end()            " required
filetype plugin indent on    " required
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

set background=dark
colorscheme molokai
set number
set foldmethod=indent

set foldlevel=5


let g:ycm_server_python_interpreter = '/usr/bin/python'


let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''



set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_typescript_checkers = ['tsuquyomi']

set wildignore=*/node_modules/*,*.js.map*,*/build/*,*/dist/*,*/lib/*

" open nerdtree automatically
" autocmd vimenter * NERDTree

map qq :NERDTreeToggle<CR>
map <Leader>nt <plug>NERDTreeTabsToggle<CR>
nnoremap <Leader>w :ToggleWorkspace<CR>



" alt-j/alt-k move line up or down
" zi is needed to prevent folds from closing
nnoremap <C-J> zi:m .+1<CR>==zi
nnoremap <C-K> zi:m .-2<CR>==zi
inoremap <C-J> <Esc>zi:m .+1<CR>==gizi
inoremap <C-K> <Esc>zi:m .-2<CR>==gizi
vnoremap <C-J> zi:m '>+1<CR>gv=gvzi
vnoremap <C-K> zi:m '<-2<CR>gv=gvzi

nnoremap <Leader>S :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>s :/<C-r><C-w><CR>

" alt button fix
let c='a'
while c <= 'z'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50


" Windows nav
map <C-h><C-h> <C-w>h
map <C-j><C-j> <C-w>j
map <C-k><C-k> <C-w>k
map <C-l><C-l> <C-w>l

" Windows move
map <A-h><A-h> <C-w>H
map <A-j><A-j> <C-w>J
map <A-k><A-k> <C-w>K
map <A-l><A-l> <C-w>L

" Tabs nav
nmap HH :tabp<CR>
nmap LL :tabn<CR>


" typescript baloon hint
"set ballooneval
"autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
let g:tsuquyomi_completion_detail=2
let g:tsuquyomi_disable_quickfix = 1
autocmd FileType typescript nmap <buffer> <Leader>t :echo tsuquyomi#hint()<CR>
autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType typescript nmap <buffer> <Leader>r <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <Leader>R <Plug>(TsuquyomiRenameSymbolC)
autocmd FileType typescript nmap <buffer> <A-]> :TsuTypeDefinition<CR>

let g:ycm_always_populate_location_list = 1
let g:ycm_error_symbol = ''
let g:ycm_warning_symbol = ''
let g:ycm_complete_in_comments = 1
nmap <Leader>gd :YcmCompleter GetDoc<CR>
nmap <Leader>gt :YcmCompleter GetType<CR>
nmap <Leader>rr :YcmCompleter RefactorRename<Space>

nmap <C-b>v :vsplit %<CR>
map <C-b>h :split %<CR>

imap jj <Esc>

" nmap gw        :InteractiveWindow<CR>

let g:UltiSnipsSnippetDir = "~/.vim/MySnips"
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsExpandTrigger="ss"
" let g:UltiSnipsJumpForwardTrigger="<C-j>"
" let g:UltiSnipsJumpBackwardTrigger="<C-k>"

let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

map <Leader>j :JsDoc<CR>
let g:jsdoc_return = 0
let g:jsdoc_additional_descriptions = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_input_description = 1

map ttt :Tab /
map tt: :Tab /:<CR>
map tt" :Tab /"<CR>
map tt, :Tab /,<CR>

map ;; A;<Esc>

imap <C-L> <End>
imap <C-H> <Home>
imap <C-l> <Right>
imap <C-h> <Left>

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

hi clear MatchParen
hi MatchParen term=underline,bold cterm=underline,bold gui=underline,bold
hi Identifier term=italic cterm=italic gui=italic
" ctermfg=233 ctermbg=208 gui=bold guifg=#000000 guibg=#FD971F
