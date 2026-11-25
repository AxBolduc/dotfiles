# Interactive setup only. Variables: conf.d/00_env.fish; PATH: conf.d/01_paths.fish.
# Machine-local, never in the repo: conf.d/secrets.fish, conf.d/work.fish.
if status is-interactive
    fish_vi_key_bindings

    function last_history_item
        echo $history[1]
    end
    abbr -a !! --position anywhere --function last_history_item
end
