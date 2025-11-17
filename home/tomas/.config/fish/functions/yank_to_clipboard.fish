function yank_to_clipboard -d "Send latest killring entry to system clipboard"
    printf "%s" "$fish_killring[1]" | fish_clipboard_copy
end
