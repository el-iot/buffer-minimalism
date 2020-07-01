```
 __        ___  ___  ___  __                                       __
|__) |  | |__  |__  |__  |__)     |\/| | |\ | |  |\/|  /\  |    | /__`  |\/|
|__) \__/ |    |    |___ |  \     |  | | | \| |  |  | /~~\ |___ | .__/  |  |
```

<h1> buffer-minimalism </h1>
A simple vim-plugin for closing those buffers you've been compulsively hoarding. This is particularly useful for users of <a href='https://github.com/jceb/vmux'>vmux</a> and <a href='https://github.com/tpope/vim-obsession'>vim-obsession</a>.<br>

<h2> Why? </h2>
I often have a <b>lot</b> of buffers open and many of them are for projects that I haven't touched in weeks. This plugin allows you to quickly delete any buffers you are no longer interested in without you needing to comb through your buffer list and select the buffers / directories you are no longer using. <br>

Importantly, `buffer-minimalism` does <b>not</b> only use the last write-time (<code>getftime</code>) of any file in any buffer when deciding which buffers to delete. This is because there might be some files that you are <b>looking at</b> a lot, but not actually reading or writing to (documentation, for example). Instead, every time you enter a buffer the plugin will update a buffer-variable called <code>last_read_time</code> to the current timestamp, and the plugin defaults to using this when closing buffers. If <code>last_read_time</code> is not set on a given buffer (this would most often happen when you first install `buffer-minimalism` with buffers currently open), then the plugin will fall back onto using <code>getftime</code>. <br>

You can also add a whitelist of buffers / patterns to never delete in the event that you want to keep certain buffers open no matter how long it's been since you used them.

<h2> Installation </h2>
Add this line to your <code>init.vim</code> / <code>.vimrc</code> file (though you may need to modify it slightly if you use a different plugin manager.

```
Plug 'el-iot/buffer-minimalism.vim'
```

and run

```
:PlugInstall
```

<h2>Configuration</h2>

<code>g:bufferminimalism_time (default=60\*60\*24)</code> - The time period (in seconds) that a buffer must have been read / written to in recent history for it to <b>not</b> be deleted.

<code>g:bufferminimalism_whitelist (default=[])</code> - A list of patterns to match against filenames that should not be deleted in any case.

<h2>Usage</h2>

Simply run
```
:BufferMinimalism
```
to declutter your buffers.

<h2>Contributing</h2>
Please do! If you find the plugin useful then any contributions are welcome.
