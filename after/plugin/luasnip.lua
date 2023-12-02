local ls = require "luasnip"
local types = require "luasnip.util.types"
-- local make = R("devfortunato.snips").make
local snippet_from_nodes = ls.sn
local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
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

local require_var = function(args, _)
  local text = args[1][1] or ""
  local split = vim.split(text, ".", { plain = true })

  local options = {}
  for len = 0, #split - 1 do
    table.insert(options, t(table.concat(vim.list_slice(split, #split - len, #split), "_")))
  end

  return snippet_from_nodes(nil, {
    c(1, options),
  })
end

ls.add_snippets("all", {
  -- basic, don't need to know anything else
  --    arg 1: string
  --    arg 2: a node
  s("simple", t "wow, you were right!"),
    s({ trig = "date" }, {
        f(function()
            return string.format(string.gsub(vim.bo.commentstring, "%%s", " %%s"), os.date())
        end, {}),
    }),
})
---
ls.add_snippets("markdown", {
    s("t", fmt("- [{}] {}", { c(2, { t " ", t "-", t "x" }), i(1, "task") })),
    s({
        trig = "link",
        namr = "markdown_link",
        dscr = "Create markdown link [txt](url)"
    },
        {
            t('['),
            i(1),
            t(']('),
            i(0),
            t(')'),
        }),
})

ls.add_snippets("go", {
    s("gom", fmt("func main(){{ \n {} \n }}", { i(1,"printf()")})),
})

ls.add_snippets("lua", {
    s("req", fmt([[local {} = require("{}")]], {
    d(2, require_var, { 1 }),
    i(1),
  })),
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")
