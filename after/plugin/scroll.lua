local neoscroll = require('neoscroll')

local keymap = {
    ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 200 }) end;
    ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 200 }) end;
    ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 75 }) end;
    ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 75 }) end;
}

local extra_keymaps = {
    ["zt"]    = function() neoscroll.zt({ half_win_duration = 250 }) end;
    ["zz"]    = function() neoscroll.zz({ half_win_duration = 250 }) end;
    ["zb"]    = function() neoscroll.zb({ half_win_duration = 250 }) end;
}

local modes = { 'n', 'v', 'x'}

for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func)
end

for key, func in pairs(extra_keymaps) do
    vim.keymap.set(modes, key, func)
end


local extra_modes = { 'i' }

for key, func in pairs(keymap) do
    vim.keymap.set(extra_modes, key, func)
end

