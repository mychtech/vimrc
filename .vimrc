"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
" インクリメンタルサーチ設定
set incsearch
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
"---------------------------------------------------------------------------
" 編集に関する設定:
" インデントするときの挿入するタブの幅
set shiftwidth=4
" KB入力するときの挿入するタブの幅 0==tabstop, !0=softtabstop
set softtabstop=4
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" インデント設定  autoindent,smartindent,cindent
set autoindent
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
" cindent時の詳細設定 cinoptions-values参照
"set cinoptions=
" バックスペースキー動作設定
"set backspace=indent,eol,start
"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" ソースコード折りたたみ機能を有効にする
" 設定数種類  manual,indent,expr,syntax,diff,marker
" zo:開く  zc:閉じる  zO,zC:再帰的に
set foldmethod=syntax
" カーソル上下行数 999なら常に中央
set scrolloff=999
" カーソル行に下線
set cursorline
"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"---------------------------------------------------------------------------
" 色設定
" 8     SpecialKey      スペシャルキー、^@など表示できない文字
" @     NonText EOF以降の~など
" d     Directory       CTRL-Dで表示したディレクトリ
" e     ErrorMsg        エラーメッセージ
" f     Folded  折り畳まれた行
" F     FoldColumn      フォールドコラム
" i     IncSearch       インクリメンタルサーチの結果
" l     Search  最後の検索結果
" m     MoreMsg -- 継続 -- のようなMoreメッセージ
" M     ModeMsg -- 挿入 -- などのモードメッセージ
" n     LineNr  行番号
" r     Question        hit-enterやyes/noなどの質問
" s     StatusLine      ステータスライン
" S     StatusLineNC    アクティブではないウィンドウのステータスライン
" t     Title   :set allや:autocmdなどで表示される「--- オプション ---」のような文字
" c     VertSplit       縦方向へのスプリットの境界
" v     Visual  ビジュアルモードの選択範囲
" V     VisualNOS       ビジュアルモードの選択範囲(Vimがアクティブではないとき)
" w     WarningMsg      警告メッセージ
" W     WildMenu        ワイルドメニュー
" たとえば、set highlight=n:ErrorMsg とすると、行番号がErrorMsgで指定した色に設定される。

" 全角スペース可視化
scriptencoding utf-8
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
colorscheme  default

" タブと行末の空白を可視化 test→
set listchars=tab:^_,trail:~
" タブや改行を表示
set list
"highlight SpecialKey cterm=underline ctermbg=white ctermfg=blue
highlight SpecialKey cterm=underline ctermbg=gray ctermfg=gray
"---------------------------------------------------------------------------
" .pcファイルをファイルタイプ.esqlcとして開く
au BufRead,BufNewFile *.pc     setfiletype esqlc
" 下記の設定は~/.vim/syntax/にdownloadしたproc.vimをcpすること
"au! BufRead,BufNewFile *.pc     setfiletype proc
"---------------------------------------------------------------------------
"ステータスライン関係
"ステータスラインを常に表示 0:nerver 1:if there two window
set laststatus=2
" ステータスライン表示内容 文字コード,改行,ファイル名
set statusline=[%{&fileencoding}][\%{&fileformat}]\ %F%m%r%=<%c:%l>
"---------------------------------------------------------------------------
" GNU Globalの設定
"Ctrl+t :Gtags と入力する
"Ctrl+h :カーソル下文字列でcurrentのソースコードの grep
"Ctrl+i 開いているファイルに定義されている関数の一覧を表示
"Ctrl+j カーソル位置の関数へジャンプ
"Ctrl+n 次の検索結果へジャンプする
"Ctrl+p 前の検索結果へジャンプする
map <C-t> :Gtags
map <C-h> :Gtags -gl<CR>
map <C-i> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
":Gtags 関数名        | 関数名 → ソースコード（定義）
":Gtags -r 関数名         | 関数名 → ソースコード（参照）
":Gtags -f ファイル名 | ソースコード → 関数一覧
"global -c 関数名一部 | 関数名の一部 → 関数一覧
":Gtags -g 検索文字列 | ソースコードの grep

"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup

"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch



" vimのプラグインの置き場所
set runtimepath+=c:/home/miyuki/.vim/

"fcitx
" 「日本語入力固定モード」の動作設定
let IM_CtrlMode = 6
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" <ESC>押下後のIM切替開始までの反応が遅い場合はttimeoutlenを短く設定（ミリ秒）
set timeout timeoutlen=3000 ttimeoutlen=100
" 「日本語入力固定モード」
let IM_CtrlMode = 1
" 「日本語入力固定モード」のvi協調モード
let IM_vi_CooperativeMode = 1 

" PythonによるIBus制御指定
let IM_CtrlIBusPython = 1
" バッファ毎に日本語入力固定モードの状態を制御
let g:IM_CtrlBufLocalMode = 1

