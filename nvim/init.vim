if has("syntax")
  syntax on
endif

filetype plugin indent on     
let g:python3_host_prog = '/home/wym/miniconda3/bin/python3'
" 设置编码===========================================================================================
"set paste 该设置和括号自动补全，coc自动补全冲突！！！
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set nocompatible            " 关闭 vi 兼容模式
" Centralize backups, swapfiles and undo history
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
set undodir=~/.config/nvim/undo
set number  "显示行号
set relativenumber "设置相对行号
set ruler
set nrformats= "设置所有数字为十进制
set tabstop=4  "设置Tab长度为4空格
set shiftwidth=4  " 设定 << 和 >> 命令移动时的宽度为 4
set autoindent  "继承前一行的缩进方式，适用于多行注释
set cursorline   " 突出显示当前行
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set hlsearch                " 搜索时高亮显示被找到的文本

"set pythonthreedll=python37.dll "设置支持3.7
set mouse=a        "启用鼠标
"标示不必要的空白字符:这会将多余的空白字符标示出来，很可能会将它们变成红色突出。
"highlight BadWhitespace ctermbg=red guibg=darkred
hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"设置系统剪切板，需要sudo apt install xclip
set clipboard+=unnamedplus

"分割窗口vim在编辑的时候就可以打开多个文件：
":vs  或者 :vsplit  将当前窗口竖直分割，并在上面新窗口中显示当前文件
":vs filename 将当前窗口竖直分割，新文件在新窗口中显示
":sp 或者:sv或者:split  将当前窗口水平分割，并在左边新窗口中显示当前文件
":sp filename 将当前窗口竖直分割，新文件在左边新窗口中显示
":new 新建文件并竖直分割
":vnew 新建文件并水平分割

"在窗口之间切换可以用鼠标，如果不想用鼠标，切换按键如下：
"Ctrl-w-j 切换到下方的分割窗口
"Ctrl-w-k 切换到上方的分割窗口
"Ctrl-w-l 切换到右侧的分割窗口
"Ctrl-w-h 切换到左侧的分割窗口
"快速移动
nnoremap J 5jzz
nnoremap K 5kzz
"按键映射
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"shift + 上下左右调整窗口大小
nnoremap <S-Up> :resize -1<CR>
nnoremap <S-Down> :resize +1<CR>
nnoremap <S-Left> :vertical resize -1<CR>
nnoremap <S-Right> :vertical resize +1<CR>
"系统剪切板复制粘贴
vnoremap <C-y> "+y   "支持在Visual模式下，通过C-y复制到系统剪切板
nnoremap <C-p> "*p   "支持在normal模式下，通过C-p粘贴系统剪切板

"代码折叠：使用zc按键来创建折叠，使用za来打开或者关闭折叠。za经常会误输入，可以用空格键来替代za：
set foldmethod=indent
"set foldlevel=99
nnoremap <space> za


"按F7运行文件
map <F7> :call Runcode()<CR>
func! Runcode()
	exec "w"
	if &filetype == 'c'
        	exec '!g++ % -o %<'
       		exec '!./%<'
	elseif &filetype == 'cpp'
		exec '!g++ % -o %<'
        	exec '!./%<'
    	elseif &filetype == 'python'
        	exec '!python %'
    	elseif &filetype == 'sh'
        	:!bash %
    endif 
endfunc



filetype off                   "必须"

"插件====================================================================
call plug#begin()
Plug 'preservim/nerdtree' "树状目录
"添加树形目录nerdtree的git支持插件
Plug 'Xuyuanp/nerdtree-git-plugin'
"添加树形目录nerdtree的tab键插件
Plug 'jistr/vim-nerdtree-tabs'

Plug 'scrooloose/syntastic' "语法分析
Plug 'neoclide/coc.nvim',{'branch': 'release'} "coc插件
"CocList extensions 查看已经安装的插件
"CocInstall 插件名   安装coc插件
"CocUninstall 插件名  卸载coc插件
"CocInstall pyright 

Plug 'puremourning/vimspector' "Debug 插件
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_base_dir=expand( '$HOME/.vim/vimspector-config' )
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools']
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShownOutput
"F5	<Plug>VimspectorContinue	When debugging, continue. Otherwise start debugging.
"F3	<Plug>VimspectorStop	Stop debugging.
"F4	<Plug>VimspectorRestart	Restart debugging with the same configuration.
"F6	<Plug>VimspectorPause	Pause debuggee.
"F9	<Plug>VimspectorToggleBreakpoint	Toggle line breakpoint on the current line.
"<leader>F9	<Plug>VimspectorToggleConditionalBreakpoint	Toggle conditional line breakpoint or logpoint on the current line.
"F8	<Plug>VimspectorAddFunctionBreakpoint	Add a function breakpoint for the expression under cursor
"<leader>F8	<Plug>VimspectorRunToCursor	Run to Cursor
"F10	<Plug>VimspectorStepOver	Step Over
"F11	<Plug>VimspectorStepInto	Step Into
"F12	<Plug>VimspectorStepOut	Step out of current function scope

Plug 'tell-k/vim-autopep8'  "自动规范python代码格式，按F8.环境需安装autopep8包

"Plugin 'honza/vim-snippets'  "自动补全插件
"Plugin 'davidhalter/jedi-vim' "自动补全插件，按ctrl+space

