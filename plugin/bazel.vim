" bazel.vim - vim plugin for bazel
" Author: Yunlong Liu (davislong198833@gmail.com)

if !has('python')
  echoerr "This plugin should run with python support."
  finish
endif

let s:folder = expand('<sfile>:p:h')

function! RunBazelWithOptions(opt)
python << EOF
import os
import sys
import vim

curr_path = vim.eval('s:folder')
lib_path = os.path.join(curr_path, '.')
sys.path.insert(0, lib_path)

import vim_bazel
vim_bazel.Run(vim.eval('a:opt'))
EOF
endfunction

" Commands
command! BazelBuild call RunBazelWithOptions("build")
command! BazelRun call RunBazelWithOptions("run")
command! BazelTest call RunBazelWithOptions("test")

" Key mappings in normal mode
nmap <leader>bb :BazelBuild<CR>
nmap <leader>br :BazelRun<CR>
nmap <leader>bt :BazelTest<CR>
