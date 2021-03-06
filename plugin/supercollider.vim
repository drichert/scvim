" Load up supercollider plugin on opening a supercollider file (*.sc, *.scd)
" These are mostly the original files from the former .scvimrc
" Put your customizations into your own .vimrc

" ====================================
" Start the plugin

" set up the plugin
au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd set filetype=supercollider
au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd runtime ftplugin/supercollider.vim
au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd runtime indent/sc_indent.vim
au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd let &iskeyword="@,48-57,_,192-255"

" set this via EXPORT ... if you want to change it
if exists($SCVIM_TAGFILE)
  let s:sclangTagsFile = $SCVIM_TAGFILE
else
  let s:sclangTagsFile = "~/.sctags"
endif

" default tab settings
au FileType supercollider setlocal shiftwidth=2 tabstop=2 noexpandtab
au FileType supercollider execute "set tags+=".s:sclangTagsFile

"  matchit
au Filetype supercollider let b:match_skip = 's:scComment\|scString\|scSymbol'
au Filetype supercollider let b:match_words = '(:),[:],{:}'

" key bindings

au Filetype supercollider nmap <buffer> <F5> :call SClang_block()<CR>
au Filetype supercollider imap <buffer> <F5> :call SClang_block()<CR>a
au Filetype supercollider vmap <buffer> <F5> :call SClang_send()<CR>

au Filetype supercollider vmap <buffer> <F6> :call SClang_send()<CR>
au Filetype supercollider nmap <buffer> <F6> :call SClang_send()<CR>
au Filetype supercollider imap <buffer> <F6> :call SClang_send()<CR>a

au Filetype supercollider nmap <buffer> <F12> :call SClangHardstop()<CR>

au Filetype supercollider nmap <leader>sk :SClangRecompile<CR>
au Filetype supercollider nmap <buffer>K yiw :call SChelp(""")<CR>
au Filetype supercollider imap <C-Tab> :call SCfindArgs()<CR>a
au Filetype supercollider nmap <C-Tab> :call SCfindArgs()<CR>

" DEPRECATED
au Filetype supercollider nmap <leader>sd yiw :call SChelp(""")<CR>
au Filetype supercollider nmap <leader>sj yiw :call SCdef(""")<CR>
au Filetype supercollider nmap <leader>si yiw :call SCimplementation(""")<CR>
au Filetype supercollider nmap <leader>sr yiw :call SCreference(""")<CR>

