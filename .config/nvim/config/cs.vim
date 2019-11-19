"let g:OmniSharp_server_type = 'roslyn'
"let g:OmniSharp_server_path = '/home/soup/.local/bin/OmniSharp'
""let g:OmniSharp_server_path = '/opt/omnisharp-roslyn/OmniSharp.exe'

"autocmd MyAutoCmd FileType cs setlocal omnifunc=OmniSharp#Complete

let g:deoplete_omnisharp_exe_path = get(g:, "deoplete_omnisharp_exe_path", "~/.local/bin/OmniSharp")
let g:deoplete_omnisharp_port = get(g:, "deoplete_omnisharp_port", 9999)
