<h1> Buffer-Minimalism </h1>

<h2> What is it? </h2>
A simple vim-plugin for closing those buffers you've been compulsively hoarding. With `g:minimalism_time` set to 3600 (for example), the plug exposes a function "BufferMinimalism" which will close any buffers that haven't been opened or written to in the past hour. <br>

This is particularly useful for users of <a href='https://github.com/jceb/vmux'>vmux</a> and <a href='https://github.com/tpope/vim-obsession'>vim-obsession</a>.<br>

Importantly, `buffer-minimalism` does *not* only use the last write-time (`getftime`) of any file in any buffer when deciding which buffers to delete. This is because there might be some files that you are *looking at* a lot, but not actually reading or writing to (documentation, for example). Instead, every time you enter a buffer the plugin will update a buffer-variable called `last_read_time` to the current timestamp, and the plugin defaults to using this when closing buffers. If `last_read_time` is not set on a given buffer (this would most often happen when you first install `buffer-minimalism` with buffers currently open), then the plugin will fall back onto using `getftime`.

<h2> Installation </h2>
Add this line to your `init.vim` / `.vimrc` file (though you may need to modify it slightly if you use a different plugin manager.

```
Plug 'el-iot/buffer-minimalism.vim'
```

<h2>Configuration</h2>

<b>g:minimalism_time</b> - The time period (in seconds) that a buffer must have been read / written to in recent history for it to *not* be deleted.

<h2>Usage</h2>

Simply run
```
:BufferMinimalism
```
to declutter your buffers.

<h2>Contributing</h2>
Please do! If you find the plugin useful then any contributions are welcome.
