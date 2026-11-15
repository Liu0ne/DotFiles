function background_transparent(Object)	    
    vim.api.nvim_set_hl(0, Object, { bg = "none"})
end

return {
    {
	"rebelot/kanagawa.nvim",
	config = function()
	    vim.cmd.colorscheme "kanagawa"
	    background_transparent('Normal')
	    background_transparent('CursorLineNr')
	    background_transparent('TelescopeBorder')
	    background_transparent('StatusLine')
	    background_transparent('StatusLineNr')
	    vim.api.nvim_set_hl(0, 'LineNr', { bg = "none", fg = "#4d699b"})
	end
    }
}
