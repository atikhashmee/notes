
download gcc for windows from this link
set up environment path with mingw/bin folder
then install vim
and modifiy vimrc
and paste this line to your vim rc
```
autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++11 -O2 -Wall % -o %:r && %:r.exe <CR>
```
now write a c++ code and hit f5 from your keyboard
you are good to go. boss 
