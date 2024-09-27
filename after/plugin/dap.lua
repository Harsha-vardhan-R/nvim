local dap = require('dap')

dap.adapters.cpp = {
    type = 'executable';
    command = os.getenv('HOME') .. '/usr/bin/clang';
    args = { '-g' }
}

require('dapui').setup()
