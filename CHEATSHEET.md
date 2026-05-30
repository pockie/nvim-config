# Neovim Cheat Sheet

> `<Leader>` = <kbd>Space</kbd>

## Edit Mode

| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `A` | Insert at end of line |
| `I` | Insert at beginning of line |
| `o` | New line below |
| `O` | New line above |
| `s` | Delete character and insert |
| `S` | Delete line and insert |
| `C` | Delete from cursor to end and insert |
| `D` | Delete from cursor to end |
| `x` | Delete character |
| `dd` | Delete (cut) line |
| `yy` | Yank (copy) line |
| `p` | Paste below |
| `P` | Paste above |
| `u` | Undo |
| `<C-r>` | Redo |
| `<A-j>` | Move line down |
| `<A-k>` | Move line up |
| `.` | Repeat last change |

## Navigation (Motions)

| Key | Action |
|-----|--------|
| `w` / `b` | Word forward / backward |
| `e` | End of word |
| `0` | Beginning of line |
| `^` | First non-whitespace of line |
| `$` | End of line |
| `{` / `}` | Paragraph up / down |
| `gg` | Beginning of file |
| `G` | End of file |
| `H` / `M` / `L` | Screen top / middle / bottom |
| `%` | Matching bracket |
| `<C-d>` / `<C-u>` | Page down / up |
| `<C-f>` / `<C-b>` | Full page down / up |

## Search

| Key | Action |
|-----|--------|
| `/text` | Search forward |
| `?text` | Search backward |
| `*` | Search word under cursor (forward) |
| `#` | Search word under cursor (backward) |
| `n` / `N` | Next / previous match |

## Go to Line

| Key | Action |
|-----|--------|
| `:{number}` | Go to line `{number}` |
| `{number}gg` | Go to line `{number}` |
| `{number}G` | Go to line `{number}` |
| `<C-o>` / `<C-i>` | Jump back / forward |

## Windows & Tabs

| Key | Action |
|-----|--------|
| `<C-w>v` | Vertical split |
| `<C-w>s` | Horizontal split |
| `<C-w>h/j/k/l` | Navigate splits |
| `<C-w>w` | Cycle splits |
| `gt` / `gT` | Next / previous tab |
| `{n}gt` | Go to tab `{n}` |
| `:tabnew` | New tab |
| `:tabclose` | Close tab |
| `:tablast` | Last tab |

## Telescope

| Key | Action |
|-----|--------|
| `<Leader>ff` | Find files |
| `<Leader>fg` | Live grep (search in files) |
| `<Leader>fb` | Buffers |
| `<Leader>fh` | Help tags |
| `<CR>` | Open in current window |
| `<C-t>` | Open in new tab |
| `<C-v>` | Open in vertical split |
| `<C-x>` | Open in horizontal split |

## Debugging (DAP)

| Key | Action |
|-----|--------|
| `<F5>` | Start / continue |
| `<F7>` | Step into |
| `<F8>` | Step over |
| `<S-F8>` | Step out |
| `<Leader>db` | Toggle breakpoint |
| `<Leader>dB` | Set conditional breakpoint |
| `<Leader>dc` | Run to cursor |
| `<Leader>dq` | Disconnect debugger |
| `<Leader>dQ` | Close debug adapter |

## Mason

| Key | Action |
|-----|--------|
| `<Leader>mm` | Open Mason menu |
| `:MasonInstall {pkg}` | Install package |
| `:MasonUninstall {pkg}` | Uninstall package |
| `:MasonUpdate` | Update registry |

## File Operations

| Key | Action |
|-----|--------|
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save and quit |
| `:q!` | Force quit (discard changes) |
| `:e` | Reload file |
| `:e {file}` | Open file |
| `-` | Open Oil (file explorer) |

## Visual Mode

| Key | Action |
|-----|--------|
| `v` | Character-wise visual |
| `V` | Line-wise visual |
| `<C-v>` | Block-wise visual |
| `<A-j>` | Move selection down |
| `<A-k>` | Move selection up |
| `>` / `<` | Indent / dedent |
| `y` | Yank selection |
| `d` | Delete selection |

## LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |
| `gi` | Go to implementation |
| `[d` / `]d` | Previous / next diagnostic |
| `<C-Space>` | Trigger completion |
