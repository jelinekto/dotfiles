function dotfiles --wraps='git --git-dir ~/.local/share/dotfiles --work-tree /' --description 'alias dotfiles=git --git-dir ~/.local/share/dotfiles --work-tree /'
  git --git-dir ~/.local/share/dotfiles --work-tree / $argv
        
end
