function git_info = getGitInfo()
    [~, commit] = system('git show --format="%h" --no-patch');
    commit = split(commit);

    [~, status] = system('git status --porcelain --untracked-files=no');
    if status == ""
        dirty = 0;
    else
        dirty = 1;
    end

    [~, repositories] = system('git remote -v');
    repositories = split(repositories);
    
    git_info.repository_fetch = repositories{2};
    git_info.repository_push = repositories{5};
    git_info.commit = commit{1};
    git_info.dirty = dirty;
end