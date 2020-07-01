let g:bufferminimalism_whitelist = get(g:, "bufferminimalism_whitelist", [])
let g:bufferminimalism_time = get(g:, "bufferminimalism_time", 60 * 60 * 24)

command! BufferMinimalism call minimalism#BufferMinimalism()
