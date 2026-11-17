return {
   "nvim-lualine/lualine.nvim",
   dependencies = {
      "nvim-tree/nvim-web-devicons",
   },
   opts = {
      options = {
	 component_separators = { left = '', right = ''},
         section_separators = { left = '', right = ''},
	 globalstatus = true
      },
      sections = {
	 lualine_a = { { 'mode', separator = { left = "", right = "" } } },
         lualine_b = { { 'filename', 'branch', path = 1 } },
	 lualine_c = { '%=' },
         lualine_x = {},
	 lualine_y = { 'filetype' },
         lualine_z = { { 'location', separator = { left = "", right = "" } } },
      },
   },
}

