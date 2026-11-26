local opt = vim.opt

-- Números de linha
opt.number = true
opt.relativenumber = true

-- Tabulação e recuos (4 espaços)
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Busca inteligente
opt.ignorecase = true
opt.smartcase = true

-- Aparência e performance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300

-- Integração com clipboard do sistema
opt.clipboard = "unnamedplus"
opt.fillchars:append({eob = " "})

-- Limpa automaticamente buffers vazios sem nome [No Name] quando um arquivo real for aberto
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("CleanEmptyNoNameBuffer", { clear = true }),
	callback = function(event)
		local prev_buf = vim.fn.bufnr("#")
		if prev_buf > 0 and prev_buf ~= event.buf and vim.api.nvim_buf_is_valid(prev_buf) then
			local name = vim.api.nvim_buf_get_name(prev_buf)
			local lines = vim.api.nvim_buf_get_lines(prev_buf, 0, -1, false)
			local is_empty = #lines == 0 or (#lines == 1 and lines[1] == "")
			local is_modified = vim.bo[prev_buf].modified

			-- Se o buffer anterior não tinha nome, não foi modificado e está vazio, deleta ele
			if name == "" and is_empty and not is_modified then
				vim.schedule(function()
					if vim.api.nvim_buf_is_valid(prev_buf) then
						require("mini.bufremove").delete(prev_buf, false)
					end
				end)
			end
		end
	end,
})
