""HTML Settings


"HTML/XML tag wrapper
nmap ,t viw<Leader>t
vnoremap ,t <Esc>:call TagSelection()<CR>
nmap ,t viw<Leader>t
vnoremap ,t <Esc>:call TagSelection()<CR>


function! TagSelection()
  let l:tag = input("Tag name? ")
  " exec "normal `>a</" . l:tag . ">\e"
  " Strip off all but the first work in the tag for the end tag
  exec "normal `>a</" .
              \ substitute( l:tag, '[ \t"]*\(\<\w*\>\).*', '\1>\e', "" )
  exec "normal `<i"
              \ substitute( l:tag, '[ \t"]*\(\<.*\)', '<\1>\e', "" )
endfunction 

