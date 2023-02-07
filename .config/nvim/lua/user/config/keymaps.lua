local maps = {
  telescope = {
    buffers = { key = '<leader>sb', desc = 'Telescope: [S]earch existing [B]uffers' },
    find_files = { key = '<leader>sf', desc = 'Telescope: [S]earch [F]iles' },
    grep_string = { key = '<leader>ss', desc = 'Telescope: [S]earch [S]tring' },
    help_tags = { key = '<leader>sh', desc = 'Telescope: [S]earch [H]elp' },
    keymaps = { key = '<leader>sk', desc = 'Telescope: [S]earch [K]eymaps' }
  },
  navigation = {
    next_buf = { key = '<TAB>', desc = 'Navigation: Switch to next buffer' },
    prev_buf = { key = '<S-TAB>',  desc = 'Navigation: Switch to previous buffer' },
    close_buf = { key = '<leader>ww', desc = 'Navigation: Close a buffer' },
    close_force_buf = { key = '<leader>wf', desc = 'Navigation: Close a buffer (force)' },
    win_left = { key = '<C-h>', desc = 'Navigation: Move to left split' },
    win_right = { key = '<C-l>', desc = 'Navigation: Move to right split' },
    win_down = { key = '<C-j>', desc = 'Navigation: Move to bottom split' },
    win_up = { key = '<C-k>', desc = 'Navigation: Move to top split' }
  },
  nvim_tree = {
    toggle = { key = '<leader>ee', desc = 'Nvim-tree: Toggle [E]xplorer' },
    focus = { key = '<leader>ef', desc = 'Nvim-tree: [E]xplorer [F]ocus' },
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
    format = { key = '<leader>ff', desc = 'LSP: [F]ormat document' }
  },
  cmp = {
    scroll_down = { key = '<C-d>', desc = 'CMP: Scroll [D]own docs' },
    scroll_up = { key = '<C-f>', desc = 'CMP: Scroll up docs' },
    complete = { key = '<C-Space>', desc = 'CMP: Complete the suggestion' },
    confirm = { key = '<CR>', desc = 'CMP: Confirm the suggestion' },
    next = { key = '<TAB>', desc = 'CMP: Move to next suggestion' },
    prev = { key = '<S-TAB>', desc = 'CMP: Move to previous suggestion' }
  },
  toggleterm = {
    toggle = { key = '<C-t>', desc = 'Toggleterm: [T]oggle a terminal' }
  }
}

return maps
