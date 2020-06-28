augroup bufferminimalism
  autocmd!
  autocmd BufEnter * :let b:view_time = str2nr(strftime("%s"), 10) " record the entry time
augroup END

function s:GetEditTime(buffer_number)

  " try to use last view time
  let view_time = getbufvar(a:buffer_number, "view_time")
  if view_time != ""
    return view_time
  endif

  " use last edit time
  return getftime(expand("#". string(a:buffer_number) . ":p"))

endfunction

function! BufferMinimalism()

  if exists('g:minimalism_time')
    let threshold = g:minimalism_time
  else
    let threshold = 3600
  endif

  let current_buffer_number = bufnr('%')
  let current_time = str2nr(strftime("%s"), 10)
  let n_deleted = 0

  for buffer_number in nvim_list_bufs()
    let buffer_time = s:GetEditTime(buffer_number)
    if nvim_buf_is_loaded(buffer_number) && (buffer_number != current_buffer_number) && (current_time - buffer_time > threshold)
      let n_deleted = n_deleted + 1
      execute ":bd " . string(buffer_number)
    endif
  endfor

  if n_deleted > 0
    echo string(n_deleted) . " buffers deleted!"
  else
    echo "Nothing to do!"
  endif

endfunction

command! BufferMinimalism call BufferMinimalism()
