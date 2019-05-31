#! /usr/bin/env node

let shell = require("shelljs");
const fullBranchName = require('current-git-branch');
const chalk = require('chalk');

// Read current Branch and split it into category and name
// (feature/add_github_login => { category: 'feature', name: 'add_github_login' })
let currentBranch = {
    full: fullBranchName(),
    category: fullBranchName().split('/')[0],
    name: fullBranchName().split('/')[1]
};


// Preparing the passed arguments
const args = process.argv.splice(2);

// Check if the command for finishing a feature has been passed
if (['finish', 'stop'].includes(args[0])) {
    let featureName = args[1];

    // When a feature name has been provided
    if (featureName) {
        console.log(chalk.green(`Your work is done in ${featureName}?`));
        console.log(chalk.green(`Awesome! Let's get this badboy to develop (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧`));
        shell.exec(`git flow feature finish ${featureName}`);
    } else {
        // When no feature name has been provided

        // Check if the current branch is a feature. If yes, finish current branch.
        if (currentBranch.category === 'feature') {
            console.log(chalk.green(`Your work is done in ${currentBranch.name}?`));
            console.log(chalk.green(`Awesome! Let's get this badboy to develop (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧`));
            shell.exec(`git flow feature finish ${currentBranch.name}`);
        } else {
            // If the current branch is not a feature, it must be a mistake by the user
            console.log(chalk.red(`You're not in a feature branch.`));
            console.log(chalk.red(`You're in ${currentBranch.full} (☉_☉)`));
        }
    }
} else {
    // If the arguments passed are not stopping commands

    let featureName = args[0];

    // If no feature name has been provided, it must be a mistake by the user
    if (!featureName) {
        console.log(chalk.red('You\'re trying to create a new feature.'));
        console.log(chalk.red('It would be awesome if you\'d provide a name for that (╯°□°）╯︵ ┻━┻'));

    // If a feature name is provided, create it
    } else {
        console.log(chalk.green(`Creating a new feature, eh?`));
        console.log(chalk.green(`Have an awesome time working on ${featureName} •ᴗ•`));
        shell.exec(`git flow feature start "${featureName}"`);        
    }
}