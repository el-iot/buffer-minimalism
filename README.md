```
  |              _|   _|
  __ \   |   |  |    |     _ \   __|
  |   |  |   |  __|  __|   __/  |
 _.__/  \__,_| _|   _|   \___| _|
            _)        _)                    | _)
  __ `__ \   |  __ \   |  __ `__ \    _` |  |  |   __|  __ `__ \
  |   |   |  |  |   |  |  |   |   |  (   |  |  | \__ \  |   |   |
 _|  _|  _| _| _|  _| _| _|  _|  _| \__,_| _| _| ____/ _|  _|  _|
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

to declutter your buffers. <br>

Alternatively you can use

```
:BufferMinimalismList
```

to show how long each buffer has been unused for, i.e:

```
:BufferMinimalismList

#3: todo  -> 1 day, 7 hours, 38 minutes, 38 seconds
#4: minimalism.vim  -> 1 hour, 17 minutes, 9 seconds
#5: buffer-minimalism.vim  -> 2 days, 4 hours, 41 seconds
#6: .tmux.conf  -> 2 days, 2 hours, 46 minutes, 59 seconds
#7: external_apps_manager.py  -> 1 day, 8 hours, 2 minutes
#8: ssh-status  -> 2 days, 2 hours, 48 minutes, 14 seconds
#9: count-docker-containers  -> 2 days, 2 hours, 47 minutes, 38 seconds
#10: .zshrc  -> 2 days, 1 hour, 20 minutes, 50 seconds
#12: direnvrc  -> 2 days, 2 hours, 27 minutes, 37 seconds
#13: init.vim  -> 3 days, 22 hours, 5 minutes, 28 seconds
#14: lsp.lua  -> 1 day, 6 hours, 38 minutes, 9 seconds
#25: README.md  -> 45 seconds
#26: tree.vim  -> 1 hour, 18 minutes, 2 seconds
#29: wikipedia_browser.vim  -> 24 minutes, 27 seconds
#30: get_page.sh  -> 38 minutes, 10 seconds
#31: search.sh  -> 1 hour, 10 minutes, 7 seconds

```

<h2>Contributing</h2>
Please do! If you find the plugin useful then any contributions are welcome.
