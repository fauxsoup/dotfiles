autocmd FileType defx call s:defx_my_settings()
autocmd FileType defx setlocal nobuflisted

function! DefxOpen(...) abort
  let l:opts = get(a:, 1, {})
  let l:args = '-winwidth=40 -direction=topleft -columns=project_lint:git:mark:filename:type'
  let l:is_opened = bufwinnr('defx') > 0

  if has_key(l:opts, 'split')
    let l:args .= ' -split=vertical'
  endif

  if has_key(l:opts, 'find_current_file')
    if &filetype ==? 'defx'
      return
    endif
    call execute(printf('Defx %s -search=%s %s', l:args, fnameescape(expand('%:p')), fnameescape(expand('%:p:h'))))
  else
    call execute(printf('Defx -toggle %s %s', l:args, get(l:opts, 'dir', getcwd())))
    if l:is_opened
      call execute('wincmd p')
    endif
  endif

  return execute("norm!\<C-w>=")
endfunction

function! DefxContextMenu() abort
  let l:actions = ['new_file', 'new_directory', 'rename', 'copy', 'move', 'paste', 'remove']
  let l:selection = confirm('Action?', "&New file\nNew &Folder\n&Rename\n&Copy\n&Move\n&Paste\n&Delete")
  silent exe 'redraw'

  return feedkeys(defx#do_action(l:actions[l:selection - 1]))
endfunction

function! s:defx_my_settings() abort
    nnoremap <silent><buffer>m :call DefxContextMenu()<CR>
    nnoremap <silent><buffer><expr> o defx#do_action('drop')
    nnoremap <silent><buffer><expr> l defx#do_action('drop')
    nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
    nnoremap <silent><buffer><expr> <2-LeftMouse> defx#do_action('drop')
    nnoremap <silent><buffer><expr> sv defx#do_action('open', 'botright vsplit')
    nnoremap <silent><buffer><expr> sg defx#do_action('open', 'botright split')
    nnoremap <silent><buffer><expr> R defx#do_action('redraw')
    nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
    nnoremap <silent><buffer><expr> H defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> q defx#do_action('quit')
    nnoremap <silent><buffer><expr> gh defx#do_action('cd', [getcwd()])
endfunction
