" basic settings
set ts=4        " tab width is 4 spaces
set expandtab
set cindent
set cino=e-4,n-4
set number
filetype on                  " required

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plug 'mileszs/ack.vim'
"Plug 'davidhalter/jedi-vim'
"autocmd FileType python noremap gd :call jedi#goto()<CR>

Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
" incsearch.vim x fuzzy x vim-easymotion
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

Plug 'python-mode/python-mode', { 'branch': 'develop' }
    let g:pymode_lint_cwindow = 0
    let g:pymode_options_colorcolumn = 0
    let g:pymode_options_max_line_length = 500
let g:pymode_python = 'python'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName="cuijialiang@bytedance.com"
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
Plug 'bling/vim-airline'
let g:airline_theme='simple'
Plug 'vim-airline/vim-airline-themes'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java']  }
Plug 'sgur/vim-textobj-parameter'

Plug 'skywind3000/vim-preview'
Plug 'vim-scripts/a.vim'

"Plug 'valloric/youcompleteme'
"let g:ycm_path_to_python_interpreter = 'python'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_show_diagnostics_ui = 0 "取消显示诊断信息

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
noremap <c-m> :LeaderfMru<cr>
noremap <c-f> :LeaderfFunction!<cr>
let g:Lf_MruMaxFiles = 2048
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_WildIgnore = {
			\ 'dir': ['.svn','.git','.hg', 'build64_release'],
			\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.a','*.py[co]', '*.so', 'lib*']
			\ }
let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
let g:Lf_MruMaxFiles = 2048
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.a,*lib,*/build64_realease/*,*.so.*,*.git*
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

Plug 'suan/vim-instant-markdown'
let g:instant_markdown_autostart = 0

call plug#end()

" shortcuts
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 1

map <F5> <Esc>:w<CR>:!clear;python %<CR>
