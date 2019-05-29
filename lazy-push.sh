###################################################################
# lazy-push
# -----------------------------------------------------------------
# Repository: https://github.com/themarcba/lazy-git
# -----------------------------------------------------------------
# This is to make a "lazy" push. There are shortcuts for the
# master and develop branch. Plus, if no branch is specified, 
# a push is made to the branch you're currently in.
# -----------------------------------------------------------------
# Use:
# - $ lazy-push.sh (master | m) (push to master)
# - $ lazy-push.sh (develop | d) (push to develop)
# - $ lazy-push.sh (push to current branch)
###################################################################

# Definition of colors to print in console
DEFAULT="\033[39m"
GREEN="\033[32m"

# Check for develop (or lazy shortcur "d")
if [ "$1" == "develop" ] || [ "$1" == "d" ]; then
    echo "\n${GREEN}(☞ﾟヮﾟ)☞ Pushing to develop...${DEFAULT}\n"
    git push origin develop

# Check for master (or lazy shortcur "m")
elif [ "$1" == "master" ] || [ "$1" == "m" ]; then
	echo "\n${GREEN}(☞ﾟヮﾟ)☞ Pushing to master...${DEFAULT}\n"
    git push origin master

# If neither develop, nor master
else
    # If no branch is specified, push to current branch
    if [ -z "$1" ]; then
        branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
        echo "\n${GREEN}(☞ﾟヮﾟ)☞ Pushing to $branch...${DEFAULT}\n"
        git push origin "$branch"

    # If there is a branch specified, push to that one
    else
        echo "\n${GREEN}(☞ﾟヮﾟ)☞ Pushing to $1...${DEFAULT}\n"
        git push origin "$1"
    fi
fi