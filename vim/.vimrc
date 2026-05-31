" Leader key
let mapleader = " "

" Basic settings
set termguicolors
set background=dark
syntax enable
filetype plugin indent on

set number
set relativenumber
set cursorline
set showmatch
set laststatus=2
set signcolumn=yes
set colorcolumn=100

" Colorscheme - VS Code Dark+ inspired
highlight Normal guifg=#d4d4d4 guibg=#1e1e1e
highlight CursorLine guibg=#2a2d2e
highlight LineNr guifg=#6e7681 guibg=#1e1e1e
highlight CursorLineNr guifg=#ffd866 guibg=#2a2d2e gui=bold
highlight ColorColumn guibg=#2a2d2e
highlight SignColumn guibg=#1e1e1e
highlight VertSplit guifg=#3c3c3c guibg=#1e1e1e
highlight EndOfBuffer guifg=#1e1e1e guibg=#1e1e1e

highlight Comment guifg=#6a9955 gui=italic
highlight Constant guifg=#ce9178
highlight String guifg=#ce9178
highlight Character guifg=#ce9178
highlight Number guifg=#b5cea8
highlight Boolean guifg=#569cd6
highlight Float guifg=#b5cea8
highlight Identifier guifg=#9cdcfe
highlight Function guifg=#dcdcaa
highlight Statement guifg=#c586c0
highlight Conditional guifg=#c586c0
highlight Repeat guifg=#c586c0
highlight Label guifg=#c586c0
highlight Operator guifg=#d4d4d4
highlight Keyword guifg=#569cd6
highlight Exception guifg=#c586c0
highlight PreProc guifg=#c586c0
highlight Include guifg=#c586c0
highlight Define guifg=#c586c0
highlight Macro guifg=#c586c0
highlight Type guifg=#4ec9b0
highlight StorageClass guifg=#569cd6
highlight Structure guifg=#4ec9b0
highlight Typedef guifg=#4ec9b0
highlight Special guifg=#d7ba7d
highlight SpecialChar guifg=#d7ba7d
highlight Tag guifg=#569cd6
highlight Delimiter guifg=#d4d4d4
highlight SpecialComment guifg=#6a9955 gui=italic
highlight Error guifg=#f44747 guibg=#1e1e1e gui=bold
highlight Todo guifg=#1e1e1e guibg=#ffd866 gui=bold

highlight Search guifg=#1e1e1e guibg=#ffd866
highlight IncSearch guifg=#1e1e1e guibg=#ff9e64
highlight Visual guibg=#264f78
highlight MatchParen guifg=#ffffff guibg=#515c6a gui=bold
highlight Pmenu guifg=#d4d4d4 guibg=#252526
highlight PmenuSel guifg=#ffffff guibg=#094771
highlight StatusLine guifg=#ffffff guibg=#007acc
highlight StatusLineNC guifg=#9e9e9e guibg=#333333

" Toggle relative line numbers (Space + tr)
nnoremap <silent> <leader>tr :set relativenumber!<CR>:set relativenumber?<CR>

" OSC52 clipboard (copy to system clipboard via terminal escape sequence)
function! s:Osc52Yank(text) abort
  let l:encoded = system('base64 | tr -d "\n"', a:text)
  call writefile(["\x1b]52;c;" . l:encoded . "\x07"], '/dev/tty', 'b')
endfunction

function! s:Osc52YankReg(reg) abort
  call s:Osc52Yank(getreg(a:reg))
endfunction

xnoremap <leader>y y:<C-u>call <SID>Osc52YankReg('"')<CR>

augroup osc52_yank
  autocmd!
  autocmd TextYankPost * if v:event.operator ==# 'y' | call <SID>Osc52YankReg(v:event.regname ==# '' ? '"' : v:event.regname) | endif
augroup END
