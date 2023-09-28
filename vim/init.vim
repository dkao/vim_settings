" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"runtime! debian.vim


" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
" runtime! archlinux.vim

" Set up pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim73/vimrc_example.vim or the vim manual
" and configure vim to your own liking!


" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set ruler		" Show cursor position all the time
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set mouse=n		" Enable mouse usage (normal mode only)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Custom options
" indentation
set autoindent
set smartindent
"set t_Co=256
" true color support
" works but nothing is tuned for guicolors yet
set termguicolors
"set background=dark
" color scheme that works well with dark or light backgrounds
"colorscheme delek
"colorscheme relaxedgreen
"colorscheme xoria256
" peaksea
" if ! has("gui_running")
"     set t_Co=256
" endif
" " set background=light gives a different style, feel free to choose between them.
" set background=dark
" colors peaksea
" K&R style
"set cinoptions=:0,p0,t0
" Documentation/CodingStyle
set cinoptions=:0,l1,t0,g0,(0
" comment style
set formatoptions=tcqlron
" configure split behavior
"set splitright
" highlight searches
set hlsearch
"hi Search cterm=reverse ctermbg=none
"hi SignColumn ctermbg=254
"hi CursorLineNr cterm=bold
""hi SignColumn ctermbg=235

"" vim-monotone
" reduce contrast
let g:monotone_contrast_factor = 0.9
colorscheme monotone
"" vimdiff
if &diff
  ""if 1
  "if ! has("gui_running")
  "  if $COLORTERM == 'gnome-terminal'
  "    set t_Co=256
  "  endif
  "  set background=dark
  "endif
  "colorscheme peaksea
  colorscheme xoria256
  "set guifont=Liberation\ Mono\ 9
endif
"" vimdiff from within vim
""au FilterWritePre * if &diff | colorscheme peaksea | endif
au FilterWritePre * if &diff | colorscheme xoria256 | endif
""au ColorScheme * if g:colors_name=="xoria256" | hi SignColumn ctermbg=235 | else | hi Search cterm=reverse ctermbg=none | hi SignColumn ctermbg=254 | endif
"au ColorScheme * if g:colors_name=="xoria256" | hi SignColumn ctermbg=235 | elseif g:colors_name=="zenburn" | hi SignColumn ctermbg=238 | elseif g:colors_name=="Tomorrow-Night" | hi SignColumn ctermbg=236 | else | hi Search cterm=reverse ctermbg=none | hi SignColumn ctermbg=254 | hi CursorLineNr cterm=bold | endif
""au ColorScheme * hi Search cterm=reverse ctermbg=none | hi SignColumn ctermbg=254
""au BufWinLeave * colorscheme default
au FileType gitcommit colorscheme xoria256
"" taglist toggle
""nnoremap <silent> <F8> :TlistToggle<CR>
""let Tlist_Inc_Winwidth = 0
"""let Tlist_Show_One_File = 1
""let Tlist_File_Fold_Auto_Close = 1
""let Tlist_WinWidth = 35

"set number
"set relativenumber
"au InsertEnter * :set norelativenumber
"au InsertLeave * :set relativenumber
let g:NumberToggleTrigger = "<F7>"

" tagbar toggle
nnoremap <silent> <F8> :TagbarToggle<CR>
" sort tags by order of appearance
let g:tagbar_sort = 0

"Dynamic Keyword Highlighting

" vim-gitgutter
nnoremap <silent> <F9> :GitGutterToggle<CR>
let g:gitgutter_escape_grep = 1
let g:gitgutter_enabled = 0

"" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'minimalist'
"if $USE_POWERLINE_FONTS == '1'
"  let g:airline_powerline_fonts = 1
"else
"  let g:airline_theme = 'sol'
"endif
"let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set noshowmode
let g:airline#extensions#whitespace#mixed_indent_algo = 2

" Colors from grayscale-theme.el
"let g:terminal_color_0  = '#000000'
let g:terminal_color_0  = '#2e2e2e'
let g:terminal_color_1  = '#bc8383'
let g:terminal_color_2  = '#7f9f7f'
let g:terminal_color_3  = '#d0bf8f'
let g:terminal_color_4  = '#6ca0a3'
let g:terminal_color_5  = '#dc8cc3'
let g:terminal_color_6  = '#8cd0d3'
let g:terminal_color_7  = '#868686'
let g:terminal_color_8  = '#474747'
let g:terminal_color_9  = '#dca3a3'
let g:terminal_color_10 = '#8fb28f'
let g:terminal_color_11 = '#f0dfaf'
let g:terminal_color_12 = '#94bff3'
let g:terminal_color_13 = '#ec93d3'
let g:terminal_color_14 = '#93e0e3'
let g:terminal_color_15 = '#e6e6e6'

lua << EOF
  require("cscope_maps").setup({})
EOF
