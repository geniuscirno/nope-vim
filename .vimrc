" Environment {

" }

" Basics {
    set nocompatible
    set encoding=utf-8
    set fileencoding=utf-8
" }

" General {
    set background=dark
    set t_Co=256
    function! ToggleBG()
        let s:tbg= &background
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction
    noremap <leader>bg :call ToggleBF()<CR>

    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set re=1
    scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')   " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else                    " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set hidden                          " Allow buffer switching without saving
" }

" Font {
    if has("win32") || has("win64")
        set guifont=Monaco\ for\ Powerline:h12:cANSI
        set renderoptions=type:directx,renmode:5
    endif
" }


" UI {
    if has("gui_running")
        set guioptions-=m " 隐藏菜单栏
        set guioptions-=T " 隐藏工具栏
        set guioptions-=L " 隐藏左侧滚动条
        set guioptions-=r " 隐藏右侧滚动条
        set guioptions-=b " 隐藏底部滚动条
        set showtabline=0 " 隐藏Tab栏
    endif
    let g:rehash256=1
    let g:molokai_original = 1
    colorscheme molokai

    set number                          " Line numbers on
    set showmatch                       " Show matching brackets/parenthesis
    set hlsearch                        " Highlight search terms
    set cursorline
    hi CursorLine   cterm=NONE ctermbg=24 ctermfg=white
" }

" Formatting {
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
" }

" Terminal {
    if has("win32") || has("win64")
        set shell=powershell.exe
    endif
" }


" Key Mapping {
    " NERDTree
    map <C-n> :NERDTreeToggle<CR>

    " vim-go
    autocmd FileType go nmap <leader>r  <Plug>(go-run)
    autocmd FileType go nmap <leader>t  <Plug>(go-test)
    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

    " CtrlSf
    nmap     <C-F>f <Plug>CtrlSFPrompt
    vmap     <C-F>f <Plug>CtrlSFVwordPath
    vmap     <C-F>F <Plug>CtrlSFVwordExec
    nmap     <C-F>n <Plug>CtrlSFCwordPath
    nmap     <C-F>p <Plug>CtrlSFPwordPath
    nnoremap <C-F>o :CtrlSFOpen<CR>
    nnoremap <C-F>t :CtrlSFToggle<CR>
    inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
" }

" Plugins {

   " vim-go {
        " run :GoBuild or :GoTestCompile based on the go file
        function! s:build_go_files()
          let l:file = expand('%')
          if l:file =~# '^\f\+_test\.go$'
            call go#test#Test(0, 1)
          elseif l:file =~# '^\f\+\.go$'
            call go#cmd#Build(0)
          endif
        endfunction
        
        
        let g:go_fmt_command = "goimports"
        let g:go_highlight_types = 1
        let g:go_highlight_fields = 1
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
   " }
   " NERDTree {
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
   " }
   " NERDCommenter {
        " Add spaces after comment delimiters by default
        let g:NERDSpaceDelims = 1
        " Use compact syntax for prettified multi-line comments
        let g:NERDCompactSexyComs = 1
        " Align line-wise comment delimiters flush left instead of following code indentation
        let g:NERDDefaultAlign = 'left'
        " Add your own custom formats or override the defaults
        let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
        " Allow commenting and inverting empty lines (useful when commenting a region)
        let g:NERDCommentEmptyLines = 1
        " Enable trimming of trailing whitespace when uncommenting
        let g:NERDTrimTrailingWhitespace = 1
        " Enable NERDCommenterToggle to check all selected lines is commented or not 
        let g:NERDToggleCheckAllLines = 1
   " }
   " vim-airline {
        " Automatically displays all buffers when there's only one tab open.
        let g:airline#extensions#tabline#enabled = 1
   " }
" }






