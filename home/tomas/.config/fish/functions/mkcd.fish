function mkcd
  mkdir -p "$argv[1]" 
  or return
  cd "$argv[1]"
end
