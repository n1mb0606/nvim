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

" The ultimate snippet
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'

" Vim-devicons, NerdFonts required
Plug 'ryanoasis/vim-devicons'

" Debug Adapter Protocol
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" Vimspector
Plug 'puremourning/vimspector' 

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

" Ultisnippets options
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

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
let g:terminal_scrollback_buffer_size = 10000
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap <F3> :!make -C %:p:h<cr><cr>
nnoremap <F5> :10sp term://%:p:r<cr>
nnoremap <F7> :call vimspector#Launch()<CR>
nnoremap <F8> :call vimspector#Reset()<CR>
nnoremap <F9> :call vimspector#Continue()<CR>
nnoremap <F10> :call vimspector#StepOut()<CR>
nnoremap <F11> :call vimspector#StepInto()<CR>
nnoremap <F12> :call vimspector#StepOver()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

tnoremap <Esc> <c-\><c-n>

au BufWinEnter *.py nnoremap <F5> :<c-u>10sp term://python3 %:p<cr>
au BufWinEnter *.js nnoremap <F5> :<c-u>10sp term://node %:p<cr>
au TermOpen * se scrollback=-1
