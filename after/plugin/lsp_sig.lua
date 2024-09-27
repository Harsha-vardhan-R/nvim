require "lsp_signature".setup({
      floating_window_above_cur_line = true,
      max_height = 5,
      max_width = 70,

      floating_window_off_x = 35,
      hint_prefix = "☕ ",
      transparency = 15,

      doc_lines = 0,

      extra_trigger_chars = { ",", "(", "{" },
      select_signature_key = '<m-s>',

      hint_inline = function() return false end
})
