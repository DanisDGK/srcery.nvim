![screenshot](/assets/screenshot.png)

# About

This is my take on a lua port of [srcery-vim](https://github.com/srcery-colors/srcery-vim). 
Keep in mind this is an opinionated rendition of srcery, so it might change whenever my preferences change, but you _can_ override any highlights, so theoretically that shouldn't be a problem.

# Features

-   Extensible.
-   Integrations with a bunch of plugins (you're welcome to PR more):
    -   [Git Gutter](https://github.com/airblade/vim-gitgutter)
    -   [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
    -   [IndentBlankline](https://github.com/lukas-reineke/indent-blankline.nvim)
    -   [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
    -   [LSP Trouble](https://github.com/folke/trouble.nvim)
    -   [Lualine](https://github.com/nvim-lualine/lualine.nvim)
    -   [Native LSP](https://github.com/neovim/nvim-lspconfig)
    -   [Neogit](https://github.com/TimUntersberger/neogit)
    -   [Notify](https://github.com/rcarriga/nvim-notify)
    -   [Telescope](https://github.com/nvim-telescope/telescope.nvim)
    -   [Treesitter](https://github.com/tree-sitter/tree-sitter)
    -   [TS-Rainbow](https://github.com/p00f/nvim-ts-rainbow)
    -   [WhichKey](https://github.com/folke/which-key.nvim)

## Usage

Use whatever plugin manager you like, here are some examples:

#### Vim-plug

```lua
Plug 'DanisDGK/srcery.nvim'
```

#### Packer.nvim

```lua
use("DanisDGK/srcery.nvim")
```

#### Vundle

```lua
Plugin 'DanisDGK/srcery.nvim'
```

### Setup

The defaults are minimal, so you'll _probably_ want to enable some extras. For reference, these are the defaults:

```lua
transparent_background = false,
term_colors = true,
styles = {
    comments = "italic",
    functions = "italic",
    keywords = "italic",
    strings = "NONE",
    variables = "NONE",
},
integrations = {
    gitgutter = false,
    gitsigns = false,
    indent_blankline = {
        enabled = false,
        colored_indent_levels = false,
    },
    lsp_saga = false,
    lsp_trouble = false,
    native_lsp = {
        enabled = true,
        virtual_text = {
            errors = "italic",
            hints = "italic",
            warnings = "italic",
            information = "italic",
        },
        underlines = {
            errors = "underline",
            hints = "underline",
            warnings = "underline",
            information = "underline",
        },
    },
    neogit = false,
    notify = false,
    telescope = false,
    treesitter = true,
    ts_rainbow = false,
    which_key = false,
}
```

The way to change the settings varies based on whether you're using Vimscript or Lua in your configuration.

##### For Lua
```lua
require("srcery").setup(<settings>)
```

##### For Vimscript
```lua
lua << EOF
require("srcery").setup(<settings>)
EOF
```

After you've changed the settings to your liking, you can load the colorscheme like so:

##### For Lua
```lua
vim.cmd[[colorscheme srcery]]
```

##### For Vimscript
```lua
colorscheme srcery
```

### Configuration
Although the settings should be mostly self-explanatory, here is exactly what they do.

#### General
Settings that don't fit in the other groups.
- `transparent_background`: (Boolean) if true, disables the background.
- `term_colors`: (Boolean) if true, sets terminal colors (`:h terminal-config`).

#### Styles
Handles the styles of general highlight groups (`:h highlight-args`)
- `comments`: (String) changes the style of comments.
- `functions`: (String) changes the style of functions.
- `keywords`: (String) changes the style of keywords.
- `strings`: (String) changes the style of strings.
- `variables`: (String) changes the style of variables.

#### Integrations
The integrations change the highlight groups (read: theme) of the plugin/feature. To enable one, simply set it to `true`. 

##### Indent-blankline.nvim
- `enabled`: (Boolean) sets the regular indent character color.
- `colored_indent_levels`: (Boolean) sets indent character colors per indent level. Follow the instructions [here](https://github.com/lukas-reineke/indent-blankline.nvim#with-custom-gindent_blankline_char_highlight_list) to enable them in the plugin.

##### Native LSP
- `enabled`: (Boolean) sets the LSP diagnostic colors.
- `virtual_text/underlines`
    - `errors`: (String) changes the style of errors.
    - `hints`: (String) changes the style of hints.
    - `warnings`: (String) changes the style of warnings.
    - `information`: (String) changes the style of info.

`virtual_text` changes the style of the diagnostic text <br>
`underlines` changes the style of the text producing the error

#### Special Integrations
There are also some which are not enabled by changing `srcery.nvim` settings:

##### Lualine
```lua
require("lualine").setup {
    options = {
        theme = "srcery"
    }
}
```

### Extra
#### API
The API allows you to fetch the color palette from srcery.nvim. It can be required as such.
```lua
local colors = require("srcery.api.colors").get_colors()
```
> Returns a table of colors, where the key is the name and the value is the color's hex value.

#### Overwriting highlight groups
You can overwrite highlight groups like so:
```lua
srcery.remap({ <hi_group> = { <fields> }, })
```

Example:
```lua
local colors = require("srcery.api.colors").get_colors() -- fetch color palette
srcery.remap({ Comment = { fg = colors.red }, })
```

#### Hooks
Use them to execute code at certain events. These are the available ones:
| Function           | Description                             |
| ------------------ | --------------------------------------- |
| `before_loading()` | Executed before loading the colorscheme |
| `after_loading()`  | Executed after loading the colorscheme  |

Example:
```lua
local srcery = require("srcery")

srcery.before_loading = function()
    print("Hello from before srcery")
end
```

## Thanks to
- [Pocco81](https://github.com/Pocco81) for their [Catppuccin](https://github.com/catppuccin/nvim) colorscheme which I shamelessly stole the structure from
- [Srcery](https://github.com/srcery-color/srcery-vim) for the color palette
