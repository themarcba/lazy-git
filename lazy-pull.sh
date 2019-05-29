###################################################################
# lazy-pull
# -----------------------------------------------------------------
# Repository: https://github.com/themarcba/lazy-git
# -----------------------------------------------------------------
# This is to make a "lazy" pull. There are shortcuts for the
# master and develop branch. Plus, if no branch is specified, 
# a pull is made from the branch you're currently in.
# -----------------------------------------------------------------
# Use:
# - $ lazy-pull.sh (master | m) (pull from master)
# - $ lazy-pull.sh (develop | d) (pull from develop)
# - $ lazy-pull.sh (pull from current branch)
###################################################################

# Definition of colors to print in console
DEFAULT="\033[39m"
GREEN="\033[32m"

# Check for develop (or lazy shortcur "d")
if [ "$1" == "develop" ] || [ "$1" == "d" ]; then
    echo "\n${GREEN}(☞ﾟヮﾟ)☞ Pulling from develop...${DEFAULT}\n"
    git pull origin develop

# Check for master (or lazy shortcur "m")
elif [ "$1" == "master" ] || [ "$1" == "m" ]; then
	echo "\n${GREEN}(☞ﾟヮﾟ)☞ Pulling from master...${DEFAULT}\n"
    git pull origin master

# If neither develop, nor master
else
    # If no branch is specified, pull from current branch
    if [ -z "$1" ]; then
        branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
        echo "\n${GREEN}No branch specified. But I got you...\n(☞ﾟヮﾟ)☞ Pulling $branch...${DEFAULT}\n"
        git pull origin "$branch"
    # If there is a branch specified, pull from that one
    else
        echo "\n${GREEN}(☞ﾟヮﾟ)☞ Pulling from $1...${DEFAULT}\n"
        git pull origin "$1"
    fi
fi