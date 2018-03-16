  " プラグイン関連
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/ec2-user/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/ec2-user/.cache/dein')
  call dein#begin('/home/ec2-user/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/ec2-user/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  "インデント可視化
  call dein#add('nathanaelkane/vim-indent-guides')

  " treeが見れる
  call dein#add('scrooloose/nerdtree')

  function s:MoveToFileAtStart()
    call feedkeys("\<Space>")
    call feedkeys("\s")
    call feedkeys("\l")
  endfunction
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " Required:
  call dein#end()
  call dein#save_state()
  endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了：
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

"キーバインド設定
inoremap <silent> jj <ESC>
map <C-n> :NERDTree<CR>

"VIM SETTING

" setting
" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" スワップファイルを作成しない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu
" 保存するコマンドの数
set history=500
"文字コードをUFT-8に設定
set fenc=utf-8
" 入力中のコマンドをステータスに表示する
set showcmd


" graphic
"
" 行、カーソル、位置判断材料
" 行番号を表示
set number
" 現在の行を強調
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
"ビープ音すべてを無効にする
set visualbell t_vb=
"エラーメッセージの表示時にビープを鳴らさない
set noerrorbells 

" Tab関連
" tab文字を半角スペースをする
set expandtab
" インデント幅
set shiftwidth=2
" タブキー押下時に挿入される文字幅を指定
set softtabstop=2
" ファイル内にあるタブ文字の表示幅
set tabstop=2
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
" インデントはスマートインデント
set smartindent
" 改行時に前の行のインデントを継続
set autoindent    
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<

" yでコピーした時にクリップボードに入る
set guioptions+=a
" 括弧入力時の対応する括弧を強調表示
set showmatch
" ノーマルモードで％を押せば対応する括弧に飛ぶ
" matchitプラグインを有効化すればrubyのdef...endも対応できる
source $VIMRUNTIME/macros/matchit.vim 
" タイトルを表示
set title
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" シンタックスハイライト
syntax on
" すべての数を10進数して扱う
set nrformats=
" カーソルを行頭行末で止まらないようにする(行をまたいで移動)
set whichwrap=b,s,h,l,<,>,[,],~
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
"検索時、大文字小文字を区別しない
set ignorecase

" マウス有効化
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

imap { {}<LEFT>
imap { []<LEFT>
imap { ()<LEFT>

" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" NERDTree's File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
