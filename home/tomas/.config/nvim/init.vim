" basic stuff
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disable autocomments
autocmd VimResized * wincmd = " automatically resize splits on window resize
let mapleader=' '
let maplocalleader=';'
set backupdir=~/.local/share/nvim/backup " do not clutter current directory
set clipboard=unnamed,unnamedplus " make copy/paste work between programs
set confirm " ask to save file on quit
set hidden " open new buffers without saving the current one
set ignorecase smartcase " *really* smart search
set list " display invisible characters set listchars=tab:\|·,nbsp:␣,trail:•,extends:⟩,precedes:⟨ ",eol:¬
set mouse=a
set noshowmode " hide default mode indicator
set nottimeout " exit mode immediately after pressing Esc
set path+=** " search subdirectories recursively
set smartindent expandtab tabstop=2 softtabstop=2 shiftwidth=2 " tabs are spaces
set spelllang=en,cs
set splitbelow splitright " place splits as expected
set undofile " persistent undo history
set updatetime=250

" key mappings
"" reload config
noremap <leader>R :source ~/.config/nvim/init.vim<CR>
"" update plugins
noremap <leader>P :source ~/.config/nvim/init.vim \| :PlugUpgrade \| PlugInstall \| PlugClean \| PlugUpdate<CR>
"" get rid of search highlights
noremap <Esc> :nohlsearch<CR><Esc>
"" toggle line numbers
noremap <leader>N :set number! relativenumber!<CR>
"" open file
noremap <leader>e :Files<CR>
noremap <leader>g :Rg<CR>
"" write
noremap <leader>s :w<CR>
noremap <leader>w :w !doas tee %<CR>
"" splits
noremap <leader>o :vsplit<CR>
noremap <leader>O :split<CR>
noremap <leader>j <C-w><C-j>
noremap <leader>k <C-w><C-k>
noremap <leader>h <C-w><C-h>
noremap <leader>l <C-w><C-l>
noremap <leader>[ :vertical resize -5<CR>
noremap <leader>] :vertical resize +5<CR>
noremap <leader>{ :resize -5<CR>
noremap <leader>} :resize +5<CR>
noremap <leader>= <C-W>=
noremap <leader>c :q<CR>
"" buffers
noremap <leader>J :bnext!<CR>
noremap <leader>K :bprev!<CR>
noremap <leader>b :Buffers<CR>
noremap <leader><Tab> <C-^>
noremap <leader>L :Lines<CR>
noremap <leader>C :bw<CR>
"" history
noremap <leader>f :History<CR>
noremap <leader>; :History:<CR>
noremap <leader>/ :History/<CR>
"" gj/gk
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
"" highlight yanked text
autocmd TextYankPost * silent! lua vim.hl.on_yank {higroup='Visual', timeout=400}

" filetype-specific settings
augroup tex_bindings
  autocmd!
  autocmd Filetype tex,plaintex setlocal spell
  autocmd Filetype tex,plaintex nnoremap <localleader>p :silent !zathura "%:p:r.pdf" &<CR>
  autocmd Filetype tex,plaintex nnoremap <localleader>c :silent !tex-to-pdf "%:p" >/dev/null &<CR>
augroup END
augroup srt_bindings
  autocmd!
  autocmd BufRead *.srt nnoremap <localleader>p :silent !mpv "%:p:r".* >/dev/null 2>&1  &<CR>
augroup END

" plugin management
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" load plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/Colorizer'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'farmergreg/vim-lastplace'
Plug 'gentoo/gentoo-syntax'
Plug 'georgewitteman/vim-fish'
Plug 'itchyny/lightline.vim' | Plug 'maximbaz/lightline-ale'
Plug 'itmammoth/doorboy.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-sandwich'
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'qpkorr/vim-bufkill'
Plug 'svermeulen/vim-cutlass'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-speeddating'
Plug 'vim-scripts/SearchComplete'
call plug#end()

" configure plugins
"" fzf
nmap <leader><leader> <plug>(fzf-maps-n)
xmap <leader><leader> <plug>(fzf-maps-x)
omap <leader><leader> <plug>(fzf-maps-o)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
"" gitgutter
set foldtext=gitgutter#fold#foldtext()
let g:gitgutter_grep = 'rg'
let g:gitgutter_map_keys = 0
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
"" easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
map , <Plug>(easymotion-prefix)
"" easyalign
xmap <leader>A <Plug>(EasyAlign)*
nmap <leader>A <Plug>(EasyAlign)*
"" maximizer
noremap <leader>m <Esc>:MaximizerToggle<CR>
let g:maximizer_set_default_mapping = 0
"" bufkill
let g:BufKillCreateMappings = 0
"" vim-commentary
if &filetype ==# '' | setlocal commentstring=#\ %s | endif
"" vim-cutclass
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D
"" goyo
let g:goyo_width = '80'
let g:goyo_height = '90%'
let g:goyo_linenr = '0'
noremap <leader>G :Goyo<CR>
"" limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
"" vim-sandwich
runtime macros/sandwich/keymap/surround.vim
"" Ale
autocmd Filetype zsh ALEDisable
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_fix_on_save = 1
"" nerdtree
noremap <leader>t :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeLimitedSyntax = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
  \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
"" undotree
noremap <leader>u <Esc>:UndotreeToggle<CR>
"" lightline
"\ 'colorscheme': 'base16-default-dark',
let g:lightline = {
\ 'component_function': {
\   'modified': 'LightLineModified',
\   'gitbranch': 'LightLineFugitive',
\   'fileformat': 'LightlineFileformat',
\   'filetype': 'LightlineFiletype',
\   'readonly': 'LightlineReadonly',
\ },
\ 'component_expand': {
\   'linter_checking': 'lightline#ale#checking',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok',
\ },
\ 'component_type': {
\   'linter_checking': 'left',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error',
\   'linter_ok': 'left',
\ },
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
\   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
\              [ 'lineinfo' ],
\              [ 'percent' ],
\              [ 'filetype' ] ]
\ },
\}
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
function! LightlineFileformat()
 return winwidth(0) > 70 ? &fileformat : ''
endfunction
function! LightlineFiletype()
 return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
function! LightlineReadonly()
 return &readonly && &filetype !~# '\v(help|vimfiler|unite)' ? '' : ''
endfunction
function! LightLineModified()
 return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '✎ ' : &modifiable ? '' : '-'
endfunction
function! LightLineFugitive()
 if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
  let _ = fugitive#head()
  return strlen(_) ? ' '._ : ''
 endif
 return ''
endfunction

"" colorscheme
set notermguicolors
set t_Co=16
