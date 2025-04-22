if status is-interactive

abbr :q "exit"
abbr reload "rm ~/.config/fish/fish_variables; exec fish"
abbr grep 'grep -E'
abbr g 'grep -E'
abbr gi 'grep -Ei'
abbr gv 'grep -Ev'
abbr giv 'grep -Eiv'
abbr cp "cp -ai"
abbr mv "mv -i"
abbr rm "rm --one-file-system -I"
abbr rmr "rm --one-file-system -I -R"
abbr rmrf "rm --one-file-system -I -Rf"
abbr ln "ln -fsi"
abbr free "free -h"
abbr sort "sort -h"
abbr du "du -hs"
abbr df "df -hT"
abbr mkdir "mkdir -p"
abbr rsync "rsync -aAxHSv --info=progress2"
abbr make "make -j (nproc)"
abbr mine "doas chown (whoami):(whoami) -R"
abbr dmesg "dmesg -ew"
abbr dd 'dd status=progress bs=1M'

abbr --position anywhere G '| grep -E'
abbr --position anywhere Gi '| grep -Ei'
abbr --position anywhere Gv '| grep -Ev'
abbr --position anywhere Giv '| grep -Eiv'
abbr --position anywhere S '| sort -h'
abbr --position anywhere --set-cursor A "| awk '{print %}'"
abbr --position anywhere H "| head -n"
abbr --position anywhere T "| tail -n"
abbr --position anywhere P "| $PAGER"
abbr --position anywhere DT "| doas tee"
abbr --position anywhere U "| uniq -u"
abbr --position anywhere C "| cut -f"
abbr --position anywhere W "| wc -l"
abbr --position anywhere Q ">/dev/null 2>&1"

if ! set -q _fish_uvars_loaded
  set -U _fish_uvars_loaded 1

  set -U fish_greeting
  set -U fish_key_bindings fish_hybrid_key_bindings
end

end
