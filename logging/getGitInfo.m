function git_info = getGitInfo()
    [~, commit] = system('git show --format="%h" --no-patch');

    [~, diff_stat] = system('git diff --stat');
    if diff_stat == ""
        dirty = 0;
    else
        dirty = 1;
    end

    [~, repositories] = system('git remote -v');
    
    git_info.repositories = repositories;
    git_info.commit = commit;
    git_info.dirty = dirty;
end