local alpha = require 'alpha'
local dashboard = require 'alpha.themes.dashboard'

local logo = {
[[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢒⣨⣭⣶⣭⣭⣒⢤⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢪⣾⣿⣿⣿⣿⣿⣿⣿⣷⣌⢦⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⢀⢜⣴⣿⣯⣲⣿⣓⡾⣝⢿⣿⣿⣿⣧⠡⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⣿⣿⡇⠀⠀⠀⠀⠀⡠⢣⡾⣯⣭⣽⡻⣿⣿⣿⣿⡻⡽⣿⣿⣿⣇⢣⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⢰⡆⠰⣿⣿⣿⣦⣿⢿⣿⡀⠀⠀⢀⡔⣱⣿⢽⣟⣹⣿⣿⠹⣟⣛⣿⣿⣥⣿⣿⣿⣿⡜⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢾⣿⡆⠈⠛⠀⠙⣿⣯⠻⣿⡎⢿⣧⠀⢠⢊⣾⣿⣿⢯⡻⣿⠿⡟⣾⣿⠿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⡀⠀⠀⠀⠘⣿⠇⠈⠀⠀⠀⡰⣡⡿⡕⠉⠑⠳⣿⣻⡿⣷⣿⣿⣾⣿⢿⣿⣿⣿⣿⣿⢸⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⣱⣿⣇⡇⠀⠀⠈⠬⡽⠾⠿⣿⣺⢿⣾⣿⣿⣿⣿⣿⡏⡌⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⡱⠿⣿⣿⣧⠄⢄⡀⠀⠀⣀⡀⠀⠈⢋⣿⣿⣿⣿⣿⣿⢱⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⣱⣇⣼⣿⣿⣿⣷⣿⣕⡢⢄⡈⢹⡆⠀⡸⣿⣿⣿⣿⣿⢃⠇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣖⣲⣮⣿⣿⣿⣿⣿⠏⠎⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢎⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⡜⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢢⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡰⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⣡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠱⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠜⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢣⠃⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢊⣾⣧⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⢣⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⣡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣴⣿⣿⢣⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⠜⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡠⢣⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡱⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⢞⣴⣿⣿⣿⠋⢙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⡔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⡰⣡⠀⣸⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢋⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠜⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡡⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⡌⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢏⠜⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⡘⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠻⣿⣿⣿⣿⠟⡱⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⣴⣿⣿⡿⡫⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢃⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⠜⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⢀⣶⣄
⠘⢌⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣫⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⣠⣴⣦⣾⣿⡇⣾⡿⠃
⠀⠈⠢⣝⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣋⠕⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣦⣰⣿⡇⣾⣿⣿⣿⢻⣿⣿⣿⠁⠀
⠀⠀⠀⠀⠉⠒⠪⠭⠭⠭⠭⠭⠭⠐⠂⠉⠀⠀⢀⣀⠀⢀⣠⣤⣴⣾⠀⠀⢿⣿⠟⢻⣿⣿⣿⣿⣿⡏⠀⠋⠈⣿⣿⣿⣆⠀
⢠⣤⣤⣤⣤⣀⣤⡦⢀⣤⣶⣦⣤⣶⣶⢠⣾⡾⣿⣿⠀⠸⣿⡏⣉⡁⠀⠀⢸⣿⣀⣸⣿⢻⣿⣿⣿⡇⠀⠀⡀⣿⡟⢿⣿⡆
⠈⣿⡟⠙⣿⣿⣿⣷⣿⡿⠛⠿⠋⣿⣿⣿⡋⠀⣿⣿⠀⢀⣿⡟⠛⠀⠀⠀⢸⣿⠻⣿⣧⡸⣿⡏⢿⣿⣶⡿⠃⡿⠃⠀⠉⠁
⠀⣿⡷⣶⡿⠋⣿⡿⣿⣧⠀⠀⡀⣿⡿⢿⣷⣄⢹⣿⣾⣿⢿⣷⣾⣿⠀⠀⠘⠿⠀⠈⠻⠉⠋⠁⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠿⠇⠀⠀⠀⠿⠇⠙⠻⠿⠟⠋⠙⠃⠀⠉⠋⠈⠁⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 
 
]]
}

local function getGreeting()
    local datetime = os.date ' %Y-%m-%d-%A              %H:%M:%S '
    return datetime
end

local index_rand = math.random(1, #logo)
local logoLines = {}

for line in logo[index_rand]:gmatch '[^\r\n]+' do
    table.insert(logoLines, line)
end

local function update_dashboard()
    local greeting = getGreeting()
    logoLines[#logoLines] = greeting
    dashboard.section.header.val = logoLines
    alpha.redraw()
end

local timer
vim.defer_fn(function()
    update_dashboard()
    timer = vim.loop.new_timer()  -- Store the timer in a variable
    timer:start(1000, 1000, vim.schedule_wrap(update_dashboard))
end, 0)
vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "alpha",
    callback = function()
        if timer then
            timer:stop()  -- Stop the timer
            timer:close() -- Close the timer to free resources
        end
    end,
})

dashboard.section.buttons.val = {
    dashboard.button('p', '  Projects', ":lua require'telescope'.extensions.projects.projects{}<CR>"),
    dashboard.button('n', '  New file', ':ene <BAR> startinsert <CR>'),
    dashboard.button('f', '  Find file', ':cd $HOME/Documents | silent Telescope find_files hidden=true no_ignore=true <CR>'),
    dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
    dashboard.button('r', '󰄉  Recent files', ':Telescope oldfiles <CR>'),
    dashboard.button('c', '  Settings', ':e $HOME/.config/nvim/init.lua<CR>'),
    dashboard.button('q', '󰿅  Quit', '<cmd>qa<CR>'),
}

local function centerText(text, width)
    local totalPadding = width - #text
    local leftPadding = math.floor(totalPadding / 2)
    local rightPadding = totalPadding - leftPadding
    return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
end
local v = vim.version()
local version = "  v" .. v.major .. "." .. v.minor .. "." .. v.patch

dashboard.section.footer.val = {
    " ",
    " ",
    " ",
    centerText(version, 50),
}

alpha.setup(dashboard.opts)
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
vim.cmd[[ set cursorline ]]
