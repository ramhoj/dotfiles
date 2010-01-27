colorscheme twilight
set guicursor=a:blinkon0
set guifont=Monaco:h14

nnoremap <D-e> :NERDTree<CR> 

" fullscreen maximizes vertically AND horizontally
set fuoptions=maxvert,maxhorz

" Disable bell.
set vb t_vb=

" Unmap Apple+T so we can...
macmenu &File.New\ Tab key=<nop>
" Change Apple+T to TextMate Like Fuzzy Finder
nnoremap <D-t> :FuzzyFinderTextMate<CR> 

" Unmap Apple+Shift+T so we can...
macmenu &File.Open\ Tab\.\.\. key=<nop>
" Change Apple+Shift+T to TextMate Like Fuzzy Finder
nnoremap <D-T> :FuzzyFinderTag!<CR> 

" Fuzzy find files in project a la TextMate
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;files/**;vendor/**;coverage/**;tmp/**,public/image/**"
let g:fuzzy_enumerating_limit = 20
"let g:fuzzy_path_display = 'relative_path'
"let g:fuzzy_ceiling = 5000

" Use FuzzyFinder to replace built-in tag navigation :tag and <C-]>:
"nnoremap <silent> <C-f><C-t> :FuzzyFinderTag!<CR>
"nnoremap <silent> <C-]>      :FuzzyFinderTag! <C-r>=expand('<cword>')<CR><CR>

