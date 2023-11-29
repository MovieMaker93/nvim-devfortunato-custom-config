local ls = require "luasnip"
local types = require "luasnip.util.types"
-- local make = R("devfortunato.snips").make
local t = ls.text_node
local s = ls.snippet
ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = false,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " « ", "NonTest" } },
      },
    },
  },
}

ls.add_snippets("all", {
  -- basic, don't need to know anything else
  --    arg 1: string
  --    arg 2: a node
  s("simple", t "wow, you were right!"),
})

