" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).gvimo
	"Pathogen"
	execute pathogen#infect()


	"DOX"
	let g:DoxygenToolkit_briefTag_pre="@brief " 
	let g:DoxygenToolkit_paramTag_pre="@param " 
	let g:DoxygenToolkit_returnTag="@return " 
	let g:DoxygenToolkit_authorName="Ceyhan Koza (u_178)" 
	let g:DoxygenToolkit_authorTag="@author "
	let g:DoxygenToolkit_dateTag="@since "
	let g:DoxygenToolkit_compactDoc="yes"

	"------------------------------------------------------------"
    function SetTags()
    let curdir = getcwd()

    while !filereadable("tags") && getcwd() != "/"
        cd ..
    endwhile

    if filereadable("tags")
        execute "set tags=" . getcwd() . "/tags"
    endif

        execute "cd " . curdir
    endfunction

    call SetTags()

    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
    au BufWinLeave * mkview
    au BufWinEnter * silent loadview
        "autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => MAPPING
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    map <a-down> yyp
    map <C-c> "+y
    map <C-v> "+p
    map <a-up> yyP
    map <s-down> ddp
    map <s-up> dd<up>P
    map <M-Left> <C-T>
    map <M-Right> <C-]>
	map ,t <Esc>:tabnew<CR>
    " Bubble multiple lines
    vmap <S-down> xp`[V`]
    vmap <S-up> xkP`[V`]
    "//inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
	
    nnoremap M A //By Ceyhan Koza (u_178) (<ESC>"=strftime("%Y-%m-%d")<CR>pA): 
    nnoremap <C-k> :tabnew **/

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""""""""
    " => Statusline
    """"""""""""""""""""""""""""""
    " Always hide the statusline
    set laststatus=2

    " Format the statusline
    set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SYNTASTIC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => highlight in html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" php
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let php_htmlInStrings=1 " highlight html code inside php string
let php_sql_query=1     " highlight mysql queries inside php string
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=de_DE.ISO_8859-1
set foldmarker=nnn,mmm
set foldmethod=manual
set number
set nowrap
set autoindent
set smartindent
set showmatch
set hlsearch
set history=500          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
"set bomb
set encoding=utf-8
set fileencoding=latin1
set fileencodings=latin1
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
"set noexpandtab


