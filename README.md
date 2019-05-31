# lazy-git

lazy-git is a set of commands that make working with **git** and **git-flow** (even) faster.

**Attention!**
To use `lazy-feature`, `lazy-feature`, and `lazy-feature` you need to install [Git-Flow](https://github.com/nvie/gitflow/wiki/Installation) first.

If there is any problem with this repository, best is to let me know on Twitter ([@_marcba](https://www.twitter.com/_marcba)).

# Installation

```bash
npm i -g lazy-git
```

# Use

## Commit
This is to make a "lazy" commit. It autmatically adds unstaged files and commits all changes. For extra lazy developers, this can be even called without a commmit message. It'll set one for you. This is not recommended though 😉

```bash
# Commit with custom message:
$ c <commit-message>

# Commit with version bump message:
$ c v

# Commit with 'Updated README' message:
$ c (rm | r)

# Commit with lazy pre-written message:
$ c
```

## Push
This is to make a "lazy" push. There are shortcuts for the master and develop branch. Plus, if no branch is specified, a push is made to the branch you're currently in.

```bash
# Push to master:
$ p (master | m)

# Push to develop:
$ p (develop | d)

# Push to current branch:
$ p
```

## Pull
 This is to make a "lazy" pull. There are shortcuts for the master and develop branch. Plus, if no branch is specified, a pull is made from the branch you're currently in.

 ```bash
# Pull from master:
$ pu (master | m)

# Pull from develop:
$ pu (develop | d)

# Pull from current branch:
$ pu
```

## Feature
This is to manage the "git flow feature" commands: 
* git flow feature start <feature name> 
* git flow feature finish <feature name>

 ```bash
# Start a feature:
$ f <feature name>

# Finish a specific feature:
$ f (finish | stop) <feature name>

# Finish the current feature:
$ f (finish | stop)
```

## Release
This is to manage the "git flow release" commands: 
* git flow release start <version number> 
* git flow release finish <version number>

 ```bash
# Start a release:
$ rl <version number>

# Finish a specific release:
$ rl (finish | stop) <version number>

# Finish the current release:
$ rl (finish | stop)
```

## Hotfix
This is to manage the "git flow hotfix" commands: 
* git flow hotfix start <version number> 
* git flow hotfix finish <version number>

 ```bash
# Start a hotfix:
$ hf <version number>

# Finish a specific hotfix:
$ hf (finish | stop) <version number>

# Finish the current hotfix:
$ hf (finish | stop)
```
