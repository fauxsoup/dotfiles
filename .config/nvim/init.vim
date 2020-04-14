if &compatible
    set nocompatible
endif

let $VIMPATH = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let $VARPATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache').'/vim')

let g:deoplete#enable_at_startup =1
let g:deoplete#enable_debug = 1
let g:deoplete#sources#ternjs#tern_bin = '/home/soup/.nvm/versions/node/v12.13.1/bin/tern'

function! s:source_file(path, ...) abort
    let use_global = get(a:000, 0, ! has('vim_starting'))
    let abspath = resolve(expand($VIMPATH.'/config/'.a:path))
    if ! use_global
        execute 'source' fnameescape(abspath)
        return
    endif

    let content = map(readfile(abspath),
        \ "substitute(v:val, '^\\W*\\zsset\\ze\\W', 'setglobal', '')")
    let tempfile = tempname()

    try
        call writefile(content, tempfile) 
        execute printf('source %s', fnameescape(tempfile))
    finally
        if filereadable(tempfile)
            call delete(tempfile)
        endif
    endtry
endfunction

augroup MyAutoCmd
    autocmd!
    autocmd CursorHold *? syntax sync minlines=300
augroup END

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein')

    " core
    call dein#add('Shougo/denite.nvim')
    call dein#add('neoclide/coc.nvim', { 'rev': 'release', 'merged': 0 })
    " call dein#add('Shougo/deoplete.nvim')
    " call dein#add('Valloric/YouCompleteMe')
    " call dein#add('zxqfl/tabnine-vim')
    " call dein#add('tbodt/deoplete-tabnine', { 'build': './install.sh' })
    " call dein#add('Shougo/neocomplete')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('tpope/vim-dispatch')
    call dein#add('scrooloose/syntastic')

    " interface
    " call dein#add('vim-airline/vim-airline')
    call dein#add('itchyny/lightline.vim')
    call dein#add('vim-jp/syntax-vim-ex')
    call dein#add('Xuyuanp/nerdtree-git-plugin')
    " call dein#add('scrooloose/nerdtree')
    " call dein#add('Shougo/vimfiler.vim')
    call dein#add('Shougo/defx.nvim')
    call dein#add('chemzqm/vim-easygit')
    call dein#add('majutsushi/tagbar')
    call dein#add('nathanaelkane/vim-indent-guides')
    call dein#add('kaicataldo/material.vim')
    call dein#add('mhartington/oceanic-next')
    call dein#add('tpope/vim-unimpaired')
    call dein#add('wsdjeg/dein-ui.vim')
    call dein#add('kassio/neoterm')
    call dein#add('romainl/Apprentice', {'rev': 'fancylines-and-neovim'})

    " git
    call dein#add('itchyny/vim-gitbranch')
    call dein#add('jreybert/vimagit')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('rhysd/committia.vim')
    call dein#add('tpope/vim-git')

    " tmux
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('tmux-plugins/vim-tmux')

    " workflow
    call dein#add('itchyny/vim-parenmatch')
    call dein#add('itchyny/vim-cursorword')
    call dein#add('tpope/vim-commentary')
    call dein#add('kana/vim-niceblock')
    call dein#add('brooth/far.vim')
    call dein#add('easymotion/vim-easymotion')
    call dein#add('rhysd/accelerated-jk')
    call dein#add('junegunn/goyo.vim')
    call dein#add('junegunn/limelight.vim')
    call dein#add('Raimondi/delimitMate')
    call dein#add('nixprime/cpsm')
    call dein#add('chemzqm/unite-location')
    call dein#add('chemzqm/denite-git')
    call dein#add('fadein/vim-FIGlet')

    " c/c++
    " call dein#add('zchee/deoplete-clang')

    " css
    call dein#add('ap/vim-css-color')
    call dein#add('hail2u/vim-css3-syntax')
    call dein#add('othree/csscomplete.vim')
    call dein#add('cakebaker/scss-syntax.vim')

    " markdown
    call dein#add('plasticboy/vim-markdown')
    call dein#add('rhysd/vim-gfm-syntax')
    call dein#add('jxnblk/vim-mdx-js')

    " javascript
    call dein#add('pangloss/vim-javascript')
    " call dein#add('othree/yajs.vim')
    " call dein#add('othree/jspc.vim')
    call dein#add('MaxMEllon/vim-jsx-pretty')
    call dein#add('heavenshell/vim-jsdoc')
    " call dein#add('moll/vim-node')
    call dein#add('elzr/vim-json')
    call dein#add('HerringtonDarkholme/yats.vim')
    " call dein#add('mhartington/nvim-typescript', { 'build': './install.sh' })
    " call dein#add('carlitux/deoplete-ternjs')
    " call dein#add('ternjs/tern_for_vim', { 'build': 'npm install' })

    " c#
    " call dein#add('OmniSharp/omnisharp-vim')

    " markdown
    call dein#add('godlygeek/tabular')
    call dein#add('tpope/vim-markdown')
    call dein#add('iamcco/markdown-preview.vim')

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    " Linting
    call dein#add('w0rp/ale')

    call dein#end()
    call dein#save_state()
endif

function! PostSource()
    call s:source_file('denite.vim')
    call s:source_file('menus.vim')

    " call s:source_file('deoplete.vim')
    "call s:source_file('neocomplete.vim')
    call s:source_file('goyo.vim')
    " call s:source_file('nerdtree.vim')
    " call s:source_file('vimfiler.vim')
    call s:source_file('defx.vim')
    call s:source_file('neoterm.vim')
    call s:source_file('es6.vim')
    call s:source_file('cs.vim')
    call s:source_file('markdown.vim')
    call s:source_file('lightline.vim')
endfunction

let g:mapleader = "\<Space>"
let g:maplocalleader = ';'
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1

call s:source_file('plugins.vim')

call s:source_file('general.vim')
call s:source_file('filetype.vim')
call s:source_file('mappings.vim')
call s:source_file('whitespace.vim')

call dein#set_hook([], 'hook_post_source', function('PostSource'))

filetype plugin on
filetype indent on
syntax enable

autocmd VimEnter * call dein#call_hook('post_source')

function! FormatDocument()
  let l:formatdiff = 1
  pyf /usr/share/clang/clang-format.py
endfunction

map <C-F> :call FormatDocument()<cr>

autocmd BufWritePre *.h,*.c,*.cc,*.cpp,*.js call FormatDocument()

let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1

" hi Normal ctermbg=none guibg=none
" hi NonText ctermbg=none guibg=none
" hi EndOfBuffer ctermbg=none guibg=none
