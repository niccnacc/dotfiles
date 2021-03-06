" PLUGINS
"""""""""""
set nocompatible              " be iMproved, required

call plug#begin('~/.config/nvim/bundle')
" :PlugInstall(!)    - install (update) plugins
" :PlugUpdate
" :PlugSearch(!) foo - search (or refresh cache first) for foo
" :PlugClean(!)
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ctrlpvim/ctrlp.vim'
  " Plug 'AutoTag'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  " Plug 'Valloric/YouCompleteMe' " code completion
  Plug 'sudar/vim-arduino-syntax'
  Plug 'adelarsq/vim-matchit'
  Plug 'jrestrepo/matlab'
  Plug 'lervag/vimtex'
  Plug 'frankier/neovim-colors-solarized-truecolor-only'
  " Plug 'Lokaltog/vim-easymotion'
  " other stuff
  " Plug 'JuliaLang/julia-vim'
call plug#end()

filetype plugin indent on
" filetype plugin on


" verbose map [mapping] = find where and how something is defined
"

" GENERAL
"""""""""""
set encoding=utf-8
" set spell
set spelllang=en_gb
nnoremap <leader>spell :setlocal spell! spelllang=en_gb<cr>
set nobackup            " centralize backups, swapfiles and undo history
set noswapfile
set nomodeline          " dont scan file for commands for security
set nofoldenable

" LEADER
"""""""""""
let mapleader = ","
let maplocalleader = ","
inoremap jj <ESC>
" nnoremap ; :
" nnoremap : ;
" save on loss of focus
:au FocusLost * :wa

" set t_Co=256
" http://snk.tuxfamily.org/log/vim-256color-bce.html
" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
" if &term =~ '256color'
  " set t_ut=
" endif
if has("termguicolors")
  set termguicolors
endif

" vimcolors.com
" find names of elements: ':hi' or http://www.vimtax.com/
" edit schemes graphically http://bytefluent.com/vivify/
" get matching colors: http://colorschemedesigner.com/
" colorscheme molokai_flat
" colorscheme solarized8_light_flat
autocmd ColorScheme * hi link matlabComma Normal
set background=light
colorscheme solarized
set fillchars=vert:│
hi link matlabSemicolon normal


nnoremap <leader>dark :colorscheme molokai_flat<cr>
nnoremap <leader>light :colorscheme solarized8_light_flat<cr>


" PLUGIN SETTINGS
""""""""""""""""""
" ctrlp
let g:ctrlp_working_path_mode = 'c'
" easy motion
" all these work with <leader> _
" let g:EasyMotion_smartcase = 1
" nnoremap <leader>easys2 <Plug>(easymotion-s2)
" map j <Plug>(easymotion-j)
" map k <Plug>(easymotion-k)

" airline font
" https://github.com/antindexer/monaco
let g:airline_powerline_fonts=1
let g:airline_theme='tomorrow'

" Snip Trigger configuration.
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir ="~/.config/nvim/UltiSnips"

" YouCompleteMe
" let g:ycm_key_list_select_completion = ['<c-n>', '<down>']
" let g:ycm_key_list_previous_completion = ['<c-p>', '<up>']
" let g:ycm_min_num_of_chars_for_completion = 2
" let g:ycm_filetype_blacklist = {
 " \ 'text' : 1,
 " \}



" vimtex
setlocal spell
set spelllang=de_at,en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" writing/markup preferences
set conceallevel=1
let g:tex_conceal='abdmg'
" compiling preferences
let g:tex_flavor='latex'
" let g:Tex_Folding=0
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
" sudo dnf install python3-pip redhat-rpm-config; pip3 install neovim-remote; pip3 install nvr
" zathura -h should display synctex support
" zathura --version shows a pdf plugin
" first infos for debugging in
" <leader>lo to read bottom of output
" i.e. pip3 nvr,greenlight,msgpack errors
"
" pip3 install pynvim, neovim
"
" In ~/.config/zathura/zathurarc
"
" set synctex true
" set synctex-editor-command \"nvr --remote-silent %f -c %l"
"
let g:vimtex_compiler_progname='/usr/local/bin/nvr'
" let g:vimtex_toc_tocdepth = 2
autocmd FileType plaintex,tex setlocal formatoptions-=t
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'background' : 1,
    \ 'build_dir' : './build',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-pdf',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-shell-escape',
    \   '-interaction=nonstopmode'
    \ ],
\}

set iskeyword+=:
set grepprg=grep\ -nH\ $*


" TEXT/NUMBERS
"""""""""""""""
set wrap
set linebreak           " only break at breakat characters
set nolist              " list disables linebreak
set formatoptions-=t    " no break while type
set textwidth=72
set colorcolumn=        " 85
set number              " enable line numbers
set relativenumber
"corresponding filetypes are in ~/.vim/ftdetect
syntax enable
set tabstop=2           " a tab is two spaces
set softtabstop=2       " for <BS>, pretend like a tab is removed even spaces
set shiftwidth=2        " number of spaces for autoindenting
set expandtab
set autoindent
set copyindent          " copy the previous indentation on autoindenting
set cursorline          " highlight current line
set hidden
set smarttab            " insert tabs on the start of a line according to
                        " shiftwidth, not tabstop
