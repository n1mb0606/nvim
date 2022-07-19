set nocompatible

call plug#begin()
" plugin for Git
Plug 'tpope/vim-fugitive'

" A parser for a HTML format
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" color scheme for vim
Plug 'tomasiser/vim-code-dark'

" A tree explorer
Plug 'scrooloose/nerdtree'

" Async Language Server Protocol for vim
Plug 'prabirshrestha/vim-lsp' 

" Easy setup language servers
Plug 'mattn/vim-lsp-settings'

" Async autocompletion for vim
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Syntax checking for vim
Plug 'scrooloose/syntastic'

" Status/tabline for vim
Plug 'vim-airline/vim-airline'

" Vim-devicons, NerdFonts required
Plug 'ryanoasis/vim-devicons'

" Debug Adapter Protocol
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

call plug#end()

filetype plugin indent on
colorscheme codedark
if has("syntax")
	syntax on
endif
set autoindent
set cindent
set nu rnu
set ts=4
set shiftwidth=4
set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set encoding=UTF-8

" Syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go']

" Vim airline options
let g:airline#extensions#tabline#enabled = 1

" Vim fold options
augroup remember_folds
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent! loadview
augroup END
set foldmethod=indent

" NERDTree options
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
autocmd FileType nerdtree setlocal relativenumber

" Vimspector options

" Shortcuts
set splitbelow
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap <F3> :!make -C %:p:h<cr><cr>

tnoremap <Esc> <c-\><c-n>

" Quick execution
au TermOpen * set bufhidden=delete
augroup term_exec_com
au!
au BufLeave * let exec_com=expand('%:p:r')
au BufLeave *.py,*.js let exec_com=expand('%:p')
augroup END

augroup term_exec
au!
au BufEnter * nnoremap <F5> :10sp +term<cr>:put =expand(exec_com)<esc>i<cr><c-\><c-n>G
au BufEnter *.py nnoremap <F5> :10sp +term<cr><esc>ipython3 <c-\><c-n>:put =expand(exec_com)<esc>i<cr><c-\><c-n>G
au BufEnter *.js nnoremap <F5> :10sp +term<cr><esc>inode <c-\><c-n>:put =expand(exec_com)<esc>i<cr><c-\><c-n>G
augroup END
