" When testing the plugin

" Laden des Plugins
" if exists('g:nvim-code-smell') | finish | endif

" let g:loaded_plugin_name = 1

nnoremap <leader>l :luafile ~/Projects/personal/nvim-code-smell/lua/nvim-code-smell/init.lua<CR>
nnoremap <leader>q :RunDiagnostic<CR>

" Laden von Lua
lua << EOF
-- Laden des Plugin-Moduls
require('nvim-code-smell')
EOF
