vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.undodir = os.getenv("USERPROFILE") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

-- Set indentation to 2 spaces
local indent = vim.api.nvim_create_augroup('setIndent', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
  group = indent,
  pattern = { 'css', 'html', 'javascript',
    'lua', 'markdown', 'md', 'typescript',
    'scss', 'xml', 'xhtml', 'yaml'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Disable LSP for .proto files
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('DisableLspForProtobuf', {}),
  callback = function()
    if vim.bo.filetype ~= "proto" then
      return
    end

    vim.cmd('LspStop')
    print('hello!')
  end
})