set cindent
set backspace=indent,eol,start " backspace everything in insert mode
set showmode
" set titlestring=%f title " show the filename in the terminal titlebar
set showcmd             " show the (partial) command as it’s being typed
set wildmenu
set laststatus=2        " allways show statusbar
set ttyfast             " better redrawing
" set mouse=a
set mouse+=a            " enable mouse in all modes
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
set history=1000        " remembered command history
set undolevels=1000
" scroll 5 lines with <C-u>
noremap <C-u> 10<C-u>
noremap <C-d> 10<C-d>
set scrolloff=3         " start scrolling 3 lines before border
set nostartofline       " don’t set cursor to start of line when moving around.


" SEARCHING
"""""""""""""
set gdefault            " add the g flag to search/replace by default
" open fold on search add zz to keep scrolling with it
nnoremap * *zv
nnoremap ? ?zv
nnoremap n nzv
nnoremap N Nzv
" easy search with /
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set showmatch
set hlsearch            " highlight searches automatically
set incsearch           " highlight while typing allready
" remove highlights after searching
nnoremap <leader><Space> :noh<cr>
set inccommand=split " live subsitute


" MOVEMENTS
"""""""""""""
" move cursor left/right over line
set whichwrap=<,>,[,],b,s,h,l
" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
  if &wrap
    return "g" . a:movement
  else
     return a:movement
  endif
endfunction
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> $ ScreenMovement("$")
" nnoremap <silent> <expr> ^ ScreenMovement("^")
" onoremap <silent> <expr> j ScreenMovement("j")
" onoremap <silent> <expr> k ScreenMovement("k")
" onoremap <silent> <expr> 0 ScreenMovement("0")
" onoremap <silent> <expr> ^ ScreenMovement("^")
" onoremap <silent> <expr> $ ScreenMovement("$")


" YANK/PASTE
""""""""""""""
" set clipboard=unnamed " unnamed buffer <-> clipboard
" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+y$
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>y "+y
vmap <leader>p "+p
" same behavior as C
nnoremap D d$
nnoremap Y y$

" Buffer Jumping
nnoremap <leader>bb :buffers<cr>:b<space>
nnoremap <leader><tab> :b#<cr>

" leader+w = delete trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>
" open preferences with lead+pref
nnoremap <leader>pref <C-w>v<C-l>:e $MYVIMRC<cr>
" reload the configuration with leader+r
nnoremap <leader>rel :source $MYVIMRC<cr>
nnoremap <leader>r :redraw!<cr>


" SPLITTING
"""""""""""""
set splitbelow
set splitright
" open vertical split with leader+w
nnoremap <leader>w <C-w>v<C-w>l
" move between windows with C-hjkl
" nnoremap <silent><C-h> :TmuxNavigateLeft<cr>
"
" Move away from terminal splits
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-l> <C-\><C-N><C-w>l

nnoremap <leader>mat :vsplit term://tmux new-session -ds mat; tmux attach -t mat; matlab -nodesktop -nosplash<cr>


" Insert Mode Keys
"""""""""""""""""""
"Capitalize the just written word
inoremap <C-u> <Esc>viwUea


" C tags
"""""""""""""""""""
set tags=./tags;/
" open tag in vertial split
map <A-]> :vsp <cr>:exec("tag ".expand("<cword>"))<cr>
nnoremap ]t :tnext<cr>
nnoremap [t :tprev<cr>


" COMMENTS
""""""""""""
autocmd FileType c,cpp,java      let b:comment_leader = '//'
autocmd FileType arduino         let b:comment_leader = '//'
autocmd FileType sh,ruby,python  let b:comment_leader = '#'
autocmd FileType conf,fstab      let b:comment_leader = '#'
autocmd FileType matlab,plaintex,tex,latex      let b:comment_leader = '%'
autocmd FileType vim             let b:comment_leader = '"'
autocmd FileType html            let b:comment_leader = '<!--  -->'
autocmd FileType css,scss        let b:comment_leader = '/* */'
autocmd FileType * exe EscapeCommentLeader()



function! EscapeCommentLeader()
  if exists('b:comment_leader')
    let b:comment_leader = escape(b:comment_leader,b:comment_leader)
  endif
endfunction

function! ToggleComment()
" help with :h \v or pattern-atoms /*
  if exists('b:comment_leader')
    if getline('.') =~ '\v^\s*' .b:comment_leader
      " uncomment the line
      execute 'silent s/\v^\s*\zs' .b:comment_leader.'[ ]?//g'
    else
      " comment the line
      execute 'silent s/\v^\s*\zs\ze(\S|\n)/' .b:comment_leader.' /g'
    endif
  else
    echo 'no comment leader found for filetype'
  end
endfunction

nnoremap <leader>c :call ToggleComment()<cr>


" OPEN LAST
""""""""""""
" go to last file(s) if invoked without arguments
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 &&
    \ filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


