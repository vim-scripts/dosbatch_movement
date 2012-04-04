" dosbatch_movement.vim: Movement over MSDOS batch file functions / labels with ]m etc.
"
" This filetype plugin provides movement commands and text objects for MSDOS
" batch file functions and labels.
"
" DEPENDENCIES:
"   - CountJump.vim, CountJump/Motion.vim, CountJump/TextObjects.vim autoload
"     scripts
"
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.001	04-Apr-2012	file creation from vim_movement.vim

" Avoid installing when in unsupported Vim version.
if v:version < 700
    finish
endif

let s:patternFunctionBegin = '^:\h\w*\>'
let s:patternFunctionEnd = '^\%((goto:EOF)\|goto:EOF\|(\?exit\>\|.\ze\n*::[-=*]\|.\ze\n*:\h\w*\>\)'

"			Move around MSDOS batch file functions / labels.
"			A new section is also defined by a comment starting with
"			::- or ::= or ::*.
"]m			Go to [count] next start of a function / label.
"]M			Go to [count] next end of a function / label.
"[m			Go to [count] previous start of a function / label.
"[M			Go to [count] previous end of a function / label.

call CountJump#Motion#MakeBracketMotion('<buffer>', 'm', 'M', s:patternFunctionBegin, s:patternFunctionEnd, 0)

"im			"inner method" text object, select [count] function /
"			label contents.
"am			"a method" text object, select [count] function / label,
"			including the function / label definition and end.
call CountJump#TextObject#MakeWithCountSearch('<buffer>', 'm', 'ai', 'V', s:patternFunctionBegin, s:patternFunctionEnd)

unlet s:patternFunctionBegin
unlet s:patternFunctionEnd

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
