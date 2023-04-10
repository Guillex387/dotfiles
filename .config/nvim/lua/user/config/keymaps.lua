local maps = {
  telescope = {
    buffers = { key = '<leader>sb', desc = 'Telescope: [S]earch existing [B]uffers' },
    find_files = { key = '<leader>sf', desc = 'Telescope: [S]earch [F]iles' },
    live_grep = { key = '<leader>ss', desc = 'Telescope: [S]earch [S]tring' },
    help_tags = { key = '<leader>sh', desc = 'Telescope: [S]earch [H]elp' },
    keymaps = { key = '<leader>sk', desc = 'Telescope: [S]earch [K]eymaps' }
  },
  navigation = {
    next_buf = { key = '<TAB>', desc = 'Navigation: Switch to next buffer' },
    prev_buf = { key = '<S-TAB>',  desc = 'Navigation: Switch to previous buffer' },
    close_buf = { key = '<C-w>', desc = 'Navigation: Close a buffer' },
    win_left = { key = '<C-h>', desc = 'Navigation: Move to left split' },
    win_right = { key = '<C-l>', desc = 'Navigation: Move to right split' },
    win_down = { key = '<C-j>', desc = 'Navigation: Move to bottom split' },
    win_up = { key = '<C-k>', desc = 'Navigation: Move to top split' },
    resize_left = { key = '<C-Left>', desc = 'Navigation: Resize the window to left' },
    resize_right = { key = '<C-Right>', desc = 'Navigation: Resize the window to right' },
    resize_down = { key = '<C-Up>', desc = 'Navigation: Resize the window to bottom' },
    resize_up = { key = '<C-Down>', desc = 'Navigation: Resize the window to top' }
  },
  nvim_tree = {
    toggle = { key = '<leader>ee', desc = 'Nvim-tree: Toggle [E]xplorer' },
    cd = { key = '<leader>ec', desc = 'Nvim-tree: [E]xplorer [C]hange directory' },
    add = { key = 'a', desc = 'Nvim-tree: [A]dd a file/directory' },
    rm = { key = 'd', desc = 'Nvim-tree: [D]elete a file/directory' },
    rn = { key = 'r', desc = 'Nvim-tree: [R]ename a file/directory' }
  },
  comment = {
    toggle = { key = '<leader>cc', desc = 'Comment: Toggle comment' }
  },
  lsp = {
    rename = { key = '<leader>lr', desc = 'LSP: [R]e[n]ame' },
    code_action = { key = '<leader>la', desc = 'LSP: [C]ode [A]ction' },
    definition = { key = '<leader>ll', desc = 'LSP: Goto Definition' },
    implementation = { key = '<leader>li', desc = 'LSP: Goto [I]mplementation' },
    type = { key = '<leader>lt', desc = 'LSP: Goto [T]ype definition' },
    symbols = { key = '<leader>lw', desc = 'LSP: [W]orkspace symbols' },
    documentation = { key = '<leader>ld', desc = 'LSP: Hover [D]ocumentation' },
    diagnostic = { key = '<leader>dd', desc = 'LSP: Toggle actual [D]iagnostic' },
    format = { key = '<leader>ff', desc = 'LSP: [F]ormat document' }
  },
  cmp = {
    scroll_down = { key = '<C-d>', desc = 'CMP: Scroll [D]own docs' },
    scroll_up = { key = '<C-f>', desc = 'CMP: Scroll up docs' },
    complete = { key = '<C-Space>', desc = 'CMP: Complete the suggestion' },
    confirm = { key = '<CR>', desc = 'CMP: Confirm the suggestion' },
    next = { key = '<TAB>', desc = 'CMP: Move to next suggestion' },
    abort = { key = '<C-e>', desc= 'CMP: Abort the menu' },
    prev = { key = '<S-TAB>', desc = 'CMP: Move to previous suggestion' },
    snip_next = { key = '<C-n>', desc = 'CMP: Move to next field of the snippet' },
    snip_prev = { key = '<C-b>', desc = 'CMP: Move to previous field of the snippet' }
  },
  toggleterm = {
    toggle = { key = '<C-t>', desc = 'Toggleterm: [T]oggle a terminal' }
  },
  git = {
    toggle = { key = '<leader>gg', desc = 'GitSigns: Toggle [G]it hunks' }
  },
  indent = {
    vtab = { key = '<TAB>', desc = 'Indent: Tab a selection' },
    vdetab = { key = '<S-TAB>', desc = 'Indent: Detab a selection' }
  }
}

return maps
