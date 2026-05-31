alias vi='nvim'
#alias ls='eza '
#alias ll='ls -al'
#alias l='ls -a'
alias sduo='sudo '

# Eza aliases - 使用 eza 替代 ls

# === 基础替换 ===
alias ls="eza --icons"
alias ll="eza -l --icons"
alias la="eza -la --icons"
alias lt="eza --sort=modified --icons"
alias lS="eza --sort=size --icons"

# === Tree 显示 ===
alias tree="eza --tree --icons"
alias tree2="eza --tree --level=2 --icons"
alias tree3="eza --tree --level=3 --icons"
alias tree4="eza --tree --level=4 --icons"

# === Git 状态 ===
alias lg="eza -l --git --icons"
alias llg="eza -la --git --icons"
alias ltg="eza --tree --git --icons"
alias treeg="eza --tree --git --icons"
alias tree2g="eza --tree --level=2 --git --icons"
alias tree3g="eza --tree --level=3 --git --icons"

# === 详细视图 ===
alias lh="eza -l --icons -h --group-directories-first"

# === 按时间/大小排序 ===
alias lsd="eza -l --sort=modified --icons"
alias lsS="eza -l --sort=size --icons"

