augroup bufferminimalism
  autocmd!
  autocmd BufEnter * :let b:view_time = str2nr(strftime("%s"), 10)
augroup END

function s:GetViewTime(buffer_number)
  return getbufvar(a:buffer_number, "view_time", getftime(expand("#". string(a:buffer_number) . ":p")))
endfunction

function! NotInWhiteList(buffer_number)
  let file_path = expand("#" . string(a:buffer_number) . ":p")
  for pattern in g:bufferminimalism_whitelist
    if matchstr(file_path, pattern) != ""
      return 0
    endif
  endfor
  return 1
endfunction

function! minimalism#BufferMinimalism()

  let current_buffer_number = bufnr('%')
  let now = str2nr(strftime("%s"), 10)
  let n_deleted = 0

  for buffer_number in map(filter(copy(getbufinfo()), 'v:val.listed'), 'v:val.bufnr')
    let buffer_time = s:GetViewTime(buffer_number)
    if (now - buffer_time > g:bufferminimalism_time) && (buffer_number != current_buffer_number) && NotInWhiteList(buffer_number)
      let n_deleted = n_deleted + 1
      execute ":bd " . string(buffer_number)
    endif

  endfor

  if n_deleted > 0
    echo string(n_deleted) . " buffers deleted!"
  else
    echo "Buffers Are Tidy!"
  endif

endfunction
