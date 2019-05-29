###################################################################
# lazy-feature
# -----------------------------------------------------------------
# Repository: https://github.com/themarcba/lazy-git
# -----------------------------------------------------------------
# This is to manage the "git flow feature" commands:
#  - git flow feature start <feature name>
#  - git flow feature finish <feature name>
# -----------------------------------------------------------------
# Use:
# - $ lazy-feature.sh <feature name> (to start a feature)
# - $ lazy-feature.sh (finish | stop) <feature name> (to finish a specific feature)
# - $ lazy-feature.sh (finish | stop) (to finish the current feature)
###################################################################

# Definition of colors to print in console
DEFAULT="\033[39m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[93m"

# Check if the command for finishing a feature has been passed
if [ "$1" == "finish" ] || [ "$1" == "stop" ]; then

    # Get current branch name
    branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

    #Get current branch category (what's before the /)
    branch_category=`echo $branch | awk -F'/' '{print $1}'`

    #Get current branch name (what's after the /)
    branch_name=`echo $branch | awk -F'/' '{print $2}'`
    
    # When no feature name has been provided, take current feature name (if any)
    if [ -z "$2" ]; then
        if [ "$branch_category" == "feature" ]; then
            echo "\n${GREEN}Your work is done in $branch_name?\nAwesome! Let's get this badboy to develop (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧${DEFAULT}\n"
            git flow feature finish $branch_name
        else
            echo "\n${RED}You're not in a feature branch.\nYou're in $branch (☉_☉)${DEFAULT}\n"
        fi
    # When a feature name has been provided
    else
        echo "\n${GREEN}Your work is done in $2?\nAwesome! Let's get this badboy to develop (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧${DEFAULT}\n"
        git flow feature finish $2
    fi

# If no command for finishing a feature has been passed, create a new one
else
    if [ -z "$1" ]; then
        echo "\n${YELLOW}You're trying to create a new feature.\nIt would be awesome if you'd provide a name for that (╯°□°）╯︵ ┻━┻${DEFAULT}\n"
    else
        echo "\n${GREEN}Creating a new feature, eh?\nHave an awesome time working on $1 •ᴗ•${DEFAULT}\n"

        # Call tha actual git flow command
        git flow feature start "$1"
    fi
fi