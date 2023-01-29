function nmap(lhs, rhs)
	vim.keymap.set('n', lhs, rhs, { noremap = false, silent = true })
end

function noremap(lhs, rhs)
	vim.keymap.set('', lhs, rhs, { noremap = true, silent = true })
end

function nnoremap(lhs, rhs)
	vim.keymap.set('n', lhs, rhs, { noremap = true, silent = true })
end

function tnoremap(lhs, rhs)
	vim.keymap.set('t', lhs, rhs, { noremap = true, silent = true })
end

function xnoremap(lhs, rhs)
	vim.keymap.set('x', lhs, rhs, { noremap = true, silent = true })
end
