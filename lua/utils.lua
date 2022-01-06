function nmap(lhs,rhs)
	vim.api.nvim_set_keymap('n',lhs,rhs,{noremap = false, silent=true})
end

function noremap(lhs,rhs)
	vim.api.nvim_set_keymap('',lhs,rhs, { noremap = true , silent=true} )
end

function nnoremap(lhs,rhs)
	vim.api.nvim_set_keymap('n',lhs,rhs, { noremap = true, silent=true} )
end

function tnoremap(lhs,rhs)
	vim.api.nvim_set_keymap('t',lhs,rhs, { noremap = true, silent=true} )
end

function xnoremap(lhs,rhs)
	vim.api.nvim_set_keymap('x',lhs,rhs, { noremap = true, silent=true} )
end