Plug 'sillybun/vim-repl' " python 调试及设置 需要pip install ipdb
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'bash',
            \   'r': 'R',
            \   'lua': 'lua',
            \   'vim': 'vim -e',
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
let g:repl_output_copy_to_register = "t"
nnoremap <leader>r :REPLToggle<Cr>
nnoremap <leader>e :REPLSendSession<Cr>
let g:repl_position = 3
"    <C+w> 终端模式下进入普通模式。之后可输命令。后面可输
"    <C+w> 切换下一个窗口，或者<C+hjkl>进行窗口移动
"    shift+n （大N）进行终端窗口和普通窗口之间的切换

Plug 'Raimondi/delimitMate' "括号和引号匹配
Plug 'Yggdroot/indentLine'  "显示缩进
let g:indentLine_concealcursor = ''  "与vim-markdown冲突而设置,激活conceal特性

Plug 'ctrlpvim/ctrlp.vim'   "按ctrl+p，进行文件模糊搜索
Plug 'jiangmiao/auto-pairs' "自动补全括号
Plug 'kien/rainbow_parentheses.vim' "括号匹配颜色
Plug 'preservim/nerdcommenter'
"num\cc 注释接下来的num行
"num\cu 取消接下来几行的注释
"num\ci 更换接下来几行的注释状态
"添加美化状态栏vim-powerlien插件，可以显示当前的虚拟环境、Git分支、正在编辑的文件等信息
Plug 'Lokaltog/vim-powerline'

Plug 'godlygeek/tabular' "必要插件，安装在vim-markdown前面
Plug 'plasticboy/vim-markdown'
"查看所有配置建议
" :help vim-markdwon
" [[ "跳转上一个标题
" ]] "跳转下一个标题
" ]c "跳转到当前标题
" ]u "跳转到副标题
" zr "打开下一级折叠
" zR "打开所有折叠
" zm "折叠当前段落
" zM "折叠所有段落
" :Toc "显示目录
let g:vim_markdown_math = 1 "高亮公式

Plug 'mzlogin/vim-markdown-toc'
"在当前光标后生成目录
" :GenTocMarked
"更新目录
" :UpdateToc
" 删除最低目录层级
"取消储存时自动更新目录
let g:vmt_auto_update_on_save = 0
function RToc()
    exe "/-toc .* -->"
    let lstart=line('.')
    exe "/-toc -->"
    let lnum=line('.')
    execute lstart.",".lnum."g/           /d"
endfunction


Plug 'iamcco/markdown-preview.vim'
" 打开/关闭预览，Tab为快捷键
" :MarkdownPreview
map <Tab> :MarkdownPreview<CR>
" 指定浏览器路径
let g:mkdp_path_to_chrome = "/usr/bin/google-chrome"

"安装片段替换插件
Plug 'SirVer/ultisnips',{'for':'markdown'}

"设置tab键为触发键
let g:UltiSnipsExpandTrigger = '<tab>'
"设置向后跳转键
let g:UltiSnipsJumpForwardTrigger = '<tab>' 
"设置向前跳转键
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>' 
"设置文件目录
let g:UltiSnipsSnippetDirectories=["/home/wym/.vim/bundle/ultisnips"]
"设置打开配置文件时为垂直打开
let g:UltiSnipsEditSplit="vertical"

"安装插件，将剪切板中的图片插入为Markdown代码
Plug 'ferrine/md-img-paste.vim' 
"设置默认储存文件夹。这里表示储存在当前文档所在文件夹下的'pic'文件夹下，相当于 ./pic/
let g:mdip_imgdir = 'pic' 
"设置默认图片名称。当图片名称没有给出时，使用默认图片名称
let g:mdip_imgname = 'image'
"设置快捷键，个人喜欢 Ctrl+p 的方式，比较直观
autocmd FileType markdown nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>

call plug#end()
" 加载vim自带和插件相应的语法和文件类型相关脚本，必须"




"插件相关配置=========================================================================================
"NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""将F2设置为开关NERDTree的快捷键
map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<cr>

"在常规模式下按下F8即可以自动修正 插件autopep8
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
"去除窗口的对比
let g:autopep8_disable_show_diff=1

"rainbow-parentheses插件配置"
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"plug-vim常用命令
" :PlugList       - 查看已经安装的插件
" :PlugInstall    - 安装插件
" :PlugUpdate     - 更新插件
" :PlugSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PlugClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可

" F1 添加文件title和署名
map <F1> ms:call AddAuthor()<cr>'s
function AddAuthor()
    let n=1
    while n < 5
        let line = getline(n)
        if line =~'^\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction

function UpdateTitle()
    normal m'
    execute '/* Last modified\s*:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
    normal "
    normal mk
    execute '/* Filename\s*:/s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

function AddTitle()
    call append(0," #**********************************************************")
    call append(1," # Author        : YumiaoWu")
    call append(2," # Email         : 2111241@tongji.edu.cn")
    call append(3," # Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(4," # Filename      : ".expand("%:t"))
	call append(5," # coding        : UTF-8")
    call append(6," # Description   :")
    call append(7," # *******************************************************")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

"设置coc补全浮框颜色
hi CocFloating guifg=yellow guibg=red ctermfg=red ctermbg=black

"coc快捷键设置--GitHUb
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
