" ===============================
" General Settings
" ===============================
let mapleader = " "

set number
set relativenumber
set scrolloff=8
set ignorecase
set smartcase
set incsearch
set hlsearch
set grepprg=rg\ --vimgrep\ --no-heading
set listchars=trail:•
set list

" NOTE: Syncs the system clipboard with the default register
if has('unix') && !has('mac')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif


" ===============================
" Language Specific Settings
" ===============================
augroup markdown_settings
  autocmd!
  autocmd FileType markdown setlocal wrap
augroup END

autocmd BufRead,BufNewFile *.sh set filetype=sh
let g:is_bash=1


" ===============================
" General Key Mappings
" ===============================

" Better HJKL
nmap H ^
nmap L $
nmap J }
nmap K {

" Remap Join Line (Due to Better HJKL)
nnoremap <Leader>cj J

" Down
nnoremap j <Down>
xnoremap j <Down>

" Up
nnoremap k <Up>
xnoremap k <Up>

" Window Navigation
nnoremap <C-h> <C-w>h
tnoremap <C-h> <C-\><C-n><C-w>h
nnoremap <C-j> <C-w>j
tnoremap <C-j> <C-\><C-n><C-w>j
nnoremap <C-k> <C-w>k
tnoremap <C-k> <C-\><C-n><C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-l> <C-\><C-n><C-w>l

" Split Resize
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Move Lines
nnoremap <A-j> :m .+1<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-k> :m '<-2<CR>gv=gv

" Buffer Navigation
nnoremap <A-h> :bprevious<CR>
nnoremap <A-l> :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

" Switch to Other Buffer
nnoremap <leader>bb :b#<CR>
nnoremap <leader>` :b#<CR>

" Delete Buffer
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bD :bwipeout<CR>

" Escape and Clear hlsearch
inoremap <esc> <C-[>:nohlsearch<CR>
nnoremap <esc> :nohlsearch<CR>

" Redraw / Clear hlsearch / Diff Update
nnoremap <leader>ur :nohlsearch<CR>:diffupdate<CR>:syntax sync fromstart<CR>

" Next/Prev Search Result
nnoremap n nzz
xnoremap n nzz
onoremap n nzz
nnoremap N Nzz
xnoremap N Nzz
onoremap N Nzz

" Save File
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-O>:w<CR>
xnoremap <C-s> <C-C>:w<CR>
snoremap <C-s> <Esc>:w<CR>

" Keywordprg
nnoremap <leader>K :call Keywordprg()<CR>

" Add Comment
" TODO: This doesn't work in rider
" nnoremap gco ???
" nnoremap gcO ???

" Lazy
nnoremap <leader>l :Lazy<CR>

" New File
nnoremap <leader>fn :enew<CR>

" Location List
nnoremap <leader>xl :lopen<CR>
nnoremap <leader>xq :copen<CR>

" Quickfix List Navigation
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>

" Format
nnoremap <leader>cf :call Format()<CR>
vnoremap <leader>cf :call Format()<CR>

" Diagnostics
nnoremap <leader>cd :call LineDiagnostics()<CR>
nnoremap ]d :call NextDiagnostic()<CR>
nnoremap [d :call PrevDiagnostic()<CR>
nnoremap ]e :call NextError()<CR>
nnoremap [e :call PrevError()<CR>
nnoremap ]w :call NextWarning()<CR>
nnoremap [w :call PrevWarning()<CR>

" Toggle Auto Format
nnoremap <leader>uf :call ToggleAutoFormatGlobal()<CR>
nnoremap <leader>uF :call ToggleAutoFormatBuffer()<CR>

" Toggle Spelling
nnoremap <leader>us :setlocal spell!<CR>

" Toggle Word Wrap
nnoremap <leader>uw :setlocal wrap!<CR>

" Toggle Relative Line Numbers
nnoremap <leader>uL :setlocal relativenumber!<CR>

" Toggle Line Numbers
nnoremap <leader>ul :setlocal number!<CR>

" Toggle Diagnostics
nnoremap <leader>ud :call ToggleDiagnostics()<CR>

" Toggle Conceal
nnoremap <leader>uc :setlocal conceallevel=0<CR>

" Toggle Inlay Hints
nnoremap <leader>uh :call ToggleInlayHints()<CR>

" Toggle Treesitter Highlight
nnoremap <leader>uT :call ToggleTreesitterHighlight()<CR>

" Toggle Background
nnoremap <leader>ub :call ToggleBackground()<CR>

" Lazygit
nnoremap <leader>gg :LazyGit<CR>
nnoremap <leader>gG :LazyGitCwd<CR>

" Git Blame Line
nnoremap <leader>gb :GitBlameLine<CR>

" Lazygit Current File History
nnoremap <leader>gf :LazyGitCurrentFileHistory<CR>

" Lazygit Log
nnoremap <leader>gl :LazyGitLog<CR>

" Quit All
nnoremap <leader>qq :qa<CR>

" Inspect Position
nnoremap <leader>ui :InspectPos<CR>
nnoremap <leader>uI :InspectTree<CR>

" Terminal
nnoremap <leader>ft :call TerminalRoot()<CR>
nnoremap <leader>fT :call TerminalCwd()<CR>
nnoremap <C-/> :call TerminalRoot()<CR>
tnoremap <C-_> <C-\><C-n>:call TerminalRoot()<CR>
tnoremap <esc><esc> <C-\><C-n>
tnoremap <C-/> <C-\><C-n>:call HideTerminal()<CR>

" Window Management
nnoremap <leader>ww <C-w>p
nnoremap <leader>wd :close<CR>
nnoremap <leader>w- :split<CR>
nnoremap <leader>w| :vsplit<CR>
nnoremap <leader>- :split<CR>
nnoremap <leader>| :vsplit<CR>
nnoremap <leader>wm :MaximizeToggle<CR>
nnoremap <leader>m :MaximizeToggle<CR>

" Tab Management
nnoremap <leader><tab>l :tablast<CR>
nnoremap <leader><tab>f :tabfirst<CR>
nnoremap <leader><tab><tab> :tabnew<CR>
nnoremap <leader><tab>] :tabnext<CR>
nnoremap <leader><tab>d :tabclose<CR>
nnoremap <leader><tab>[ :tabprevious<CR>
