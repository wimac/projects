" File: Quote.vim
"
" Purpose: quote text (single words or visually selected regions)
"
" Syntax:
"	quote single word
"	:call Quote("starting_quote_char","second_quote_char")
"
"	quote visually selected area
"	:`<,`>call QuoteVisual("starting_quote_char","second_quote_char")
"
"	second argument is optional, if left out `starting_quote_char' is used
"
"	function QuoteVisual2() range
"	    quote visually selected area, version 2.
"	    The quote char is not entered as an argument but when processing
"	    the funtion. Very useful for mappings, .e.g. if "_" is the mapping
"	    then invoking "_/" will use "/" as the quote char.
"
"	Example mappings for QuoteVisual3:
"	    vmap _ :call QuoteVisual3()<CR>
"	    nmap _ viw:call QuoteVisual3()<CR>
"	Goodies: _( will produce these quotes: (...) (Similar are _[ and _{.)
"
" Author: Ralf Arens <ralf.arens@gmx.net>
" Last Modified: 2001-06-06 22:39:28 CEST
" + This file is getting more and more messed! Only QuoteVisual2 and the new
" + QuoteVisual3 are left. (OK, the rest is still there in comments). I have
" + two versions for QuoteVisual2, one for Vim5, the other for Vim6.
" + QuoteVisual3 is Vim6 only, besides it behaves more intelligently for
" + brackets.


" quote single words
"fun! Quote(startq, ...)
	" parse args
"	if a:0 > 0
"		let endq = a:1
"	else
"		let endq = a:startq
"	endif
"
	" one word back
"	norm ge
	" not on first byte of file?
"	if col(".") != 1
"		norm w
"	elseif line(".") != 1
"		norm w
"	endif
"	let startcol = col(".")
"	norm e
"	let endcol = col(".")
"	exe "norm ".endcol."|a".endq."".startcol."|i".a:startq."e"
"endfun


" quote visually selected area
"fun! QuoteVisual(startq, ...) range
"	if a:0 > 0
"		let endq = a:1
"	else
"		let endq = a:startq
"	endif
"	exe "norm `>a".endq.""
"	exe "norm `<i".a:startq."`>"
"endfun

" an example mapping for this function
"vmap _ :call QuoteVisual('"')<CR>
" Quote(...) is superfluous
"nmap _ viw:QuoteVisual('"')


" quote visually selected area, version 2
if v:version < 600
	fun! QuoteVisual2() range
		let @- = '#'
		exe 'norm "-Pr'
		exe "norm x`>\"-pm``<\"-P``"
	endfun
else
	fun! QuoteVisual2() range
		let @- = nr2char(getchar())
		exe "norm `>\"-pm``<\"-P``"
	endfun
endif

fun! QuoteVisual3() range
	let a = @a
	let @a = nr2char(getchar())
	if @a == "("
		let b = @b
		let @b = ")"
		exe "norm `>\"bpm``<\"aP``"
		let @b = b
	elseif @a == "["
		let b = @b
		let @b = "]"
		exe "norm `>\"bpm``<\"aP``"
		let @b = b
	elseif @a == "{"
		let b = @b
		let @b = "}"
		exe "norm `>\"bpm``<\"aP``"
		let @b = b
	else
		exe "norm `>\"apm``<\"aP``"
	endif
	let @a = a
endfun




" quote word with user-specified char
" Quote current word with a user-specified character.
" It does not work on the first word of a file!
"nmap _ :let@-='#'
"	\ \| exe 'norm "-Pr'
"	\ \| exe 'norm xgew"-Pe"-p'<CR>


" vim: set tw=8 sw=8 sts=8
