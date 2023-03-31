if exists('g:nvim-code-smell') | finish | endif

let g:loaded_plugin_name = 1

nnoremap <leader>q :RunDiagnostic<CR>

lua << EOF
  require('nvim-code-smell')
EOF
