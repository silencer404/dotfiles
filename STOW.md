# Dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/) v2.4.1.

## 目录结构

```
dotfiles/
├── alacritty/.config/alacritty/alacritty.yml
├── nvim/.config/nvim/
├── tmux/.config/tmux/tmux.conf
├── vim/.vimrc                         # → ~/.vimrc
└── zsh/                               # → ~/.zshrc, ~/.zshenv, ~/.zprofile, ~/.config/zsh/
```

## 快速参考

```bash
cd ~/dotfiles

# 部署单个包（在 ~ 下创建符号链接）
stow nvim
stow tmux
stow vim

# 部署全部包
stow */

# 删除某个包的链接（不删源文件）
stow -D vim

# 先删再重新链接（改结构后常用）
stow -R vim

# 模拟运行，不实际创建链接
stow -n -v vim
```

## 已部署状态

| 包 | 链接目标 | 状态 |
|----|----------|------|
| `nvim` | `~/.config/nvim` | 已部署 |
| `tmux` | `~/.config/tmux` | 已部署 |
| `vim` | `~/.vimrc` | 已部署 |
| `zsh` | `~/.zshrc` 等 | 已部署 |
| `alacritty` | `~/.config/alacritty` | 未部署 |

## 添加新工具

以添加 `git` 配置为例：

```bash
# 1. 创建包目录，镜像目标路径结构
mkdir -p ~/dotfiles/git/.config/git

# 2. 把配置文件放进去
mv ~/.config/git/config ~/dotfiles/git/.config/git/config

# 3. 部署
cd ~/dotfiles && stow git
```

对于 `~/.gitrc` 这类 HOME 根目录文件：

```bash
mkdir -p ~/dotfiles/git
mv ~/.gitrc ~/dotfiles/git/.gitrc
cd ~/dotfiles && stow git
```

## 注意事项

- stow 默认以父目录（`~/dotfiles/..` 即 `~`）为 target，所以包内的 `.config/` 会链接到 `~/.config/`
- 如果目标路径已存在同名文件（非符号链接），stow 会报冲突，需要先手动移走
- `stow -R` 等价于 `stow -D` + `stow`，改完包结构后用这个最方便
- stow 包内文件名需以 `.` 开头才能映射到 `~/.xxx`，例如 `vim/.vimrc` → `~/.vimrc`
