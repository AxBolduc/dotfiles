---@meta
-- LuaLS type definitions for the Rex Lua API.
-- Hand-written from https://www.superlogical.com/rex/docs/reference/lua.md
-- Rex never loads this file; it exists only for the language server.

---@class rex.Ctx
---@field session_id? string
---@field block_id? string
---@field client_id? string
---@field origin? string
---@field server? string

---@class rex.KeyEvent
---@field keybinding string The key that was pressed.
---@field prefix? string[] For a sequence, the keys before it.

---@class rex.Binding
---@field key string The key or sequence, without its mode.
---@field mode? string
---@field action? string
---@field fn? function
---@field args? table
---@field source string Where it was bound, such as "keys.lua:3".

---@class rex.Mode
---@field name string
---@field exclusive boolean
---@field source string

---@class rex.ActionSpec
---@field name string Lowercase letters, digits, and underscores.
---@field title string Shown in the command palette.
---@field run fun(ctx: rex.Ctx, args: table): any
---@field description? string
---@field category? string Defaults to "Actions".
---@field keywords? string
---@field args? table<string, "string"|"number"|"integer"|"boolean"|"object"|"array"|"any"|"string?"|"number?"|"integer?"|"boolean?"|"object?"|"array?"|"any?">|table Argument types, or a JSON Schema.
---@field repeats? boolean Run again while the key is held.

---@class rex.HostSpec
---@field label string
---@field endpoints? string[]
---@field endpoint? string
---@field id? string
---@field icon? string

---@class rex.ExecOpts
---@field cwd? string
---@field env? table<string, string|false>
---@field clear_env? boolean
---@field stdin? string|boolean
---@field timeout? number Seconds until SIGTERM (SIGKILL 2s later).
---@field stdout? false|fun(chunk: string)
---@field stderr? false|fun(chunk: string)
---@field text? boolean
---@field detach? boolean Only for rex.exec.start.

---@class rex.ExecResult
---@field code integer Exit status, or -1 if a signal ended the command.
---@field signal? string
---@field stdout string
---@field stderr string
---@field timed_out boolean
---@field ok boolean

---@class rex.ExecHandle
---@field pid integer
local ExecHandle = {}
---@param seconds? number
---@return rex.ExecResult|nil, string?
function ExecHandle:wait(seconds) end
---@param data string
---@return true|nil, string?
function ExecHandle:write(data) end
function ExecHandle:close_stdin() end
---@param signal? string|integer
function ExecHandle:kill(signal) end
---@return boolean
function ExecHandle:running() end

---@class rex.Exec
---@overload fun(argv: string[], opts?: rex.ExecOpts): rex.ExecResult|nil, string?
local Exec = {}
---Starts a command without waiting.
---@param argv string[]
---@param opts? rex.ExecOpts
---@return rex.ExecHandle|nil, string?
function Exec.start(argv, opts) end

---@class rex.Timer
local Timer = {}
function Timer:cancel() end
---@return boolean
function Timer:active() end

---@alias rex.Layout table

---@class rex.LayoutBlockSpec
---@field flavor string Such as "com.superlogical.terminal.shell".
---@field options? rex.TerminalOptions|table

---@class rex.TerminalOptions
---@field command? string[]
---@field shell? string "none" starts command directly.
---@field cwd? string
---@field initial_input? string
---@field exit? { on_completion?: boolean }

---@class rex.LayoutLib
local LayoutLib = {}
---@param spec rex.LayoutBlockSpec
---@return rex.Layout
function LayoutLib.block(spec) end
---@param ratio number Share given to a, 0..1.
---@param a rex.Layout
---@param b rex.Layout
---@return rex.Layout
function LayoutLib.horizontal(ratio, a, b) end
---@param ratio number Share given to a, 0..1.
---@param a rex.Layout
---@param b rex.Layout
---@return rex.Layout
function LayoutLib.vertical(ratio, a, b) end

---@alias rex.Call fun(args?: table): table|nil, string?

---@class rex.SessionLib
---@field view rex.Call
---@field list_blocks rex.Call
---@field list_clients rex.Call
---@field describe_block rex.Call
---@field new_window rex.Call
---@field new_split rex.Call
---@field new_block rex.Call
---@field new_layer rex.Call
---@field close_window rex.Call
---@field close_layer rex.Call
---@field move_block rex.Call
---@field swap_blocks rex.Call
---@field detach_block rex.Call
---@field float_block rex.Call
---@field zoom_block rex.Call
---@field resize_pane rex.Call
---@field resize_layer rex.Call
---@field raise_layer rex.Call
---@field lower_layer rex.Call
---@field move_window rex.Call
---@field focus_block rex.Call
---@field focus_window rex.Call
---@field focus_direction rex.Call
---@field focus_next_pane rex.Call
---@field focus_previous_pane rex.Call
---@field focus_next_window rex.Call
---@field focus_previous_window rex.Call
---@field set_label rex.Call
---@field set_window_label rex.Call
---@field set_block_label rex.Call
---@field attach rex.Call
---@field detach rex.Call
---@field help rex.Call
---@field [string] rex.Call

