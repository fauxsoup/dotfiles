" -----------------------------------------------------------------------------
" Leaders
" -----------------------------------------------------------------------------
let mapleader="\<space>"

nnoremap  [FuzzyFinder]   <Nop>
nmap      ; [FuzzyFinder]

nnoremap  [Files]   <Nop>
nmap      , [Files]

nnoremap  [Windows]   <Nop>
nmap      s [Windows]

nnoremap  [Tabs]   <Nop>
nmap      t [Tabs]

nnoremap  [Foldings]   <Nop>
nmap      z [Foldings]

" -----------------------------------------------------------------------------
" Miscellaneous
" -----------------------------------------------------------------------------

" Reload command
command! Reload :so ~/.config/nvim/init.vim

" Indent paragraph
nnoremap <leader>a =ip

" Remove empty spaces
nnoremap <leader>, :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" Overwrite word unders cursor
nnoremap <leader>ow <Esc>viwp

" Fast write
nnoremap <Leader>w :write<CR>

" Substitute all occurences in current file
nnoremap <Leader>saw :%s/\<<C-r><C-w>\>//g<Left><Left>

" Enter Command mode
nnoremap ! :!

" Substitute inside selection
"xnoremap s :s//g<Left><Left>

" Select pasted text
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" Yank until end of line
nnoremap Y y$

" Toggle Tagbar
nmap <leader>; :TagbarToggle<CR>

" Paste without yank
vnoremap p "_dP

" Change current word in a repeatable manner
nnoremap cn *``cgn
nnoremap cN *``cgN

" Change selected word in a repeatable manner
vnoremap <expr> cn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
vnoremap <expr> cN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"

" Save with sudo
cmap W!! w !sudo tee % >/dev/null

" Smart Duplication
nnoremap <Leader>d :t.<cr>
vnoremap <Leader>d :co-1<cr>

" Macro
nnoremap Q q
nnoremap M @q
vnoremap M :norm @q<CR>

" Run the last shell command
nnoremap <silent><leader>l :!!<CR>

" Select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" -----------------------------------------------------------------------------
" Windows
" -----------------------------------------------------------------------------

" Split verticaly
nnoremap <silent> [Windows]v :<C-u>split<CR>

" Split horizontaly
nnoremap <silent> [Windows]g :<C-u>vsplit<CR>

" Close window
nnoremap <silent> [Windows]c :close<CR>

" Close all but the current
nnoremap <silent> [Windows]co :<C-u>only<CR>

" Back to previoius buffer
nnoremap <silent> [Windows]b :b#<CR>

" Rotate buffers
nnoremap <silent> [Windows]r <C-w>x

" Zoom buffer
nnoremap [Windows]z :Goyo<CR>

" Resize
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" -----------------------------------------------------------------------------
" Tabs
" -----------------------------------------------------------------------------

" Move to
nnoremap <silent> [Tabs]t :tabnew<CR>
nnoremap <silent> [Tabs]l :tabnext<CR>
nnoremap <silent> [Tabs]h :tabprev<CR>

" -----------------------------------------------------------------------------
" Terminal
" -----------------------------------------------------------------------------
tnoremap <Esc> <C-\><C-n>
tnoremap <M-[> <Esc>
tnoremap <C-v><Esc> <Esc>

" Toggle 'default' terminal
nnoremap <M-`> :botright 0Ttoggle<CR>
nnoremap <M-1> :botright 1Ttoggle<CR>
nnoremap <M-0> :vert Tnew<CR>

" -----------------------------------------------------------------------------
" Files
" -----------------------------------------------------------------------------

" Duplicate current file
nnoremap [Files]du :saveas <C-r>=expand('%')<cr>/

" Delete current file
nnoremap [Files]de :!rm %

" Move/Rename current file
nnoremap [Files]m :!mv <C-r>=expand('%')<cr> <C-r>=expand('%:h')<cr>

" Copy Relative path
nnoremap <silent> [Files]y :let @+=join([expand("%"), line('.')], ':')<CR>:echo 'Relative path copied to clipboard.'<CR>

" Copy Absolute path
nnoremap <silent> [Files]Y :let @+=expand("%:p")<CR>:echo 'Absolute pat copied to clipboard.'<CR>

" Sidebars
" nnoremap <silent> [Files]a :NERDTreeFind<CR>
" nnoremap <silent> [Files]e :NERDTreeToggle<CR>
nnoremap <silent> [Files]a :call DefxOpen({'split': v:true, 'find_current_file': v:true})<CR>

" -----------------------------------------------------------------------------
" FuzzyFinder
" -----------------------------------------------------------------------------
nnoremap <silent> [FuzzyFinder]f :Files<cr>
nnoremap <silent> [FuzzyFinder]w :Windows<cr>
nnoremap <silent> [FuzzyFinder]g :Find<cr>
nnoremap <silent> [FuzzyFinder]t :Tags <cr>
nnoremap <silent> [FuzzyFinder]T :BTags <cr>
nnoremap <silent> [FuzzyFinder]c :BCommits <cr>
nnoremap <silent> [FuzzyFinder]b :Buffers <cr>
nnoremap <silent> [FuzzyFinder]/ :BLines <cr>
nnoremap <silent> [FuzzyFinder]m :Marks <cr>

" -----------------------------------------------------------------------------
" Javascript
" -----------------------------------------------------------------------------
function! JSTextObjectFunction()
    normal! ]}%
    execute "normal ?function\<CR>"
    normal! vf{%
endfunction
vnoremap af :<C-U>silent! :call JSTextObjectFunction()<CR>

" -----------------------------------------------------------------------------
"  Folding
" -----------------------------------------------------------------------------

