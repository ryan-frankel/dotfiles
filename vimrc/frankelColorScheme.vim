" =============================================================================
" Filename: autoload/lightline/colorscheme/frankelColorScheme.vim
" Author: ryan-frankel
" License: MIT License
" Last Change: 2017/03/08
" =============================================================================
let s:yellow = [ '#cae682', 180 ]
let s:orange = [ '#e5786d', 173 ]
let s:red = [ '#e5786d', 203 ]
let s:magenta = [ '#f2c68a', 216 ]
let s:blue = [ '#8ac6f2', 117 ]
let s:cyan = s:blue
let s:green = [ '#95e454', 119 ]

let s:black = [ '#000000', 0 ]
let s:grayDarker = [ '#121212', 233 ]
let s:grayDark = [ '#262626', 235 ]
let s:gray = [ '#444444', 238 ]
let s:grayLight = [ '#6c6c6c', 242 ]
let s:grayLighter = [ '#a8a8a8', 248 ]
let s:grayLightest = [ '#e4e4e4', 254 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ [ s:gray, s:blue ], [ s:grayLightest, s:grayLight ] ]
let s:p.normal.right = [ [ s:gray, s:blue ], [ s:grayLight, s:grayLight ] ]

let s:p.inactive.right = [ [ s:gray, s:grayLight ], [ s:grayLight, s:gray ] ]
let s:p.inactive.left =  [ [ s:grayLight, s:gray ], [ s:grayLight, s:gray ] ]

let s:p.insert.left = [ [ s:gray, s:green ], [ s:grayLightest, s:grayLight ] ]
let s:p.replace.left = [ [ s:gray, s:red ], [ s:grayLightest, s:grayLight ] ]
let s:p.visual.left = [ [ s:gray, s:magenta ], [ s:grayLightest, s:grayLight ] ]

let s:p.normal.middle = [ [ s:grayLighter, s:grayDark ] ]
let s:p.inactive.middle = [ [ s:grayLight, s:gray ] ]

let s:p.tabline.left = [ [ s:grayLightest, s:grayLight ] ]
let s:p.tabline.tabsel = [ [ s:grayLightest, s:grayDark ] ]
let s:p.tabline.middle = [ [ s:grayLighter, s:gray ] ]
let s:p.tabline.right = [ [ s:grayLighter, s:grayLight ] ]

let s:p.normal.error = [ [ s:grayDark, s:red ] ]
let s:p.normal.warning = [ [ s:gray, s:yellow ] ]

let g:lightline#colorscheme#frankelColorScheme#palette = lightline#colorscheme#flatten(s:p)
