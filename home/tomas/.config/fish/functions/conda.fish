function conda
  if ! type -fq conda
    source /opt/miniconda3/etc/fish/conf.d/conda.fish
  end

  conda $argv
end
