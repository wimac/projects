echo "loading hacking settings"
source ~/.vim/skel/autoclose.vim
source ~/.vim/skel/taglist.vim

"NerdLIST settings
map <F6> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

""taglist settings
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_WinWidth = 30
map <F4> :TlistToggle<cr>
set tags=tags;~/.vim/tags/

"My Header functions:
map ,h <Esc>:call Header()<CR> 
autocmd BufWrite *   ks|call LastMod()|'s
autocmd BufWrite *   ks|call NewVer()|'s

function! Header()
        if line("$") < 5
            exe ":s/^/#$Id:"expand("%:t:r") strftime("%m-%d-%Y  %I:%M%p") $USER s:V_Email "ver:" strftime("%y.%j.%H%M")    "$"
        endif
endfun
function! NewVer()
        if &modified
           if line("$") > 5
            let v = 5
        else
            let v = line("$")
        endif
        exe "1," . v . "g/ver: /s/ver: .*/ver: " .
         \ strftime("%y.%j.%H%M")
    endif
endfun

function! LastMod()
        if &modified
           if line("$") > 5
            let l = 5
        else
            let l = line("$")
        endif
        exe "1," . l . "g/last modified: /s/last modified: .*/last modified: " .
            \ strftime("%m-%d-%Y  %I:%M%p") $USER
        endif
endfun

