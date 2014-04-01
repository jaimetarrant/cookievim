" CookieVim - Jaime's Vim Config.

" My vim setup uses Vundle to manage plugin updates. 
" Firstly, lets setup Vundle as per Vundle's recommendations:
"

" Setup Vundle
" ------------

set nocompatible                                    
filetype off                                        " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle                          " required! 

Bundle 'gmarik/vundle'

filetype plugin indent on                           " required!

" Some additional pre-configurations {
" ------------------------------------
"

" Source Bundles the Cookie way {
" -------------------------------
"
" Bundles are sourced from the .vim/cookievim/bundle-includes/ directory. All
" files within this directory will be loaded, just create a new file for
" the new plugin. i.e. 
"
"   nerdtree.config 
"
" If you want to remove a plugin, simply delete the file or move it out of
" this directory to keep a backup. Then run :BundleClean to update vim. 
"
" All you need to remember about this config is the following: 
"
" (1) Create a new file for each plugin that you want to use.
" (2) Put the repository in that file using the " Bundle ' ... ' " syntax. 
" (3) Put plugin specific configurations in that file too. 
" (4) Put personal vim configurations and everything else either in your .vimrc
"     or in the ~/.vim/cookievim/personal/personal.vim file. 
"
" }

" Load the plugin repository and configuration files {
" ----------------------------------------------------
"
"
for f in split(glob('~/.cookievim-config/bundle-loaded/*.config'), '\n')
    if filereadable(expand(f))
        exe 'source' f
    else
        echom "Some errors ..."   " Might want implement this properly. 
    endif
endfor
" }


" Source personal configs {
" -------------------------
" 

for b in split(glob('~/.cookievim-config/personal/*'), '\n')
    if filereadable(expand(b))
        exe 'source' b
    else
        echom "Some errors ..."   " Might want implement this properly. 
    endif
endfor
" }

