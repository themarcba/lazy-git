#! /usr/bin/env node

let shell = require("shelljs");
const chalk = require('chalk');
const fullBranchName = require('current-git-branch');
let currentBranch = fullBranchName();

// Preparing and evaluating the passed arguments
const args = process.argv.splice(2);
let pushBranch = args[0];

if(pushBranch) {
    if(['d', 'develop'].includes(pushBranch)) {
        pushBranch = 'develop';
    }
    else if(['m', 'master'].includes(pushBranch)) {
        pushBranch = 'master';
    }
} else {
    pushBranch = currentBranch;
}

console.log(chalk.green(`(☞ﾟヮﾟ)☞ Pushing to ${pushBranch}...`));
// shell.exec(`git push origin ${pushBranch}`);