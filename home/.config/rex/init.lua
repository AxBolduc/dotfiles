-- Rex config migrated from tmux, Ghostty and iTerm2.

-- tmux (~/.config/tmux/tmux.conf), prefix ctrl+a (prefix2 C-a, tmux.conf:26)
rex.mode("repeat", { exclusive = true })
rex.bind("ctrl+a>r", "client.mode.enter", { name = "repeat" })
rex.bind("repeat/enter", "client.mode.exit")
rex.bind("repeat/escape", "client.mode.exit")

rex.bind("ctrl+a>ctrl+a", "pane.send_key", { key = "ctrl+a" }) -- tmux.conf:29 (send-prefix: passes ctrl+a through)
rex.bind("ctrl+a>c", "client.tab.new")
rex.bind("ctrl+a>n", "client.tab.next")
rex.bind("ctrl+a>ctrl+c", "session.new") -- tmux.conf:67
rex.bind("ctrl+a>-", "pane.split", { direction = "down" }) -- tmux.conf:82
rex.bind("ctrl+a>shift+-", "pane.split", { direction = "right" }) -- tmux.conf:80
rex.bind("ctrl+a>h", "pane.focus", { direction = "left" }) -- tmux.conf:81
rex.bind("repeat/h", "pane.focus", { direction = "left" })
rex.bind("ctrl+a>j", "pane.focus", { direction = "down" }) -- tmux.conf:82
rex.bind("repeat/j", "pane.focus", { direction = "down" })
rex.bind("ctrl+a>k", "pane.focus", { direction = "up" }) -- tmux.conf:83
rex.bind("repeat/k", "pane.focus", { direction = "up" })
rex.bind("ctrl+a>l", "pane.focus", { direction = "right" }) -- tmux.conf:84
rex.bind("repeat/l", "pane.focus", { direction = "right" })
rex.bind("ctrl+a>shift+.", "pane.move", { direction = "down" }) -- tmux.conf:85
rex.bind("ctrl+a>shift+,", "pane.move", { direction = "up" }) -- tmux.conf:86
rex.bind("ctrl+a>shift+h", "pane.resize", { amount = 2, direction = "left" }) -- tmux.conf:92
rex.bind("repeat/shift+h", "pane.resize", { amount = 2, direction = "left" })
rex.bind("ctrl+a>shift+j", "pane.resize", { amount = 2, direction = "down" }) -- tmux.conf:93
rex.bind("repeat/shift+j", "pane.resize", { amount = 2, direction = "down" })
rex.bind("ctrl+a>shift+k", "pane.resize", { amount = 2, direction = "up" }) -- tmux.conf:94
rex.bind("repeat/shift+k", "pane.resize", { amount = 2, direction = "up" })
rex.bind("ctrl+a>shift+l", "pane.resize", { amount = 2, direction = "right" }) -- tmux.conf:95
rex.bind("repeat/shift+l", "pane.resize", { amount = 2, direction = "right" })
rex.bind("repeat/ctrl+h", "client.tab.previous")
rex.bind("repeat/ctrl+l", "client.tab.next")

rex.bind("ctrl+a>s", "session.switch")
rex.bind("ctrl+a>r", "session.rename")
