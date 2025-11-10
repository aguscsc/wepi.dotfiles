set number
call plug#begin()
Plug 'rust-lang/rust.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'AntonVanAssche/md-headers.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"gruvbox theme"
lua << EOF
require'nvim-treesitter.configs'.setup {
  auto_install = true,

  ensure_installed = {
    "markdown", "markdown_inline",
    "lua", "vim", "bash", "json"
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true
  },
}
EOF



set background=dark

lua << EOF
require("gruvbox").setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  contrast = "",
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for planning"
set termguicolors
syntax on

highlight TodoHighlight    ctermfg=Yellow guifg=#FFFF00 cterm=bold gui=bold
highlight DoneHighlight    ctermfg=Green  guifg=#00FF00 cterm=bold gui=bold
highlight BlockedHighlight ctermfg=Red    guifg=#FF0000 cterm=bold gui=bold
highlight NoteHighlight    ctermfg=Cyan   guifg=#00BFFF cterm=bold gui=bold

function! KeywordHighlights()
  call matchadd('TodoHighlight',    '\c\<TODO\>')
  call matchadd('DoneHighlight',    '\c\<DONE\>')
  call matchadd('BlockedHighlight', '\c\<BLOCKED\>\|\<ERROR\>')
  call matchadd('NoteHighlight',    '\c\<NOTE\>')
endfunction

augroup KeywordHighlight
  autocmd!
  autocmd BufEnter,BufReadPost *.txt,*.md call KeywordHighlights()
augroup END

"for writting"
"" Highlight content between custom tags
highlight RedTag    guifg=#FF5555 ctermfg=Red gui=bold
highlight GreenTag  guifg=#50FA7B ctermfg=Green gui=bold
highlight BlueTag   guifg=#8BE9FD ctermfg=Cyan gui=bold

function! CustomTagHighlights()
  call matchadd('RedTag',    '<red>.\{-}</red>')
  call matchadd('GreenTag',  '<green>.\{-}</green>')
  call matchadd('BlueTag',   '<blue>.\{-}</blue>')
endfunction

augroup CustomTagHighlight
  autocmd!
  autocmd BufEnter,BufReadPost *.txt,*.md call CustomTagHighlights()
augroup END
highlight AlertLine  guifg=#FF5555 ctermfg=Red gui=bold
highlight OkLine     guifg=#50FA7B ctermfg=Green gui=bold
highlight InfoLine   guifg=#8BE9FD ctermfg=Cyan gui=bold
highlight SubSection guifg=#a16300 ctermfg=brown gui=bold
function! PrefixHighlights()
  call matchadd('AlertLine', '^!!.*')
  call matchadd('OkLine',    '^>>.*')
  call matchadd('InfoLine',  '^??.*')
  call matchadd('SubSection',  '^#.*')
endfunction

augroup PrefixLineHighlight
  autocmd!
  autocmd BufEnter,BufReadPost *.txt,*.md call PrefixHighlights()
augroup END

" ─────────────────────────────────────────────────────────────────────────────
" Hide <blue>…</blue> in Normal/Visual, reveal it in Insert
" ─────────────────────────────────────────────────────────────────────────────
augroup HideTags
  autocmd!
  " Define the two syntax matches and mark them as conceal
  autocmd FileType * syntax match BlueTagStart /<blue>/    conceal
  autocmd FileType * syntax match BlueTagEnd   /<\/blue>/  conceal

  autocmd FileType * syntax match GreenTagStart /<green>/    conceal
  autocmd FileType * syntax match GreenTagEnd /<\/green>/    conceal
  
  autocmd FileType * syntax match RedTagStart   /<red>/  conceal 
  autocmd FileType * syntax match RedTagEnd   /<\/red>/  conceal
  " Link those to the built-in Conceal group (so they really vanish)
  autocmd FileType * highlight default link BlueTagStart Conceal
  autocmd FileType * highlight default link BlueTagEnd   Conceal
  autocmd FileType * highlight default link GreenTagStart Conceal
  autocmd FileType * highlight default link GreenTagEnd Conceal
  autocmd FileType * highlight default link RedTagStart Conceal
  autocmd FileType * highlight default link RedTagEnd Conceal
augroup END

" Tell Neovim to:
" • conceallevel=2 → fully hide concealed text (no placeholder)
" • concealcursor=nv → only apply conceal when in Normal/Visual modes
set conceallevel=2
set concealcursor=nv
"green, red and blue commands
inoremap <silent> <A-1> <blue></blue><Esc>F>a
inoremap <silent> <A-2> <green></green><Esc>F>a
inoremap <silent> <A-3> <red></red><Esc>F>a


if has('termguicolors')
  set termguicolors
endif
colorscheme gruvbox

