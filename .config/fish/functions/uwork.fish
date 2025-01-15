function uwork --wraps=cd\ \~/.local/share/timewarrior/data/\;\ git\ add\ .\;\ git\ commit\ -m\ \'update\' --wraps=pushd\ \~/.local/share/timewarrior/data/\;\ git\ add\ .\;\ git\ commit\ -m\ \'update\'\;\ popd --description alias\ uwork\ pushd\ \~/.local/share/timewarrior/data/\;\ git\ add\ .\;\ git\ commit\ -m\ \'update\'\;\ popd
  pushd ~/.local/share/timewarrior/data/; git add .; git commit -m 'update'; popd $argv
        
end
