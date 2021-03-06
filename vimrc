set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Required by Vundle
Plugin 'gmarik/Vundle.vim'

" Completion
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'honza/vim-snippets'

" Bling
Plugin 'bling/vim-airline'

" Syntax Highlighting
Plugin 'scrooloose/syntastic'
Plugin 'baskerville/vim-sxhkdrc'
Plugin 'Procrat/oz.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rdnetto/YCM-Generator'
Plugin 'junegunn/vim-easy-align'

Plugin 'Chiel92/vim-autoformat'

" Latex
Plugin 'LaTeX-Box-Team/LaTeX-Box'

" Stuff
Plugin 'scrooloose/nerdtree'

" Haskell
" Plugin 'eagletmt/ghcmod-vim'
" Plugin 'eagletmt/neco-ghc'
" Plugin 'Shougo/vimproc.vim'
Plugin 'dag/vim2hs'

call vundle#end()
filetype plugin indent on

" Sync pastebuffers
if has ('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
end

" Map Leader
let mapleader=','
let maplocalleader=','

" Syntastic settings
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_java_javac_config_file_enabled = 1

let g:airline_powerline_fonts=1

let g:cpp_class_scope_highlight = 1
let g:ycm_confirm_extra_conf = 0

" Autoformat settings
let g:formatprg_args_java = "--mode=java"
let g:formatprg_args_cpp = "--style=kr"

let g:formatprg_haskell = "stylish-haskell"

let g:ycm_key_list_select_completion = ['<tab>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Haskell Completion
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" Let <CR> expand snippets
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

" LaTeX
let g:LatexBox_Folding = 1

set autoread
set mouse=a
set smartindent
set laststatus=2
set tabstop=4
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
set shiftwidth=4
set expandtab
"set omnifunc=syntaxcomplete#Complete
set nu
syntax on
set t_Co=256

set completeopt=longest,menuone

set ignorecase
set smartcase

colorscheme twilight
highlight Normal ctermbg=none
highlight LineNr ctermbg=none ctermfg=none
hi SpecialKey guibg=none
highlight NonText ctermbg=none ctermfg=none
hi VertSplit guibg=none
hi Folded guibg=none
hi SpecialKey ctermbg=none ctermfg=233

"Trailing whitespace as dots
set list
set listchars=tab:→→,trail:·

"Get rid of scratchpad
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"Write with sudo rights
cmap w!! w !sudo tee % > /dev/null

"Word Processing mode
func! WordProcessorMode()
    setlocal formatoptions=1
    setlocal noexpandtab
    map j gj
    map k gk
    setlocal spell spelllang=en,nl
    set complete+=s,k
    set formatprg=par
    setlocal wrap
    setlocal linebreak
endfu
com! WP call WordProcessorMode()

autocmd FileType tex call WordProcessorMode()
" au BufRead,BufNewFile *.hs setlocal omnifunc=necoghc#omnifunc

nnoremap <space> za

" Move blocks of text interactively
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <leader>= :Autoformat<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
