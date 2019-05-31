#! /usr/bin/env node

let shell = require("shelljs");
const fullBranchName = require('current-git-branch');
const chalk = require('chalk');

// Read current Branch and split it into category and name
// (hotfix/1.0.3 => { category: 'hotfix', name: '1.0.3' })
let currentBranch = {
    full: fullBranchName(),
    category: fullBranchName().split('/')[0],
    name: fullBranchName().split('/')[1]
};


// Preparing the passed arguments
const args = process.argv.splice(2);

// Check if the command for finishing a hotfix has been passed
if (['finish', 'stop'].includes(args[0])) {
    let hotfixVersion = args[1];

    // When a hotfix version has been provided
    if (hotfixVersion) {
        console.log(chalk.green(`Ah, I see you found the bugs in ${hotfixVersion}? Great!`));
        console.log(chalk.green(`Good luck with the deploy! (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧`));
        shell.exec(`git flow hotfix finish ${hotfixVersion}`);
    } else {
        // When no hotfix version has been provided

        // Check if the current branch is a hotfix. If yes, finish current branch.
        if (currentBranch.category === 'hotfix') {
            console.log(chalk.green(`Ah, I see you found the bugs in ${currentBranch.name}? Great!`));
            console.log(chalk.green(`Good luck with the deploy now! (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧`));
            shell.exec(`git flow hotfix finish ${currentBranch.name}`);
        } else {
            // If the current branch is not a hotfix, it must be a mistake by the user
            console.log(chalk.red(`You're not in a hotfix branch.`));
            console.log(chalk.red(`You're in ${currentBranch.full} (☉_☉)`));
        }
    }
} else {
    // If the arguments passed are not stopping commands

    let hotfixVersion = args[0];

    // If no hotfix version has been provided, it must be a mistake by the user
    if (!hotfixVersion) {
        console.log(chalk.red('You\'re trying to create a new hotfix.'));
        console.log(chalk.red('It would be awesome if you\'d provide a version number for that (╯°□°）╯︵ ┻━┻'));

    // If a hotfix version is provided, create it
    } else {
        console.log(chalk.green(`Creating a new hotfix, eh?`));
        console.log(chalk.green(`Don't forget to bump the version in your code to ${hotfixVersion} •ᴗ•`));
        shell.exec(`git flow hotfix start "${hotfixVersion}"`);        
    }
}