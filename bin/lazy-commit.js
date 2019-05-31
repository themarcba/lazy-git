#! /usr/bin/env node

let shell = require("shelljs");
const fullBranchName = require('current-git-branch');
const chalk = require('chalk');


let branch = fullBranchName();
let branchCategory = branch.split('/')[0];
let branchName = branch.split('/')[1];

const arguments = process.argv.splice(2);
let commitMessage = arguments[0];
// Add unstaged files
shell.exec('git add -A .');

console.log(arguments);


// If commit message was entered, commit with that message
if(commitMessage) {
    // Shortcut for version bump
    if(['v', 'version'].includes(commitMessage)) {
        console.log(chalk.green('Just bumped the version? Fine by me.'));
        console.log(chalk.green('Committing your changes (⌐■_■)'));
        shell.exec('git commit -am "Bumped the version number"');
    }
    else if(['r', 'readme'].includes(commitMessage)) {
        console.log(chalk.green('Just updated the README? That\'s important too.'));
        console.log(chalk.green('Committing your changes (⌐■_■)'));
        shell.exec('git commit -am "Updated README"');
    } else {
        console.log(chalk.green(`Committing your changes (⌐■_■) => ${arguments.join(' ')}`));
        shell.exec(`git commit -am "${arguments.join(' ')}"`);
    }
} else { // If no commit message has been entered, commit with pregenerated message
    console.log(chalk.yellow('You lazy bastard ಠ_ಠ'));
    console.log(chalk.yellow('You could at least have put a commit message'));    
}