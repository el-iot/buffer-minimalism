<h1> Buffer-Minimalism </h1>

<h2> What is it? </h2>
A simple vim-plugin for closing those buffers you've been compulsively hoarding. With `g:minimalism_time` set to 3600 (for example), the plug exposes a function "BufferMinimalism" which will close any buffers that haven't been opened or written to in the past hour.

<h2> Installation </h2>
Add this line to your `init.vim` / `.vimrc` file (though you may need to modify it slightly if you use a different plugin manager.

```
Plug 'el-iot/buffer-minimalism.vim'
```

<h2>Configuration</h2>

<b>g:minimalism_time</b> - The time period (in seconds) that a buffer must have been read / written to in recent history for it to *not* be deleted.
