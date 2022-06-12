set nocompatible
filetype plugin on

"set the number of command in buffer
set history=500
set number
"default on
set hidden

"set suffix when use 'gf' to jump file
"set suffixesadd+=.txt

"can change map for eles.
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"tab operation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<CR>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<CR>=@/<CR><CR>

function! s:VSetSearch()
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

"set key of off highlight for search 
nnoremap <silent> <C-l> :<C-u>nohlserch<CR><C-l>
if has("autocmd")
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
endif

"get current path in cmd by typed %%.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

source ~/vim/ex_mode/history-scrollers.vim

