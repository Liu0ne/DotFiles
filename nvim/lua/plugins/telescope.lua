return {
   'nvim-telescope/telescope.nvim', version = '*',
   enabled = false,
   dependencies = { 
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' },
    },
    --[[
    config = function()
       local telescope = require('telescope')
       local builtin = require('telescope.builtin')
       vim.keymap.set('n', '<leader>xx', function() builtin.find_files({hidden=true}) end, { desc = 'telescope find files' })
       vim.keymap.set('n', '<leader>xc', builtin.buffers, { desc = 'telescope buffers' })
       vim.keymap.set('n', '<leader>xh', builtin.help_tags, { desc = 'telescope help tags' })
       telescope.load_extension('fzf')
    end
    ]]--
}

-- telescope desactivado, no es que malo pero no es lo suficientemente rapido incluso con fsf
