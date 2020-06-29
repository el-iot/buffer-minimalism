<h1> Buffer-Minimalism </h1>

<h2> What is it? </h2>
A simple vim-plugin for closing those buffers you've been compulsively hoarding. The plug exposes a function "BufferMinimalism" which will close any buffers that haven't been opened or written to in the past hour (though this period is configurable). <br>

This is particularly useful for users of <a href='https://github.com/jceb/vmux'>vmux</a> and <a href='https://github.com/tpope/vim-obsession'>vim-obsession</a>.<br>

Importantly, `buffer-minimalism` does <b>not</b> only use the last write-time (<code>getftime</code>) of any file in any buffer when deciding which buffers to delete. This is because there might be some files that you are <b>looking at</b> a lot, but not actually reading or writing to (documentation, for example). Instead, every time you enter a buffer the plugin will update a buffer-variable called <code>last_read_time</code> to the current timestamp, and the plugin defaults to using this when closing buffers. If <code>last_read_time</code> is not set on a given buffer (this would most often happen when you first install `buffer-minimalism` with buffers currently open), then the plugin will fall back onto using <code>getftime</code>.

<h2> Installation </h2>
Add this line to your <code>init.vim</code> / <code>.vimrc</code> file (though you may need to modify it slightly if you use a different plugin manager.

```
Plug 'el-iot/buffer-minimalism.vim'
```

<h2>Configuration</h2>

<code>g:minimalism_time (default=60*60*24)</code> - The time period (in seconds) that a buffer must have been read / written to in recent history for it to <b>not</b> be deleted.

<code>g:minimalism_whitelist (default=[])</code> - A list of patterns to match against filenames that should not be deleted in any case.

<h2>Usage</h2>

Simply run
```
:BufferMinimalism
```
to declutter your buffers.

<h2>Contributing</h2>
Please do! If you find the plugin useful then any contributions are welcome.
