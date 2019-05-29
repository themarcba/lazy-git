###################################################################
# lazy-release
# -----------------------------------------------------------------
# Repository: https://github.com/themarcba/lazy-git
# -----------------------------------------------------------------
# This is to manage the "git flow release" commands:
#  - git flow release start <release version>
#  - git flow release finish <release version>
# -----------------------------------------------------------------
# Use:
# - $ lazy-release.sh <release version> (to start a release)
# - $ lazy-release.sh (finish | stop) <release version> (to finish a specific release)
# - $ lazy-release.sh (finish | stop) (to finish the current release)
###################################################################

# Definition of colors to print in console
DEFAULT="\033[39m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[93m"

# Check if the command for finishing a release has been passed
if [ "$1" == "finish" ] || [ "$1" == "stop" ]; then

    # Get current branch name
    branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

    #Get current branch category (what's before the /)
    branch_category=`echo $branch | awk -F'/' '{print $1}'`

    #Get current branch name (what's after the /)
    branch_name=`echo $branch | awk -F'/' '{print $2}'`

    # When no version has been provided, take current version (if any)
    if [ -z "$2" ]; then
        if [ "$branch_category" == "release" ]; then
            echo "\n${GREEN}Oh boy, the release $branch_name is ready?\nGood luck with the deploy! (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧${DEFAULT}\n"
            git flow release finish $branch_name
        else
            echo "\n${RED}You're not in a release branch.\nYou're in $branch (☉_☉)${DEFAULT}\n"
        fi
    # When a version has been provided
    else
        echo "\n${GREEN}Oh boy, the release $branch_name is ready?\nGood luck with the deploy! (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧${DEFAULT}\n"
        git flow release finish $branch_name
    fi

    # Call tha actual git flow command
    git flow release finish "$branch_name"

# If no command for finishing a release has been passed, create a new one
else
    if [ -z "$1" ]; then
        echo "\n${YELLOW}You're trying to create a new release.\nIt would be awesome if you'd provide a version number for that (╯°□°）╯︵ ┻━┻${DEFAULT}\n"
    else
        echo "\n${GREEN}Creating a new release, eh?\nDon't forget to bump your version in your code to $1 •ᴗ•${DEFAULT}\n"

        # Call tha actual git flow command
        git flow release start "$1"
    fi
fi