""""""""""""""""""""""""""""""
" 日本語入力固定モードの制御関数(fcitx)
""""""""""""""""""""""""""""""
function! IMCtrl(cmd)
  let cmd = a:cmd
  if cmd == 'On'
    let res = system('fcitx-remote -o > /dev/null 2>&1')
  elseif cmd == 'Off'
    let res = system('fcitx-remote -c > /dev/null 2>&1')
  elseif cmd == 'Toggle'
    let res = system('fcitx-remote -t > /dev/null 2>&1')
  endif
  return ''
endfunction

" neobundle settings {{{
if has('vim_starting')
  set nocompatible
" neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'

"    通常(user/repositoryはそれぞれgithubのユーザ,リポジトリを入力)
"    []で囲っているものは省略可
"NeoBundle 'mychtech/vimrc'
"遅延読み込み(stringは'hoge'といった文字列,listは['hoge','foo','bar']といった文字列の集合)
"    filetypesにはhtml,css,c,cpp,java,ruby,eruby,pythonといったものを入れる
"    commandsには各プラグインのコマンドを入れる
"    insertはインサートモードに入ったときに読み込まれる
"    mappngsはプラグインで定められているマッピングを呼び出したとき
"    autoload内でそのプラグインに見合っただけ入れとけばオーケー(補完プラグインならinsertのみなど)
"NeoBundleLasy 'mychtech/vimrc', {
"  \ 'autoload' : {
"  \   'filetypes' : string|list,
"  \   'commands'  : string|list,
"  \   'mappings'  : string|list,
"  \   'insert'    : 1,
"  \ }}
"フェッチ(ランタイムパスに追加されないらしい)
"NeoBundleFetch 'mychtech/vimrc'
"その他オプション
"   スクリプトの実施
"  'build' : {'windows|mac|cygwin|unix|others' : string}
"   最小動作バージョンの記載(バージョンの書き方はいろいろある)
"  'vim_version' : '7|7.3|7.3.885'
"   無効化(conditionが1と評価された際にプラグインを無効化する)
"  'disabled : condition

NeoBundle 'Shougo/unite.vim'
" unite {{{
let g:unite_enable_start_insert=1
nmap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
nmap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nmap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
nmap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru<CR>
nmap <silent> <C-u><C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nmap <silent> <buffer> <ESC><ESC> q
au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q
" }}}

NeoBundle 'Shougo/neomru.vim', {
  \ 'depends' : 'Shougo/unite.vim'
  \ }

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ 'depends' : 'Shougo/vimproc',
    \ 'autoload' : { 'insert' : 1,}
    \ }
endif

" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" }}}

NeoBundleLazy 'Shougo/vimshell', {
  \ 'depends' : 'Shougo/vimproc',
  \ 'autoload' : {
  \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
  \                 'VimShellExecute', 'VimShellInteractive',
  \                 'VimShellTerminal', 'VimShellPop'],
  \   'mappings' : ['<Plug>(vimshell_switch)']
  \ }}

" vimshell {{{
nmap <silent> vs :<C-u>VimShell<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>
" }}}

NeoBundle 'LeafCage/yankround.vim'

" yankround.vim {{{
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 100
nnoremap <Leader><C-p> :<C-u>Unite yankround<CR>
"}}}

NeoBundleLazy 'Shougo/vimfiler', {
  \ 'depends' : ["Shougo/unite.vim"],
  \ 'autoload' : {
  \   'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer", "VimFilerBufferDir" ],
  \   'mappings' : ['<Plug>(vimfiler_switch)'],
  \   'explorer' : 1,
  \ }}


" vimfiler {{{
let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_data_directory       = expand('~/.vim/etc/vimfiler')
nnoremap <silent><C-u><C-j> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit -toggle<CR>
" }}}

NeoBundle 'Townk/vim-autoclose'

NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload' : { 'insert' : 1,}}

NeoBundle 'glidenote/memolist.vim'

" memolist {{{
let g:memolist_path = expand('~/memolist')
let g:memolist_gfixgrep = 1
let g:memolist_unite = 1
let g:memolist_unite_option = "-vertical -start-insert"
nnoremap mn  :MemoNew<CR>
nnoremap ml  :MemoList<CR>
nnoremap mg  :MemoGrep<CR>
" }}}

NeoBundle 'Lokaltog/vim-easymotion'
" vim-easymotion {{{
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'QZASDFGHJKL;'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
" }}}

NeoBundleLazy 'junegunn/vim-easy-align', {
  \ 'autoload': {
  \   'commands' : ['EasyAlign'],
  \   'mappings' : ['<Plug>(EasyAlign)'],
  \ }}

" vim-easy-align {{{
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
" }}}

NeoBundle 'rcmdnk/vim-markdown'
" vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
" }}}

" vimrcに記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
filetype plugin indent on

NeoBundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

"solarized
syntax enable 
if has('gui_running')
    set background=dark
else
    set background=light
endif
set runtimepath+=~/.vim/bundle/vim-colors-solarized/colors
let g:solarized_termtrans=1
let g:solarized_degrade=0
let g:solarized_bold=0
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast='normal'
let g:solarized_visibility='normal'
colorscheme solarized

