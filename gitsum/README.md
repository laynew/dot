# gitsum

Displays a summary of a git repositories in source folder(s) to see at a glance if there are repositories with pending changes, untracked local branches, repositories that have not been pushed to a remote, folders that are not git repositories, etc. This way you know quickly what needs to be commited, pushed, etc, in order to keep your source repos up to date and to limit "unsaved" work.

Summary should include warnings about the following conditions:
- Folders that are not git repositories
- Git repositories with no remotes (i.e. local-only)
- Branches with no upstream
- Branches behind upstream
- Uncommited local changes

Things to add later:
- Maybe a way to quickly do a `git fetch` on all repositories
