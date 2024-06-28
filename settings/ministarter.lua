local header_art = 
[[
╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
│││├┤ │ │╰┐┌╯││││
╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
]]

-- using the mini plugins
require('mini.sessions').setup({
    -- Whether to read latest session if Neovim opened without file arguments
    autoread = false,
    -- Whether to write current session before quitting Neovim
    autowrite = false,
    -- Directory where global sessions are stored (use `''` to disable)
    directory =  '~/.vim/sessions', --<"session" subdir of user data directory from |stdpath()|>,
    -- File for local session (use `''` to disable)
    file = '' -- 'Session.vim',
})

local starter = require('mini.starter')
starter.setup({
    -- evaluate_single = true,
    items = {
        starter.sections.recent_files(10, false),
        starter.sections.recent_files(10, true),
        starter.sections.sessions(77, true),
        starter.sections.builtin_actions(),
    },
    content_hooks = {
        function(content)
            local blank_content_line = { { type = 'empty', string = '' } }
            local section_coords = starter.content_coords(content, 'section')
            -- Insert backwards to not affect coordinates
            for i = #section_coords, 1, -1 do
                table.insert(content, section_coords[i].line + 1, blank_content_line)
            end
            return content
        end,
        starter.gen_hook.adding_bullet("» "),
        starter.gen_hook.aligning('center', 'center'),
    },
    header = header_art,
    footer = '',
})

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
    highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
        todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
        note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
    },
})

-- require('mini.notify').setup()

