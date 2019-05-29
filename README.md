# lazy-git

lazy-git is a set of commands that make working with **git** and **git-flow** (even) faster.

**Attention!**
To use `lazy-feature`, `lazy-feature`, and `lazy-feature` you need to install [Git-Flow](https://github.com/nvie/gitflow/wiki/Installation) first.

If there is any problem with this repository, best is to let me know on Twitter ([@_marcba](https://www.twitter.com/_marcba)).

# Installation

*This will probably only work on Mac and Linux.*

1. Copy `lazy-*` files to a folder of your chosing (e.g. `~/Scripts/git-lazy`)
2. Give it execution rights `chmod +x lazy*.sh`
3. [Link aliases](#link-aliases) to the files for fast access (see below)

## Link aliases

The file you need to edit depends on which console you use.

* In **Linux**, if you use bash, it will be `~/.bashrc`
* In **Mac**, if you use the standard Terminal app, it will be `~.bash_profile`
* If you use [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) (as you should 😉), it will be `~/.zshrc`

Just add the aliases here. You can chose the name you want, but I suggest the following.

```bash
alias c="~/Scripts/git-lazy/lazy-commit.sh"
alias p="~/Scripts/git-lazy/lazy-push.sh"
alias pu="~/Scripts/git-lazy/lazy-pull.sh"
alias f="~/Scripts/git-lazy/lazy-feature.sh"
alias rl="~/Scripts/git-lazy/lazy-release.sh"
alias hf="~/Scripts/git-lazy/lazy-hotfix.sh"
```

*Don't forget to replace that path with where you copied the files to*

Then just **restart your console** (or open a new session) and you're ready to go.

# Use

**Important!** Replace the lazy-* command with [what you set up before](#link-aliases).

## Commit
This is to make a "lazy" commit. It autmatically adds unstaged files and commits all changes. For extra lazy developers, this can be even called without a commmit message. It'll set one for you. This is not recommended though 😉

```bash
# Commit with custom message:
$ lazy-commit <commit-message>

# Commit with version bump message:
$ lazy-commit v

# Commit with 'Updated README' message:
$ lazy-commit (rm | r)

# Commit with lazy pre-written message:
$ lazy-commit
```

## Push
This is to make a "lazy" push. There are shortcuts for the master and develop branch. Plus, if no branch is specified, a push is made to the branch you're currently in.

```bash
# Push to master:
$ lazy-push.sh (master | m)

# Push to develop:
$ lazy-push.sh (develop | d)

# Push to current branch:
$ lazy-push.sh
```

## Pull
 This is to make a "lazy" pull. There are shortcuts for the master and develop branch. Plus, if no branch is specified, a pull is made from the branch you're currently in.

 ```bash
# Pull from master:
$ lazy-pull.sh (master | m)

# Pull from develop:
$ lazy-pull.sh (develop | d)

# Pull from current branch:
$ lazy-pull.sh
```

## Feature
This is to manage the "git flow feature" commands: 
* git flow feature start <feature name> 
* git flow feature finish <feature name>

 ```bash
# Start a feature:
$ lazy-feature.sh <feature name>

# Finish a specific feature:
$ lazy-feature.sh (finish | stop) <feature name>

# Finish the current feature:
$ lazy-feature.sh (finish | stop)
```

## Release
This is to manage the "git flow release" commands: 
* git flow release start <version number> 
* git flow release finish <version number>

 ```bash
# Start a release:
$ lazy-release.sh <version number>

# Finish a specific release:
$ lazy-release.sh (finish | stop) <version number>

# Finish the current release:
$ lazy-release.sh (finish | stop)
```

## Hotfix
This is to manage the "git flow hotfix" commands: 
* git flow hotfix start <version number> 
* git flow hotfix finish <version number>

 ```bash
# Start a hotfix:
$ lazy-hotfix.sh <version number>

# Finish a specific hotfix:
$ lazy-hotfix.sh (finish | stop) <version number>

# Finish the current hotfix:
$ lazy-hotfix.sh (finish | stop)
```
