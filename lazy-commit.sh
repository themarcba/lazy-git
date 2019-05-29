###################################################################
# lazy-commit
# -----------------------------------------------------------------
# Repository: https://github.com/themarcba/lazy-git
# -----------------------------------------------------------------
# This is to make a "lazy" commit. It autmatically adds unstaged
# files and commits all changes. For extra lazy developers, this
# can be even called without a commmit message. It'll set one
# for you. This is not recommended though ;)
# -----------------------------------------------------------------
# Use:
# $ lazy-commit.sh <commit-message> (Commit with custom message)
# $ lazy-commit.sh v (Commit with version bump message)
# $ lazy-commit.sh (rm | r) (Commit with 'Updated README' message)
# $ lazy-commit.sh (For lazy pre-written message)
###################################################################

# Definition of colors to print in console
DEFAULT="\033[39m"
GREEN="\033[32m"
YELLOW="\033[93m"

# Add unstaged files
git add -A .

# If no commit message has been entered, commit with pregenerated message
if [ -z "$1" ]; then
    echo "\n${YELLOW}You lazy bastard ಠ_ಠ\nYou could at least have put a commit message${DEFAULT}\n"
    git commit -am "I was too lazy to add a commit message ¯\_(ツ)_/¯"
# If commit message was entered, commit with that message
else
    # Shortcut for version bump
    if [ "$1" == "v" ]; then
        echo "\n${GREEN}Just bumped the version? Fine by me.\nCommitting your changes (⌐■_■)${DEFAULT}\n"
        git commit -am "Bumped the version number"
    elif [ "$1" == "rm" ] || [ "$1" == "r" ]; then
        echo "\n${GREEN}Just updated the README? That's important too.\nCommitting your changes (⌐■_■)${DEFAULT}\n"
        git commit -am "Updated README"
    else
        echo "\n${GREEN}Committing your changes (⌐■_■)${DEFAULT}\n"
        git commit -am "$*"
    fi
fi