---@class rex.BlockLib
local BlockLib = {}
---Calls a method on a block, e.g. creator "com.superlogical.terminal".
---@param creator string
---@param method "format"|"process"|"pwd"|"title"|"size"|"write"|"reset"|"resize"|"set_theme"|"program_status"|"list_dir"|string
---@param args? table
---@return table|nil, string?
function BlockLib.call(creator, method, args) end

---@class rex.ClientLib
local ClientLib = {}
---Asks the client to perform one of its own actions, such as "pane.zoom".
---@param name string
---@param args? table
function ClientLib.queue(name, args) end

---@class rex.Server
---@field session rex.SessionLib
---@field block rex.BlockLib
---@field call fun(method: string, args?: table): table|nil, string?

---@class rex.Matcher

---@class rex.MatchLib
---@field uuid rex.Matcher
---@field id rex.Matcher
local MatchLib = {}
---@param dir string
---@return rex.Matcher
function MatchLib.under(dir) end

---@class rex.JsonLib
local JsonLib = {}
---@param value any
---@param opts? { indent?: boolean }
---@return string|nil, string?
function JsonLib.encode(value, opts) end
---@param text string
---@return any, string?
function JsonLib.decode(text) end

---@class rex
---@field session rex.SessionLib
---@field block rex.BlockLib
---@field client rex.ClientLib
---@field layout rex.LayoutLib
---@field exec rex.Exec
---@field match rex.MatchLib
---@field json rex.JsonLib
---@field args table Scripts only.
---@field session_id string Scripts only.
---@field block_id? string Scripts only.
rex = {}

---Binds a key (or "mode/key", or a sequence "a>b") to an action name or a function.
---@param key string
---@param action string|fun(ctx: rex.Ctx, ev: rex.KeyEvent): boolean?
---@param args? table
function rex.bind(key, action, args) end

---Removes bindings. Pass a key (and optional target), a binding from rex.bindings, or { mode = name }.
---@param key string|rex.Binding|{ mode: string }
---@param target? string|function
---@return integer
function rex.unbind(key, target) end

---@param name string
---@param options? { exclusive?: boolean }
function rex.mode(name, options) end

---@param filter? { key?: string, mode?: string, action?: string }
---@return rex.Binding[]
function rex.bindings(filter) end

---@return rex.Mode[]
function rex.modes() end

---@param spec rex.ActionSpec
function rex.action(spec) end

---@param name string
---@param args? table
---@return any, string?
function rex.invoke(name, args) end

---Calls any server method by full name (see "rex api list").
---@param method string
---@param args? table
---@return table|nil, string?
function rex.call(method, args) end

---Scripts only. Calls fn each time event happens.
---@param event string
---@param fn fun(ctx: rex.Ctx, ev: table)
function rex.on(event, fn) end

---Scripts only. Blocks until event happens.
---@param event string
---@param filter? table|fun(ev: table, ctx: rex.Ctx): boolean
---@param timeout? number
---@return table|nil ev, rex.Ctx|string ctx_or_err
function rex.wait(event, filter, timeout) end

---Scripts only.
---@param seconds number
function rex.sleep(seconds) end

---Scripts only.
---@param code? integer
function rex.stop(code) end

---Scripts only.
---@param seconds number
---@param fn fun(ctx: rex.Ctx)
---@return rex.Timer
function rex.after(seconds, fn) end

---Scripts only.
---@param seconds number
---@param fn fun(ctx: rex.Ctx)
---@return rex.Timer
function rex.every(seconds, fn) end

---@param spec rex.HostSpec
function rex.host(spec) end

---@return string[]
function rex.servers() end

---@param label string
---@return rex.Server
function rex.server(label) end

---Sets a dotted setting, e.g. rex.set("resume.trust.claude.dir", "~/code").
---@param key string
---@param value boolean|number|string|table|false
function rex.set(key, value) end

---@param level "debug"|"info"|"warn"|"error"|string
---@param message? string
function rex.log(level, message) end
