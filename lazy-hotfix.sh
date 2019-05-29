###################################################################
# lazy-hotfix
# -----------------------------------------------------------------
# Repository: https://github.com/themarcba/lazy-git
# -----------------------------------------------------------------
# This is to manage the "git flow hotfix" commands:
#  - git flow hotfix start <hotfix version>
#  - git flow hotfix finish <hotfix version>
# -----------------------------------------------------------------
# Use:
# - $ lazy-hotfix.sh <hotfix version> (to start a hotfix)
# - $ lazy-hotfix.sh (finish | stop) <hotfix version> (to finish a specific hotfix)
# - $ lazy-hotfix.sh (finish | stop) (to finish the current hotfix)
###################################################################

# Definition of colors to print in console
DEFAULT="\033[39m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[93m"

# Check if the command for finishing a hotfix has been passed
if [ "$1" == "finish" ] || [ "$1" == "stop" ]; then

    # Get current branch name
    branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

    #Get current branch category (what's before the /)
    branch_category=`echo $branch | awk -F'/' '{print $1}'`

    #Get current branch name (what's after the /)
    branch_name=`echo $branch | awk -F'/' '{print $2}'`

    # When no version has been provided, take current version (if any)
    if [ -z "$2" ]; then
        if [ "$branch_category" == "hotfix" ]; then
            echo "\n${GREEN}Ah, I see you found the bugs in $branch_name? Great!\nGood luck with the deploy now! (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧${DEFAULT}\n"
            git flow hotfix finish $branch_name
        else
            echo "\n${RED}You're not in a hotfix branch.\nYou're in $branch (☉_☉)${DEFAULT}\n"
        fi
    
    # When a version has been provided
    else
        echo "\n${GREEN}Ah, I see you found the bugs in $2? Great!\nGood luck with the deploy now! (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧${DEFAULT}\n"
        git flow hotfix finish $2
    fi

    # Call tha actual git flow command
    git flow hotfix finish "$branch_name"

# If no command for finishing a hotfix has been passed, create a new one
else
    if [ -z "$1" ]; then
        echo "\n${YELLOW}You're trying to create a new hotfix.\nIt would be awesome if you'd provide a version number for that (╯°□°）╯︵ ┻━┻${DEFAULT}\n"
    else
        echo "\n${GREEN}Creating a new hotfix, eh?\nDon't forget to bump your version $1 •ᴗ•${DEFAULT}\n"

        # Call tha actual git flow command
        git flow hotfix start "$1"
    fi
fi