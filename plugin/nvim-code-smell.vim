if exists('g:nvim-code-smell') | finish | endif

let g:loaded_plugin_name = 1

lua << EOF
  require('nvim-code-smell')
EOF
