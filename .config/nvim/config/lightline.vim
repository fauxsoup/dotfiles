" lightline
let g:lightline = {
  \ 'colorscheme': 'material_vim',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'cocstatus', 'currentfunction', 'ctrlpmark', 'git', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'git': 'FugitiveHead',
  \   'blame': 'LightlineGitBlame',
  \   'currentfunction': 'CocCurrentFunction',
  \   'cocstatus': 'coc#status'
  \ }
\ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function')
    " return CocAction('getCurrentFunctionSymbol')
endfunction
