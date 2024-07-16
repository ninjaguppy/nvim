vim.cmd [[
"vim.cmd 'set langmap=nN;jJ,eE;kK,iI;lL,kK;nN,uU;iI,lL;uU,fF;eE,tT;fF,jJ;tT,mM;hH'
"vim.cmd 'set nolangremap'
" Up/down/left/right {{{
    nnoremap m h|xnoremap m h|onoremap h h|
    nnoremap n j|xnoremap n j|onoremap n j|
    nnoremap e k|xnoremap e k|onoremap e k|
    nnoremap i l|xnoremap i l|onoremap i l|
" }}}
" Words forward/backward {{{
    " l/L = back word/WORD
    " u/U = end of word/WORD
    " y/Y = forward word/WORD
    "nnoremap l b|xnoremap l b|onoremap l b|
    "nnoremap L B|xnoremap L B|onoremap L B|
    nnoremap f e|xnoremap f e|onoremap f e|
    nnoremap F E|xnoremap F E|onoremap F E|
    "nnoremap y w|xnoremap y w|onoremap y w|
    "nnoremap Y W|xnoremap Y W|onoremap Y W|
    cnoremap <C-L> <C-Left>
    cnoremap <C-Y> <C-Right>
" }}}
" inSert/Replace/append (T) {{{
    nnoremap u i|
    nnoremap U I|
    nnoremap t a|
    nnoremap T A|
" }}}
" Undo/redo {{{
    nnoremap l u|xnoremap l :<C-U>undo<CR>|
    nnoremap gl U|xnoremap gl :<C-U>undo<CR>|
    nnoremap L <C-R>|xnoremap L :<C-U>redo<CR>|
" }}}
" Visual mode {{{
    " Make insert/add work also in visual line mode like in visual block mode
    xnoremap <silent> <expr> u (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")
    xnoremap <silent> <expr> U (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")
   "xnoremap <silent> <expr> t (mode() =~# "[V]" ? "\<C-V>0o$A" : "A")
   "xnoremap <silent> <expr> T (mode() =~# "[V]" ? "\<C-V>0o$A" : "A")
" }}}
" Search {{{
    " f/F are unchanged
    "nnoremap p t|xnoremap p t|onoremap p t|
    "nnoremap P T|xnoremap P T|onoremap P T|
    "nnoremap b ;|xnoremap b ;|onoremap b ;|
    "nnoremap B ,|xnoremap B ,|onoremap B ,|
    nnoremap k n|xnoremap k n|onoremap k n|
    nnoremap K N|xnoremap K N|onoremap K N|
" }}}
" inneR text objects {{{
    " E.g. dip (delete inner paragraph) is now drp
    onoremap r i
" }}}
" Folds, etc. {{{
    nnoremap j z|xnoremap j z|
    nnoremap jn zj|xnoremap jn zj|
    nnoremap je zk|xnoremap je zk|
" }}}
" Overridden keys must be prefixed with g {{{
    nnoremap gX X|xnoremap gX X|
    nnoremap gK K|xnoremap gK K|
    nnoremap gL L|xnoremap gL L|
" }}}
" Window handling {{{
    "nnoremap <C-W>h <C-W>h|xnoremap <C-W>h <C-W>h|
    "nnoremap <C-W>n <C-W>j|xnoremap <C-W>n <C-W>j|
    "nnoremap <C-W>e <C-W>k|xnoremap <C-W>e <C-W>k|
    "nnoremap <C-W>i <C-W>l|xnoremap <C-W>i <C-W>l|
" }}}
]]
